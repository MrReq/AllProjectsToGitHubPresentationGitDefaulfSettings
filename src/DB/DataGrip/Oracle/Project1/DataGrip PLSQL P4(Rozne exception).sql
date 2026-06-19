DECLARE
    v_nazwaKomputeraz KOMPUTER.NAZWA%type;
BEGIN
--     SELECT NAZWA INTO v_nazwaKomputeraz FROM KOMPUTER WHERE IDKOMPUTERA = 1000;
--     SELECT NAZWA INTO v_nazwaKomputeraz FROM KOMPUTER WHERE IDKOMPUTERA IN (1,2,3);
--     INSERT INTO KOMPUTER VALUES (1,'RandomComputerName',DATE'2000-01-01','Windows'
--     ,'IBM',2000);
    SELECT 10/0 INTO v_nazwaKomputeraz FROM DUAL;
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('Nie ma takiej wartosci');
    WHEN too_many_rows THEN
        DBMS_OUTPUT.PUT_LINE('Wiecej niż jedna wartosc');
    WHEN dup_val_on_index THEN
        DBMS_OUTPUT.PUT_LINE('Naruszenie wiezow unikalnosci');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Inny blad');
end;

