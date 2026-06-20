/*
 Procedura o nazwie AktualizacjaNazwyTurnieju, która aktualizuje nazwę ostatnio dodanego turnieju
 Domyślnie nazwę turnieju ustawia na 'DefaultName'
 */
CREATE OR REPLACE PROCEDURE AktualizacjaNazwyTurnieju
(
    v_nowaNazwaTurnieju TURNIEJ.NAZWATURNIEJU%TYPE DEFAULT 'DefaultName'
)
IS
    v_lastTurniejID TURNIEJ.IDTURNIEJU%TYPE;
BEGIN

    SELECT MAX(IDTURNIEJU)
    INTO v_lastTurniejID
    FROM TURNIEJ;

    UPDATE TURNIEJ
    SET NAZWATURNIEJU = v_nowaNazwaTurnieju
    WHERE IDTURNIEJU = v_lastTurniejID;

    DBMS_OUTPUT.PUT_LINE(
        'Nazwa ostatniego turnieju zostala zaktualizowana na '
        || v_nowaNazwaTurnieju
    );

END;
/*
 wywołanie procedury AktualizacjaNazwyTurnieju z argumentem 'Nowy Turniej'
 */
CALL AktualizacjaNazwyTurnieju('Nowy Turniej');

create or replace procedure AktualizacjaNazwyTurnieju(
       v_nowanazwaTurnieju Varchar(20) DEFAULT 'Default'
)
IS
    v_lastIDTurnieju int;
BEGIN
    SELECT MAX(IDTurnieju)
    INTO v_lastIDTurnieju
    FROM Turniej;

    UPDATE Turniej
    SET NazwaTurnieju = v_nowanazwaTurnieju
    Where IDTurnieju = v_lastIdturnieju;
    DBMS_OUTPUT.PUT_LINE('Nazwa ostatnio dodanego turnieju została zaktualizowana na '+ v_nowanazwaTurnieju);
end;