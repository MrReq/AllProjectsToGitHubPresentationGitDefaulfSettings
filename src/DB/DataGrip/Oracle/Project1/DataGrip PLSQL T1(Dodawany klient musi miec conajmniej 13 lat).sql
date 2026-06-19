/*
    Wyzwalacz TRG_KLIENT_WIEK, który nie pozwala na dodanie klienta poniżej 13 roku życia
 */
CREATE OR REPLACE TRIGGER TRG_KLIENT_WIEK
BEFORE INSERT OR UPDATE
ON Klient
FOR EACH ROW
BEGIN
    IF MONTHS_BETWEEN(SYSDATE, :NEW.DataUrodzenia) / 12 < 13 THEN
        RAISE_APPLICATION_ERROR(
            -20010,
            'Klient musi miec co najmniej 13 lat.'
        );
    END IF;
END;
/*
 Test1
 */
INSERT INTO Klient
VALUES(
    100,
    'Test1',
    'Test1',
    DATE '2020-01-01',
    'M',
    12345678901,
    'Polskie',
    'Warszawa',
    1847264002
);

/*
 Test2
 */
INSERT INTO Klient
VALUES(
    100,
    'Test2',
    'Test2',
    DATE '2000-01-01',
    'M',
    12345678901,
    'Polskie',
    'Warszawa',
    1847264002
);