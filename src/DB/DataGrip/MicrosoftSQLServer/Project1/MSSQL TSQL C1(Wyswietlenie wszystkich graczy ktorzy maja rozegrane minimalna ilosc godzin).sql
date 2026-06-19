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


EXECUTE PokazAktywnychGraczyZLiczbaGodzinWiekszaNiz 10;