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

CREATE TRIGGER TRKW
BEFORE INSERT OR UPDATE
ON KLIENT
FOR EACH ROW
BEGIN
    IF months_between(SYSDATE, :NEW.DataUrodzenia/12) < 13 THEN
        raise_application_error(-20010,'Klient musi mieć więcej niż 13 lat');
    end if;
end;

CREATE TRIGGER TRKW
BEFORE INSERT OR UPDATE
ON KLIENT
FOR EACH ROW
BEGIN
    IF months_between(sysdate, :NEW.DataUrodzenia/12) < 13 THEN
        raise_application_error(-20010,'Klient musi miec wiecej niz 13 lat')
    end if;
end;
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

create or replace trigger TR_K_W
before insert or UPDATE
On klient
FOR EACH ROW
Begin
    if months_between(sysdate, :NEW.DataUrodzenia)/12 < 13 THEN
        raise_application_error(-20010,'Klient musi miec conajmniej 13 lat');
    end if;
end;

create or replace trigger TR_K_W
before Insert OR UPDATE
on Klient
for EACH ROW
begin
    if months_between(sysdate, :NEW.DataUrodzenia)/12 < 13 Then
        RAISE_APPLICATION_ERROR(-20010, 'Klient musi miec conajmniej 13 lat');
    end if;
end;

create or replace trigger trkw
before insert or update
on klient
for each row
begin
    if months_between(sysdate, :new.dataurodzenia)/12 < 13 THEN
        raise_application_error(-20010,'Klient musi miec conajmniej 13 lat')
    end if;
end;

create or replace trigger trkw
before Insert OR UPDATE
on klient
for each row
begin
    if months_between(sysdate, :new.dataurodzenia)/12 < 13 THEN
        raise_application_error(-20010,'Klient musi miec wiecej niz 13 lat')
    end if;
end;

create or replace trkbd
before delete
on Klient
for each row
begin
    if months_between(sysdate,:New.dataUrodzenia)/12 < 13 THEN
        raise_application_error(-20010, 'Klient musi miec wiecej niz 13 lat')
    end if;
end;