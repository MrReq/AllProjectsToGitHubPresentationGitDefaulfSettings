/*
 Deklaracja zmiennych:
    v_iloscGraczy typu int
    v_NewGraczID typu int
    v_NewKlientID typu int

 */
DECLARE
    v_iloscGraczy int;
    v_NewGraczID GRACZ.IDGRACZA%type;
    v_NewKlientID KLIENT.IDUZYTKOWNIKA%type;
    v_Info Varchar2(100);
/*
 Dodanie nowego klienta i zarazem gracza jeśli jest mniej niż 100 graczy
 */
BEGIN
    SELECT COUNT (*)
    INTO v_iloscGraczy
    from GRACZ;
    SELECT COUNT (*) + 1
    INTO v_NewGraczID
    FROM GRACZ;
    SELECT COUNT (*) + 1
    INTO v_NewKlientID
    FROM KLIENT;
    IF v_iloscGraczy < 100 THEN
        INSERT INTO KLIENT
        VALUES (v_NewKlientID,'RandomName','RandomSurname' ,
       DATE'2000-05-05','M',20384591232,'RandomNationality',
        'RandomCity',1847264002);
        DBMS_OUTPUT.PUT_LINE('Dodano nowego klienta o id = '||v_NewKlientID);
        INSERT INTO GRACZ
        VALUES (v_NewGraczID,0,0,v_NewKlientID);
        DBMS_OUTPUT.PUT_LINE('Dodano nowego gracza o id = '||v_NewGraczID);
    end if;
end;