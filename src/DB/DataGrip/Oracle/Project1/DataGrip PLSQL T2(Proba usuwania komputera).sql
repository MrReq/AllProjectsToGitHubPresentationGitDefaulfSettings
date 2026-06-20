/*
 Wyzwalacz który nie pozwoli na usuwanie rekordów z Tablicy komputer
 */
CREATE OR REPLACE TRIGGER TR_KOMPUTER_DELETE
BEFORE DELETE
ON KOMPUTER
BEGIN
 raise_application_error(-20001,'Nie można usuwać rekordów z tabeli KOMPUTER');
END;

/*
 Próba usunięcia komputera o podanym id 10
 */
DELETE FROM KOMPUTER
WHERE KOMPUTER.IDKOMPUTERA = 10;
--------------------------
CREATE OR REPLACE TRIGGER TRKBD
BEFORE DELETE
ON KOMPUTER
BEGIN
    raise_application_error(-20010,'nie można usuwac komputerow');
end;

CREATE OR REPLACE TRIGGER TRKBD
BEFORE DELETE
ON KOMPUTER
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'nie można usuwac komputerow')
end;



create or replace trigger trkd
before delete
on Komputer
begin
    raise_application_error(-20010,'Nie można usuwać rekordów z tabeli komputer');
end;

create or replace trigger trkbd
before delete
On Komputer
Begin
    raise_a
end;