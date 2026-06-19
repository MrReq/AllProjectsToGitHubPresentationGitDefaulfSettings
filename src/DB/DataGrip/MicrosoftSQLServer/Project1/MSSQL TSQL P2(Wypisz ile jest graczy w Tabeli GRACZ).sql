DECLARE @v_iloscGraczy INT;

SELECT @v_iloscGraczy = COUNT(*)
FROM Gracz;

SELECT
    'W tabeli GRACZ jest '
    + CAST(@v_iloscGraczy AS VARCHAR(10))
    + ' graczy' AS Komunikat;
