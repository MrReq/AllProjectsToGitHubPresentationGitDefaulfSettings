USE [s27593]
DROP TRIGGER IF EXISTS TRG_KLIENT_WIEK;

CREATE TRIGGER TRG_KLIENT_WIEK
ON Klient
AFTER INSERT, UPDATE
AS
BEGIN

    IF EXISTS
    (
        SELECT *
        FROM inserted
        WHERE DATEDIFF(YEAR, DataUrodzenia, GETDATE()) < 13
    )
    BEGIN

        RAISERROR(
            'Klient musi miec co najmniej 13 lat.',
            16,
            1
        );

        ROLLBACK TRANSACTION;

        RETURN;

    END

END;

INSERT INTO Klient
VALUES
(
    100,
    'Test1',
    'Test1',
    '2000-01-01',
    'M',
    2845932012,
    'Polskie',
    'Warszawa',
    1847264002
);

INSERT INTO Klient
VALUES
(
    101,
    'Test2',
    'Test2',
    '2000-01-01',
    'M',
    12345677901,
    'Polskie',
    'Warszawa',
    1847264002
);