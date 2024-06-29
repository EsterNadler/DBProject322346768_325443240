CREATE OR REPLACE FUNCTION CanMemberAttendClass(MemberId IN INT, p_ClassId IN INT) RETURN BOOLEAN IS
    CURSOR member_constraints_cursor IS
        SELECT MedicalConstrains FROM Gym_Member_Medical_Constrains WHERE PersonId = MemberId;
    CURSOR class_constraints_cursor IS
        SELECT Medical_Constrains FROM Gym_Class_Medical_Constrains WHERE ClassId = p_ClassId;
    member_constraint VARCHAR2(50);
    class_constraint VARCHAR2(50);
    member_birthdate DATE;
    member_age INT;
    min_age INT;
    max_age INT;
BEGIN
    -- Retrieve the member's birth date
    SELECT BirthDate INTO member_birthdate FROM Person WHERE PersonId = MemberId;

    -- Calculate the member's age
    member_age := TRUNC((SYSDATE - member_birthdate) / 365.25);

    -- Retrieve the class's MinAge and MaxAge
    SELECT MinAge, MaxAge INTO min_age, max_age FROM Gym_Class WHERE ClassId = p_ClassId;

    -- Check if the member's age is within the allowed range
    IF member_age < min_age OR member_age > max_age THEN
        RETURN FALSE;
    END IF;

    OPEN member_constraints_cursor;
    LOOP
        FETCH member_constraints_cursor INTO member_constraint;
        EXIT WHEN member_constraints_cursor%NOTFOUND;

        OPEN class_constraints_cursor;
        LOOP
            FETCH class_constraints_cursor INTO class_constraint;
            EXIT WHEN class_constraints_cursor%NOTFOUND;
            IF member_constraint = class_constraint THEN
                RETURN FALSE;
            END IF;
        END LOOP;
        CLOSE class_constraints_cursor;
    END LOOP;
    CLOSE member_constraints_cursor;
    RETURN TRUE;
EXCEPTION
    WHEN OTHERS THEN
        RETURN FALSE;
END CanMemberAttendClass;
/
