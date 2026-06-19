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