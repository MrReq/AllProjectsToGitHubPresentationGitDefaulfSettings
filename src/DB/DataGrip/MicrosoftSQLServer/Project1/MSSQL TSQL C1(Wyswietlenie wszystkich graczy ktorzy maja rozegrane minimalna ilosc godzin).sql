USE [s27593]
DROP PROCEDURE IF EXISTS PokazAktywnychGraczyZLiczbaGodzinWiekszaNiz;
CREATE PROCEDURE PokazAktywnychGraczyZLiczbaGodzinWiekszaNiz
(
    @p_min_godzin INT
)
AS
BEGIN
    DECLARE
        @v_id_gracza INT,
        @v_godziny DECIMAL(10,2),
        @v_gry INT;
    DECLARE c_gracze CURSOR FOR
        SELECT
            IDGracza,
            LiczbaRozegranychGodzin,
            LiczbaRozegranychGier
        FROM Gracz
        WHERE LiczbaRozegranychGodzin > @p_min_godzin;
    OPEN c_gracze;
    FETCH NEXT FROM c_gracze
    INTO @v_id_gracza, @v_godziny, @v_gry;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT
            'Gracz ID: ' + CAST(@v_id_gracza AS VARCHAR(10))
            + ', Godziny: ' + CAST(@v_godziny AS VARCHAR(20))
            + ', Gry: ' + CAST(@v_gry AS VARCHAR(10));
        FETCH NEXT FROM c_gracze
        INTO @v_id_gracza, @v_godziny, @v_gry;
    END
    CLOSE c_gracze;
    DEALLOCATE c_gracze;
END;

create procedure Po(
    @pmingodz int
)
AS
BEGIN
    DECLARE
        @idGracza int,
        @iloscrozegranychGodzin int,
        @IloscrozegranychGier int
    DECLARE kursor cursor FOR
        SELECT IDGracza, IloscRozegranychGodzin,@IloscrozegranychGier
        FROM Gracz
        WHERE liczbarozegrancyhgodzin > @pmingodz
    Open kursor
    FETCH NEXT FROM kursor
    INTO @idGracza, @iloscrozegranychGodzin, @IloscrozegranychGier
    WHILE @@FETCH_STATUS = 0
    BEGIN
        Print 'Gracz o id '+@idGracza + ' rozegrał '+ @IloscrozegranychGier + ' gier o czasie ' + @iloscrozegranychGodzin
        FETCH NEXT FROM kursor
        INTO @idGracza, @iloscrozegranychGodzin, @IloscrozegranychGier
    end
    CLOSE kursor
    DEALLOCATE kursor
end

create procedure pokazaktywnych(
    @mingodzin int
)
AS
    BEGIN
        DECLARE
            @idgracza int,
            @iloscrozegranychgodzin int,
            @iloscrozegranychgier int
        Declare kursor cursor FOR
            SELECT IDGracza, IloscRozegranychGodzin, IloscRozegranychGier
            From Gracz
            WHERE IloscRozegranychGodzin > @mingodzin
        Open kursor
        Fetch next from kursor
        Into @idgracza, @iloscrozegranychgodzin, @iloscrozegranychgier;
        WHILE @@FETCH_STATUS = 0
            BEGIN
                Print 'Gracz o id '+ @idgracza +'rozegrał '+ @iloscrozegranychgodzin + 'zagrał w '+@iloscrozegranychgier;
                Fetch next from kursor
                Into @idgracza, @iloscrozegranychgodzin, @iloscrozegranychgier
            end

        Close kursor
        DEALLOCATE kursor
    end


CREATE PROCEDURE PokazAktywnych(
    @mingodzin int
)
AS
    BEGIN
    DECLARE
        @idGracza int,
        @iloscrozegrancyhGodzin2 int,
        @IloscRozegranychGier int

    Declare kursor cursor FOR
    Select IDGracza , IloscRozegrancyhGodzin, IloscRozegrancyhGier
    FROM GRACZ
    Where liczbaRozegranychGodzin > @mingodzin;

    Open kursor
    Fetch next from kursor
    Into @idGracza, @iloscrozegrancyhGodzin2, @IloscRozegranychGier
    While @@FETCH_STATUS = 0
        Begin

        end
    Close kursor
    DEALLOCATE kursor
end


EXECUTE PokazAktywnychGraczyZLiczbaGodzinWiekszaNiz 10;

create procedure pokazaktywnych
(@pVMingodzin Int)
AS
Begin
    declare
        @v_idGracza int,
        @LiczbarozegrancyhGodzin int,
        @LiczbaRozegranychGier int

    declare kursor cursor for
            SELECT
                idGracza,
                LiczbarozegranychGodzin,
                LiczbaRozegranychGier
            FROM Gracz
            where liczbaRozegranychGodzin > pVMinGodzin

    Open kursor
            fetch next from kursor
            into @v_idGracza,@LiczbarozegrancyhGodzin,@LiczbaRozegranychGier

            While @@FetchStatus=0
            Begin
                Print 'Gracz ID: ' + Cast(@v_idGracza AS VArchar(10)) + ...

                fetch next from kursor
                into @v_idGracza,@idLiczbarozegrancyhGodzin,@LiczbaRozegranychGier
            END
    close kursor
    DEALLOCATE kursor

execute pokazaktywnych(10)