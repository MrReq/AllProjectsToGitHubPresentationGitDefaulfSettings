USE [s27593]
DECLARE
    @v_iloscGraczy INT,
    @v_NewGraczID INT,
    @v_NewKlientID INT,
    @v_Info VARCHAR(100);
SELECT @v_iloscGraczy = COUNT(*)
FROM Gracz;
SELECT @v_NewGraczID = COUNT(*) + 1
FROM Gracz;
SELECT @v_NewKlientID = COUNT(*) + 1
FROM Klient;
IF @v_iloscGraczy < 100
BEGIN
    INSERT INTO Klient
    VALUES
    (
        @v_NewKlientID,
        'RandomName',
        'RandomSurname',
        '2000-05-05',
        'M',
        '20384591232',
        'RandomNationality',
        'RandomCity',
        1847264002
    );
    PRINT 'Dodano nowego klienta o id = ' + CAST(@v_NewKlientID AS VARCHAR(10));
    INSERT INTO Gracz
    VALUES
    (
        @v_NewGraczID,
        0,
        0,
        @v_NewKlientID
    );
    PRINT 'Dodano nowego gracza o id = '
        + CAST(@v_NewGraczID AS VARCHAR(10));
END
ELSE
BEGIN
    PRINT 'Osiagnieto maksymalna liczbe graczy';
END;