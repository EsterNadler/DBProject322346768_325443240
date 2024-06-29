CREATE OR REPLACE FUNCTION findAvailableTrainerForClass(classId IN INT, lessonDay IN DATE, lessonHour IN VARCHAR2) RETURN NUMBER IS
    l_cursor SYS_REFCURSOR;
    l_trainerId NUMBER;
    l_availableTrainerId NUMBER := NULL;
    l_availableTrainersCount INT := 0;
BEGIN
    -- Open cursor to find available trainers
    OPEN l_cursor FOR
        SELECT t.PersonId
        FROM Trainer t
        WHERE NOT EXISTS (
            SELECT 1
            FROM Lesson l
            WHERE t.PersonId = l.PersonId
            AND l.LessonDate = lessonDay
            AND TO_CHAR(l.LessonDate, 'HH24:MI:SS') = lessonHour
        )
        AND EXISTS (
            SELECT 1
            FROM Gym_Class gc
            WHERE gc.ClassId = classId
        );
    -- Loop through cursor results
    LOOP
        FETCH l_cursor INTO l_trainerId;
        EXIT WHEN l_cursor%NOTFOUND;
        l_availableTrainersCount := l_availableTrainersCount + 1;
        
        -- Store first available trainer ID
        IF l_availableTrainerId IS NULL THEN
            l_availableTrainerId := l_trainerId;
        END IF;
    END LOOP;
    CLOSE l_cursor;
    -- Return available trainer ID (or NULL if none)
    RETURN l_availableTrainerId;
EXCEPTION
    WHEN OTHERS THEN
        -- Handle exceptions
        IF l_cursor%ISOPEN THEN
            CLOSE l_cursor;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END findAvailableTrainerForClass;
/
