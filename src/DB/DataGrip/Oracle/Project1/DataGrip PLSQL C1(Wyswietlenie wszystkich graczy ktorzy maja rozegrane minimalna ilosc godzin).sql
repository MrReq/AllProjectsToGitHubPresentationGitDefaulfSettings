/*
    Nazwa Procedury: Pokaz_Aktywnych_Graczy
    Przyjmowany parametr: p_min_godzin o typie integer
    Sposób działania:Przejście kursorem przez graczy mających więcej rozegranych godzin niż w podanym argumencie
    Za każdym razem kod wypisze:  Gracz ID:  .. , Godziny: ... , Gry: ...
 */
CREATE OR REPLACE PROCEDURE Pokaz_Aktywnych_Graczy (
    p_min_godzin IN NUMBER
)
IS
    CURSOR c_gracze IS
        SELECT IDGracza,
               LiczbaRozegranychGodzin,
               LiczbaRozegranychGier
        FROM Gracz
        WHERE LiczbaRozegranychGodzin > p_min_godzin;

    v_id_gracza Gracz.IDGracza%TYPE;
    v_godziny   Gracz.LiczbaRozegranychGodzin%TYPE;
    v_gry       Gracz.LiczbaRozegranychGier%TYPE;

BEGIN
    OPEN c_gracze;

    LOOP
        FETCH c_gracze
        INTO v_id_gracza, v_godziny, v_gry;

        EXIT WHEN c_gracze%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Gracz ID: ' || v_id_gracza ||
            ', Godziny: ' || v_godziny ||
            ', Gry: ' || v_gry
        );
    END LOOP;

    CLOSE c_gracze;
END;

/*
    Wywołanie procedury Pokaz_Aktywnych_Graczy o rozegranych więcej niż 50 godzin
 */
BEGIN
    Pokaz_Aktywnych_Graczy(50);
END;


