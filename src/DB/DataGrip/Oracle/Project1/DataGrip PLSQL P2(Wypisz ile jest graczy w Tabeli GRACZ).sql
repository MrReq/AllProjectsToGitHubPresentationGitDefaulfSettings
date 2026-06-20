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

DECLARE
    v_iloscgraczy2 int;

BEGIN
    SELECT COUNT (*)
    into v_iloscgraczy2
    From Gracz;
    DBMS_OUTPUT.PUT_LINE ('W tabeli gracz jest ' ||v_iloscgraczy2 || ' graczy');
END;


DECLARE
    vcounter int;
BEGIN
    SELECT COUNT(*) INTO vcounter FROM GRACZ;
    DBMS_OUTPUT.PUT_LINE('W tabeli GRACZ jest '|| vcounter || ' graczy');
end;
