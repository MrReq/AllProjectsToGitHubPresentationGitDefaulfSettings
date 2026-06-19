/*
    Deklaracja zmiennej v_iloscGraczy typu int
 */
DECLARE
    v_iloscGraczy int;
/*
    Przeliczenie ile jest Graczy w tabeli GRACZ
 */
BEGIN
    SELECT COUNT(*)
    INTO v_iloscGraczy
    FROM GRACZ;
    DBMS_OUTPUT.PUT_LINE(
    'W Tabeli GRACZ jest ' || v_iloscGraczy
    || ' graczy'
    );
end;

