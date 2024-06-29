create or replace procedure MAIN1(p_member_id IN INT,
    p_class_name IN VARCHAR2,
    p_lesson_date IN DATE) IS
    class_id INT;
    can_attend BOOLEAN;
BEGIN
    -- מציאת מזהה הקורס לפי השם
    BEGIN
        SELECT ClassId INTO class_id 
        FROM Gym_Class 
        WHERE ClassName = p_class_name
        AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Class ' || p_class_name || ' not found.');
            RETURN;
    END;

    -- קריאה לפונקציה לבדיקת מגבלות רפואיות
    can_attend := CanMemberAttendClass(p_member_id, class_id);

    IF can_attend THEN
        -- קריאה לפרוצדורה לרישום הקורס
        RegisterMemberToLesson(p_member_id, class_id, p_lesson_date);
        DBMS_OUTPUT.PUT_LINE('Member ' || p_member_id || ' successfully registered to class ' || p_class_name || ' on ' || TO_CHAR(p_lesson_date, 'YYYY-MM-DD HH:MM:SS'));
    ELSE
        DBMS_OUTPUT.PUT_LINE('Member ' || p_member_id || ' cannot attend class ' || p_class_name || ' due to medical constraints.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
 
end MAIN1;
/
