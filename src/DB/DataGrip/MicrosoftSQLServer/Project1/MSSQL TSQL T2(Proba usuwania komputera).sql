USE [s27593]
DROP TRIGGER IF EXISTS TR_KOMPUTER_DELETE;

CREATE TRIGGER TR_KOMPUTER_DELETE
ON KOMPUTER
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR
    (
        'Nie mozna usuwac rekordow z tabeli KOMPUTER',
        16,
        1
    );
END;


DELETE FROM KOMPUTER
WHERE IDKOMPUTERA = 10;
-----------------------
CREATE TRIGGER TRBD
ON KOMPUTER
BEFORE DELETE
AS
BEGIN
    raiserror ('Zaden komputer nie może zostać usunięty');
end



create trigger trkd
on komputer
instead of delete
As
Begin
   raiserror ('Nie można usuwać rekordów z tabeli komputery ',16,1)
end

delete From Komputer
where IDKOMPUTERA = 10;
-------------
create trigger trki
On komputer
instead of delete
AS
BEGIN
    raiserror ('Nie można usuwać danych z tabeli Komputer',16,1)
end

Delete FROM Komputer
where IDKOMPUTERA = 10;