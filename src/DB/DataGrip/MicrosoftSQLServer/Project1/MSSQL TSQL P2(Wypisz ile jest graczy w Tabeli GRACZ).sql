DECLARE @v_iloscGraczy INT;

SELECT @v_iloscGraczy = COUNT(*)
FROM Gracz;

SELECT
    'W tabeli GRACZ jest '
    + CAST(@v_iloscGraczy AS VARCHAR(10))
    + ' graczy' AS Komunikat;

Declare
    @viloscGraczy int;

BEGIN
    select @v_iloscGraczy = Count (*) From Gracz
    Print 'W tablei Gracz jest ' + cast(@v_iloscGraczy AS VARCHAR(20)) + ' graczy'
end


DECLARE
    @counter int

BEGIN
    SELECT @counter = COUNT(*) FROM GRACZ
    PRINT 'W tabeli GRACZ jest '+CAST(@counter AS VARCHAR(20)) + ' graczy'
end