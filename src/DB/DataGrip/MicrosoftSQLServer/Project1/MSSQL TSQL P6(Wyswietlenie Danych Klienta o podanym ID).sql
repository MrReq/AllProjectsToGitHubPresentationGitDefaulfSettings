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


create procedure DaneKlient (@vidKlienta int, @vImieKlienta Varchar(100) OUTPUT, @vNazwiskoKlienta Varchar(100) OUTPUT)
AS
Begin
    if not exists(
       select 1
       from Klient
       where IDKlient = @vidKlienta
    )
       Begin
            raiserror ('brak takiego klienta'16,1)
       END

    SELECT
        @v_Imie = Imie
        @Nazisko = Naziwsko
    From Klient
    where IDUzytkownika = @vidKlienta

    Print('Dane klient o podanym id '+ Cast(IDUzytkownika AS Varchar ()))

END

Declare
    @Imie VARchar(10)
    @Naziwsko VARchar(10) OUTPUT

EXEC DaneKlienta 10,@IMIE, @Nazwisko