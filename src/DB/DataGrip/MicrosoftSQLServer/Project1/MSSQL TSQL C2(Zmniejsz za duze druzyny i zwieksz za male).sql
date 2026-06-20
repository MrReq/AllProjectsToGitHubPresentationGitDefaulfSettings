DECLARE
    @v_NazwaDruzyny VARCHAR(100),
    @v_liczbaZawodnikow INT;

DECLARE cursorDoZwiekszeniaLubZmenijszeniaDruzyn CURSOR FOR

SELECT
    NazwaDruzyny,
    LiczbaZawodnikow
FROM Druzyna
WHERE LiczbaZawodnikow NOT BETWEEN 3 AND 10;

OPEN cursorDoZwiekszeniaLubZmenijszeniaDruzyn;

FETCH NEXT FROM cursorDoZwiekszeniaLubZmenijszeniaDruzyn
INTO @v_NazwaDruzyny, @v_liczbaZawodnikow;

WHILE @@FETCH_STATUS = 0
BEGIN

    IF @v_liczbaZawodnikow > 10
        SET @v_liczbaZawodnikow = @v_liczbaZawodnikow - 1;
    ELSE
        SET @v_liczbaZawodnikow = @v_liczbaZawodnikow + 2;

    UPDATE Druzyna
    SET LiczbaZawodnikow = @v_liczbaZawodnikow
    WHERE NazwaDruzyny = @v_NazwaDruzyny;

    PRINT 'Liczba zawodnikow druzyny '
        + @v_NazwaDruzyny
        + ' zostala zmieniona na: '
        + CAST(@v_liczbaZawodnikow AS VARCHAR(10))
        + ' graczy';

    FETCH NEXT FROM cursorDoZwiekszeniaLubZmenijszeniaDruzyn
    INTO @v_NazwaDruzyny, @v_liczbaZawodnikow;

END

CLOSE cursorDoZwiekszeniaLubZmenijszeniaDruzyn;
DEALLOCATE cursorDoZwiekszeniaLubZmenijszeniaDruzyn;

DECLARE
    @NazwaDruzyny VARCHAR(20),
    @LiczbaZawodnikow int

Declare kursor cursor FOR
    SELECT NazwaDruzyny , IloscZawodnikow
    FROM Druzyna
    WHERE LiczbaZawodnikow NOT BETWEEN 3 AND 10;

open kursor
FETCH NEXT FROM kursor
Into @NazwaDruzyny, @LiczbaZawodnikow
WHILE @@FETCH_STATUS = 0
    BEGIN
        if @LiczbaZawodnikow > 10
            Begin
                SET @LiczbaZawodnikow = @LiczbaZawodnikow - 1;
            end
        ELSE
            BEGIN
                SET @LiczbaZawodnikow = @LiczbaZawodnikow + 1;
            end
        UPDATE Druzyna
        SET LiczbaZawodnikow = @LiczbaZawodnikow
        WHERE NazwaDruzyny = @NazwaDruzyny;
        PRINT 'Druzyna '+ @nazwaDruzyny + ' została zaktualizowana'
        FETCH NEXT FROM kursor
        Into @NazwaDruzyny, @LiczbaZawodnikow
    end
close kursor
DEALLOCATE kursor






declare
           @nazwaDruzyny Varchar(20),
           @liczbazawodnikow int

DECLARE kursor cursor  for
    select
        NazwaDruzyny,
        LiczbaZawodnikow
    from Druzyna
    Where LiczbaZawodnikow Not Between 3 and 10

open kursor
    fetch next from kursor
    into  @nazwaDruzyny , @liczbazawodnikow

    While @@FETCH_STATUS = 0
        Begin
            if @liczbazawodnikow > 10
                BEGIN
                    SET @liczbazawodnikow = @liczbazawodnikow - 1;
                end
            else
                BEGIN
                    SET @liczbazawodnikow = @liczbazawodnikow + 1;
                end
            UPDATE Druzyna
            Set LiczbaZawodnikow = @liczbazawodnikow
            WHERE NazwaDruzyny = @nazwaDruzyny
            Print('')
        end
    fetch next from kursor
    into  @nazwaDruzyny , @liczbazawodnikow

close kursor
deallocate kursor