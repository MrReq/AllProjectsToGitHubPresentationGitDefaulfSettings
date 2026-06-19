CREATE OR ALTER PROCEDURE Zapisz_Gracza_Do_Turnieju
(
    @p_id_gracza INT,
    @p_id_turnieju INT
)
AS
BEGIN

    DECLARE @v_count INT;

    PRINT 'p_id_gracza=' + CAST(@p_id_gracza AS VARCHAR(10));

    SELECT @v_count = COUNT(*)
    FROM Gracz
    WHERE IDGracza = @p_id_gracza;

    PRINT 'v_count=' + CAST(@v_count AS VARCHAR(10));

    IF @v_count = 0
    BEGIN
        RAISERROR(
            'Gracz o podanym ID nie istnieje.',
            16,
            1
        );
        RETURN;
    END

    SELECT @v_count = COUNT(*)
    FROM Turniej
    WHERE IDTurnieju = @p_id_turnieju;

    IF @v_count = 0
    BEGIN
        RAISERROR(
            'Turniej o podanym ID nie istnieje.',
            16,
            1
        );
        RETURN;
    END

    BEGIN TRY

        INSERT INTO RejestracjaWTurnieju
        (
            GraczIDGracza,
            TurniejIDTurnieju
        )
        VALUES
        (
            @p_id_gracza,
            @p_id_turnieju
        );

        PRINT
            'Gracz '
            + CAST(@p_id_gracza AS VARCHAR(10))
            + ' zostal zapisany do turnieju '
            + CAST(@p_id_turnieju AS VARCHAR(10));

    END TRY

    BEGIN CATCH

        PRINT 'Blad: ' + ERROR_MESSAGE();

    END CATCH

END;
GO

EXEC Zapisz_Gracza_Do_Turnieju
    @p_id_gracza = 7,
    @p_id_turnieju = 21;
GO