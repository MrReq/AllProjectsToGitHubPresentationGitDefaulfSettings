USE [s27593]
DROP PROCEDURE IF EXISTS DaneKlienta;

CREATE PROCEDURE DaneKlienta
(
    @v_IdKlienta INT,
    @v_Imie VARCHAR(100) OUTPUT,
    @v_Nazwisko VARCHAR(100) OUTPUT
)
AS
BEGIN

    IF NOT EXISTS
    (
        SELECT 1
        FROM Klient
        WHERE IDUzytkownika = @v_IdKlienta
    )
    BEGIN
        PRINT 'Klient o podanym id nie istnieje';
        RETURN -1;
    END

    SELECT
        @v_Imie = Imie,
        @v_Nazwisko = Nazwisko
    FROM Klient
    WHERE IDUzytkownika = @v_IdKlienta;

    RETURN 0;

END;

DECLARE
    @Imie VARCHAR(100),
    @Nazwisko VARCHAR(100),
    @Result INT;

EXEC @Result = DaneKlienta
    10,
    @Imie OUTPUT,
    @Nazwisko OUTPUT;

IF @Result = 0
BEGIN
    PRINT 'Imie: ' + @Imie
        + ' Nazwisko: ' + @Nazwisko;
END;
