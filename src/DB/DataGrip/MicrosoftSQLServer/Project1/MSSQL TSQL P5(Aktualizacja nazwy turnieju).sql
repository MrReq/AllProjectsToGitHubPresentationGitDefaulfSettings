USE [s27593]
DROP PROCEDURE IF EXISTS AktualizacjaNazwyTurnieju;
CREATE PROCEDURE AktualizacjaNazwyTurnieju
(
    @v_nowaNazwaTurnieju VARCHAR(100) = 'DefaultName'
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @v_lastTurniejID INT;
    SELECT @v_lastTurniejID = MAX(IDTurnieju)
    FROM Turniej;
    UPDATE Turniej
    SET NazwaTurnieju = @v_nowaNazwaTurnieju
    WHERE IDTurnieju = @v_lastTurniejID;
    PRINT
        'Nazwa ostatniego turnieju zostala zaktualizowana na '
        + @v_nowaNazwaTurnieju;
END;
EXEC AktualizacjaNazwyTurnieju 'Nowy Turniej'

create procedure AktualizacjaNazwyTurnieju(
    @nowaNazwaTurnieju Varchar(100) = 'DefaultName'
)
AS
BEGIN
    SET nocount on;
    Declare @lastIDturnieju int
    Select @lastIDturnieju= MAX(IDTurnieju)
    From Turniej;

    UPDATE Turniej
    SET NazwaTurnieju = @nowaNazwaTurnieju;
    Where IDTurnieju = @lastIDturnieju
    Print 'Nazwa turnieju została zaktualizowana na  '+ @nowaNazwaTurnieju
END

EXECUTE AktualizacjaNazwyTurnieju 'aaaa'

create procedure AktualizacjaNazwyTurnieju (
    @nowanazwaturnieju Varchar(100) = 'Defaultname'
)
AS
    BEGIN
        set nocount on;
        DECLARE @lastIDturnieju int
        SELECT @lastIDturnieju = MAX(IDTUrnieju)
        From Turniej

        UPDATE Turniej
        SET NazwaTurnieju = @nowanazwaturnieju
        Where IDturnieju = @lastIDTurnieju
        Print 'Zmieniono nazwę ostatniego turnieju na  '+ @nowaNazwaTurnieju
    end

EXECUTE AktualizacjaNazwyTurnieju 'bbb'
EXECUTE AktualizacjaNazwyTurnieju