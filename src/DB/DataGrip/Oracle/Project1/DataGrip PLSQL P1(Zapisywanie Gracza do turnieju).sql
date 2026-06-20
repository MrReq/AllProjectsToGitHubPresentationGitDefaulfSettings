/*
    Procedura o nazwie: Zapisz_Gracza_Do_Turnieju
    Przyjmuje dwa parametry: id gracza jako int i id turnieju jako int
    Podnosi exception jeśli gracz o podanym ID nie istnieje
    Podnosi exception jeśli turniej o podanym ID nie istnieje
    Jeżeli jest próba podwojenia rekordu to komunikat że gracz jest już sapisany do turnieju
 */
CREATE OR REPLACE PROCEDURE Zapisz_Gracza_Do_Turnieju (
    p_id_gracza   IN NUMBER,
    p_id_turnieju IN NUMBER
)
IS
    v_count NUMBER;
BEGIN
     DBMS_OUTPUT.PUT_LINE('p_id_gracza=' || p_id_gracza);
    -- Sprawdzenie czy gracz istnieje
    SELECT COUNT(*)
    INTO v_count
    FROM Gracz
    WHERE IDGracza = p_id_gracza;
     DBMS_OUTPUT.PUT_LINE('v_count=' || v_count);
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001,
            'Gracz o podanym ID nie istnieje.');
    END IF;
    -- Sprawdzenie czy turniej istnieje
    SELECT COUNT(*)
    INTO v_count
    FROM Turniej
    WHERE IDTurnieju = p_id_turnieju;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20002,
            'Turniej o podanym ID nie istnieje.');
    END IF;
    -- Dodanie rejestracji
    INSERT INTO RejestracjaWTurnieju
    VALUES (p_id_gracza, p_id_turnieju);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(
        'Gracz ' || p_id_gracza ||
        ' został zapisany do turnieju ' ||
        p_id_turnieju
    );
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE(
            'Gracz jest już zapisany do tego turnieju.'
        );
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(
            'Błąd: ' || SQLERRM
        );
END;
/*
 Wywołanie procedury Zapisz_Gracza_Do_Turnieju dla argumentów id gracza 7 i id turnieju 21
 */
BEGIN
    Zapisz_Gracza_Do_Turnieju(7, 21);
END;
SELECT COUNT(*)
FROM Gracz;

create or replace procedure zapiszdoturnieju(
       pidGracza int, pIdturnieju int
)
IS
@vCount int;
Begin
    Select Count (*)
    INTO @vCount
    From Gracz
    Where IDGracza = pidGracza;
    if @vCount = 0 THEN
        raise_application_error(-20010, 'Nie ma takiego gracza');
    end if;
    Select Count(*)
    INTO @vCount
    From Turniej
    Where IDTurnieju = pIdturnieju;
    if @vCount = 0 THEN
        raise_application_error(-20010, 'Podany turniej nie istnieje');
    end if;
    Insert INTO RejestracjaWTurnieju
        values (pidGracza , pIdturnieju);
    DBMS_OUTPUT.PUT_LINE('Gracz został dodany do turnieju');
EXception
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Podany gracz jest już zapisany do turnieju');
     WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Inny blad '||SQLERRM);
    end;