CREATE OR REPLACE PROCEDURE RegisterMemberToLesson(
    p_MemberId IN INT,
    p_ClassId IN INT,
    p_LessonDate IN DATE
) IS
    CURSOR class_capacity IS
        SELECT l.LessonId AS LessonID,
               COUNT(tl.PersonId) AS CurrentCapacity,
               r.Capacity
        FROM Lesson l
        LEFT JOIN Takes_Lesson tl ON l.LessonId = tl.LessonId AND l.ClassId = tl.ClassId
        JOIN Room r ON l.RoomNum = r.RoomNum
        WHERE l.ClassId = p_ClassId
          AND TRUNC(l.LessonDate) = TRUNC(p_LessonDate)
        GROUP BY l.LessonId, r.Capacity;
   
    v_lesson_id INT;
    v_current_capacity INT;
    v_room_capacity INT;
    v_is_registered BOOLEAN := FALSE;
BEGIN
    FOR rec IN class_capacity LOOP
        v_lesson_id := rec.LessonID;
        v_current_capacity := rec.CurrentCapacity;
        v_room_capacity := rec.Capacity;
       
        IF v_current_capacity < v_room_capacity THEN
            -- רישום החבר לקורס
            INSERT INTO Takes_Lesson (LessonId, ClassId, PersonId)
            VALUES (v_lesson_id, p_ClassId, p_MemberId);
            
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Member ' || p_MemberId || ' successfully registered to class ' || p_ClassId || ' on ' || TO_CHAR(p_LessonDate, 'YYYY-MM-DD'));
            v_is_registered := TRUE;
            EXIT;  -- Exit the loop after successful registration
        END IF;
    END LOOP;
    
    IF NOT v_is_registered THEN
        DBMS_OUTPUT.PUT_LINE('Class ' || p_ClassId || ' on ' || TO_CHAR(p_LessonDate, 'YYYY-MM-DD') || ' is full. No more students can be registered.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred during registration: ' || SQLERRM);
        ROLLBACK;
END RegisterMemberToLesson;
/
