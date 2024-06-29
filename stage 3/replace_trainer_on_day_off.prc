CREATE OR REPLACE PROCEDURE replace_trainer_on_day_off(
    p_trainer_id IN NUMBER,
    p_day_off IN DATE
) AS
    CURSOR c_trainer_lessons IS
        SELECT l.LessonId, l.ClassId, TO_CHAR(l.LessonDate, 'HH24:MI:SS') AS LessonHour
        FROM Lesson l
        WHERE l.PersonId = p_trainer_id
        AND TRUNC(l.LessonDate) = TRUNC(p_day_off);
    
    l_new_trainer_id NUMBER;
    l_replaced_count NUMBER := 0;
    l_failed_count NUMBER := 0;
    l_trainer_name VARCHAR2(100);
    l_day_off_lessons_count NUMBER;
    
    e_no_lessons EXCEPTION;
    e_trainer_not_found EXCEPTION;
    
    PRAGMA EXCEPTION_INIT(e_trainer_not_found, -20001);
BEGIN
    -- בדיקה אם המאמן קיים
    BEGIN
        SELECT FirstName || ' ' || LastName
        INTO l_trainer_name
        FROM Person
        WHERE PersonId = p_trainer_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE e_trainer_not_found;
    END;
    
    -- בדיקה אם יש שיעורים ביום החופש
    SELECT COUNT(*)
    INTO l_day_off_lessons_count
    FROM Lesson
    WHERE PersonId = p_trainer_id
    AND TRUNC(LessonDate) = TRUNC(p_day_off);
    
    IF l_day_off_lessons_count = 0 THEN
        RAISE e_no_lessons;
    END IF;
    
    -- לוג תחילת הפעולה
    DBMS_OUTPUT.PUT_LINE('Starting to replace lessons for trainer ' || l_trainer_name || ' on ' || TO_CHAR(p_day_off, 'DD-MON-YYYY'));
    
    -- מעבר על כל השיעורים וניסיון להחלפת המאמן
    FOR lesson IN c_trainer_lessons LOOP
        BEGIN
            l_new_trainer_id := findAvailableTrainerForClass(lesson.ClassId, p_day_off, lesson.LessonHour);
            
            IF l_new_trainer_id IS NOT NULL THEN
                UPDATE Lesson
                SET PersonId = l_new_trainer_id
                WHERE LessonId = lesson.LessonId;
                
                l_replaced_count := l_replaced_count + 1;
                
                -- קבלת שם המאמן החדש
                SELECT FirstName || ' ' || LastName
                INTO l_trainer_name
                FROM Person
                WHERE PersonId = l_new_trainer_id;
                
                DBMS_OUTPUT.PUT_LINE('Lesson ' || lesson.LessonId || ' reassigned to trainer ' || l_trainer_name);
            ELSE
                l_failed_count := l_failed_count + 1;
                DBMS_OUTPUT.PUT_LINE('No available trainer found for lesson ' || lesson.LessonId);
            END IF;
        EXCEPTION
            WHEN OTHERS THEN
                l_failed_count := l_failed_count + 1;
                DBMS_OUTPUT.PUT_LINE('Error processing lesson ' || lesson.LessonId || ': ' || SQLERRM);
        END;
    END LOOP;
    
    -- סיכום הפעולה
    DBMS_OUTPUT.PUT_LINE('Replacement summary:');
    DBMS_OUTPUT.PUT_LINE('Total lessons: ' || l_day_off_lessons_count);
    DBMS_OUTPUT.PUT_LINE('Successfully replaced: ' || l_replaced_count);
    DBMS_OUTPUT.PUT_LINE('Failed to replace: ' || l_failed_count);
    
    -- בדיקה אם כל השיעורים הוחלפו בהצלחה
    IF l_replaced_count = l_day_off_lessons_count THEN
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('All lessons successfully replaced. Changes committed.');
    ELSE
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Not all lessons were replaced. Changes rolled back.');
    END IF;

EXCEPTION
    WHEN e_trainer_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Error: Trainer with ID ' || p_trainer_id || ' not found.');
    WHEN e_no_lessons THEN
        DBMS_OUTPUT.PUT_LINE('No lessons found for trainer ' || l_trainer_name || ' on ' || TO_CHAR(p_day_off, 'DD-MON-YYYY'));
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
        ROLLBACK;
END replace_trainer_on_day_off;
/
