create or replace procedure MAIN2(p_trainer_id IN NUMBER, p_day_off IN DATE) is
begin
    replace_trainer_on_day_off(p_trainer_id, p_day_off);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in main procedure: ' || SQLERRM);
end MAIN2;
/
