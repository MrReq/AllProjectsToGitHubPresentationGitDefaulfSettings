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