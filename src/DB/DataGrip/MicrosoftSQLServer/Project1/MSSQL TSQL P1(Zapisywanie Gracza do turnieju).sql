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
        RAISERROR('Gracz o podanym ID nie istnieje.',16,1);
        RETURN;
    END
    SELECT @v_count = COUNT(*)
    FROM Turniej
    WHERE IDTurnieju = @p_id_turnieju;
    IF @v_count = 0
    BEGIN RAISERROR('Turniej o podanym ID nie istnieje.',16,1);
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

CREATE PROCEDURE ZAPISZ(
    @pidgracza int,
    @pidTurnieju int
)
AS
BEGIN
    DECLARE @counter int

    SELECT @counter = COUNT (*) FROM GRACZ WHERE IDGRacza = @pidgracza;
    IF @counter = 0
    BEGIN
        PRINT 'nie ma takiego gracza';
        raiserror ('nie ma takiego gracza ',16,1);
    end
    SELECT @counter = COUNT (*) FROM TURNIEJ WHERE IDTurnieju = @pidTurnieju
    IF @counter = 0
    BEGIN
        PRINT 'nie ma takiego turnieju';
        raiserror ('nie ma takiego turnieju ',16,1);
    end
    BEGIN TRY
        INSERT INTO RejestracjaWTurnieju (IDGracza, IDTurnieju)
        VALUES  (@pidgracza,@pidTurnieju)
    END TRY
    BEGIN CATCH
        Print ' Uwaga blad ' + ERROR_MESSAGE();
    end catch
end

EXEC Zapisz_Gracza_Do_Turnieju
    @p_id_gracza = 7,
    @p_id_turnieju = 21;
GO

CREATE procedure ZapiszdoTurnieju(
        @piDGracza int,
        @piDTurnieju int
)
AS
    BEGIN
        DECLARE @vCount int
        Select @vCount =  Count(*) From Gracz Where IDGracza = @piDGracza
        if @vCount = 0
        Begin
            raiserror ('Podany gracz nie istnieje',16,1);
        end

        select @vCount =  Count(*) From Turniej Where IDTurnieju = @iDTurnieju
        if @vCount = 0
        Begin
            raiserror ('Podany turniej nie istnieje',16,1);
        end

        Begin Try
            Insert into RejestracjaWTurnieju (GraczIDGracza,TurniejIDTurnieju)
            values (@vIDGracza, @vIDTurnieju)
        End TRY

        Begin CATCH
            Print 'Blad '+ ERROR_MESSAGE()
        end catch
    end

Exec ZapiszDoTurnieju (7,21)

declare procedure ZapiszGraczaDoTurnieju(
    @vIDGracza int
    @vIDTurniej int
    )
AS
    BEGIN
        declare @vCount int
        Select @vCount = Count (*) From Gracz where IDGracza = @vIDGracza
        if @vCount = 0
        Begin
            raiserror ('Podany gracz nie istnieje',16,1)
        end
        Select @vCount = Count(*) From Turniej  where IDTurnieju = @vIDTurniej
        if @vCount = 0
        Begin
            raiserror ('Podany turniej nie istnieje',16,1)
        end
        Begin Try
            Insert Into RejestracjaGraczaWTurnieju (GraczIDGracza, TurniejIDTurnieju)
            values (@vIDGracza,@vIDTurniej)
        End TRY
        BEGIN CATCH
            Print 'Blad ' + error_message()
        end catch
    end

Execute ZapiszGaraczaDoTurnieju (7,12)