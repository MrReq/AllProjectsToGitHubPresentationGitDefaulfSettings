/*
    Procedura o nazwie: DaneKlienta
    Przyjmuje 3 parametry: v_IdKlienta typu int
    v_Imie OUT
    v_Nazwisko OUT
    Procedura wyświetla imie i nazwisko Klienta o podanym id
 */
CREATE OR REPLACE PROCEDURE DaneKlienta
    (v_IdKlienta KLIENT.IDUZYTKOWNIKA%type,
    v_Imie OUT KLIENT.IMIE%type,
    v_Nazwisko OUT KLIENT.NAZWISKO%type)
IS
BEGIN
    SELECT IMIE, NAZWISKO
    INTO v_Imie, v_Nazwisko
    FROM KLIENT
    WHERE KLIENT.IDUZYTKOWNIKA = v_IdKlienta;
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('Klient o podanym id nie istnieje');
END;

DECLARE
    v_ImieOUT KLIENT.IMIE%type;
    v_NazwiskoOUT KLIENT.NAZWISKO%type;
BEGIN
    DaneKlienta(10,v_ImieOUT,v_NazwiskoOUT);
    IF v_ImieOUT IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Imie: '||v_ImieOUT||
         ' Nazwisko: '||v_NazwiskoOUT);
    end if;
end;

