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

CREATE OR REPLACE PROCEDURE pok(
    p_mingodzin int
)
IS
    CURSOR kursor IS
    SELECT
        idGracza, liczbaRozegranychGodzin, liczbaRozegranychGier
        FROM Gracz
        WHERE liczbarozegranychGodzin > p_mingodzin;
    @idGracza int;
    @liczbarozegranychGodzin int;
    @liczbaRozegranychGier int;
BEGIN
    OPEN kursor;
    Loop;
        FETCH kursor
        INTO idGracza, liczbarozegranychGodzin, liczbaRozegranychGier;
        EXIT WHEN kursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Gracz o id '||idGracza||' rozegrał '||liczbaRozegranychGier||' w czasie '||liczbarozegranychGodzin||' godzin');
    end loop;
    CLOSE kursor;
end;


CREATE OR REPLACE PROCEDURE poka(
    vmingodzin int
)
IS
    CURSOR kursor IS
        SELECT IDGracza, LiczbaRozegranychGodzin, LiczbaRozegranychGier
        From Gracz
        WHERE LiczbaRozegranychGodzin > vmingodzin;
    vidGracz int;
    vLiczbaRozegranychGodzin int;
    vLiczbaRozegranychGier int;

BEGIN
    Open kursor;
    LOOP
        FETCH kursor
        Into vidGracz, vLiczbaRozegranychGodzin, vLiczbaRozegranychGier;
        EXIT WHEN kursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE();
    end loop;
    close kursor;
end;









Create or replace procedure pokaz(
    v_mingodzin int
)
IS
    Cursor kursor IS
        SELECT IDGracza , LiczbaRozegrancyhGodzin, LiczbaRozegranychGier
        From Gracz
        WHERE LiczbaRozegrancyhGodzin > v_mingodzin;

    vidGracza int;
    vliczbarozegranychgodzin int;
    vliczbarozegranychgier int;
BEGIN
    Open kursor;
    Loop
        FETCH next from kursor
        Into vidGracza,vliczbarozegranychgodzin,vliczbarozegranychgier;
        Exit when kursor%notFound;
        DBMS_OUTPUT.PUT_LINE();
    end loop;
    Close kursor;
END

create OR replace procedure pokaz(
    vmingodzin int
)
IS
    Cursor kursor IS
        SELECT IDGracza , liczbarozegranychgodzin, liczbarozegranychgier
        From Gracz
        Where liczbarozegranychgodzin > vmingodzin;

    vIdGracza int;
    vliczbarozegranychgodzin int
    vliczbarozegranychgier int
BEGIN
    open kursor;
    Fetch next from kursor
    Into vIdGracza, vliczbarozegranychgodzin, vliczbarozegranychgier;
    Loop
        EXIT When kursor%NOTFOUND;

    end loop;
    close kursor;
end;

create or replace procedure pokazaktywnych
       (pMingodzin int)
IS
    cursor kursor is
        select
            IDGracza,
            LiczbaRozegranychGodzin,
            LichbaRozegrancyhGier
        From Gracz
        Where Liczbarozegranychgodzin > pMingodzin;

    vIdGracza Gracz.IDGracza%TYPE;
    vLiczbaRozegranychGodzin Gracz.liczbaRozegranychGodzin%type;
    vLiczbaRozegranychGier Gracz.LiczbaRozegranychGier%TYPE;

    Begin
        Open kursor;
        Loop
            fetch kursor
            into  vIdGracza,vLiczbaRozegranychGodzin,vLiczbaRozegranychGier;

            Exit when kursor%notFound;
            DBMS_OUTPUT.PUT_LINE('Gracz o id '||vIdGracza);
        end loop;
        close kursor;
    end;