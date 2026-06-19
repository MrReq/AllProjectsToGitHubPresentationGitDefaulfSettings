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
CALL AktualizacjaNazwyTurnieju('Nowy Turniej')