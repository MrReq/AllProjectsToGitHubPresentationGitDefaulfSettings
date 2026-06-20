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

CREATE TRIGGER TRKW
ON KLIENT
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS(
        SELECT 1
        FROM INSERTED
        WHERE DATEDIFF(Year, DataUrodzenia, getdate()) < 13
    )
    BEGIN
        raiserror ('Klient nie może mieć mniej niż 13 lat',16,1);
        Rollback transaction;
        Return;
    end
end

CREATE TRIGGER TRKW
ON KLIENT
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS(
        SELECT 1
        FROM inserted
        WHERE DATEDIFF(Year, DataUrodzenia, getdate()) < 13
    )
    BEGIN
        raiserror ('Klient musi mieć więcej niż 13 lat',16,1);
        Rollback transaction ;
        RETURN;
    end
end

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

create Trigger TR_klient_wiek
ON Klient
After insert OR Update
AS
    Begin
        if exist(
           select * from inserted where datediff(year, dataurodzenia, getdate()) < 13
           )
        Begin
            raiserror ('Klient musi miec conajmniej 13 lat',16,1)
            ROLLBACK TRANSACTION
            return
        end
    end

create trigger TR_K_W
On klient
After Insert OR UPDATE
As
    Begin
        if exist(
           select *
           From inserted
           where datediff(year, DataUrodzenia, GETDATE()) < 13
           )
                Begin
                    raiserror ('Klient musi miec wiecej niz 13 lat',16,1)
                    ROLLBACK TRANSACTION
                    return
                end
    end

create trigger TR_K_W
On klient
After Insert Or Update
As
    Begin
        if exist(
           select *
           from inserted
           where datediff(year, DataUropdzenia, getdate()) < 13
           )
        Begin
            raiserror ('Klient musi miec wiecej niz 13 lat', 16,1)
            rollback transaction
            return
        end
    end

create trigger trkw
on Klient
after Insert or Update
As
Begin
    if exist(
       select * from inserted where datediff(year, DataUrodzenia, getdate()) < 13
       )
    Begin
        raiserror ('Klient musi miec wiecej niz 13 lat',16,1)
        ROLLBACK transaction
        return
    end
end