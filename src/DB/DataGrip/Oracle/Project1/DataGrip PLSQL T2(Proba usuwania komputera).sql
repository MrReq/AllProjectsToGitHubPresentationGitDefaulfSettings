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
