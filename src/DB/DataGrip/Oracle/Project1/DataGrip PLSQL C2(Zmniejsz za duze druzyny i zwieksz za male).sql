
/*
    Kursor mający na celu automatyczne zwiększanie lub zmniejszanie graczy w drużynie
    Kursor rozpatruje Druzyny gdzie liczba zawodników jest mniejsza niż 3 lub większa niż 10
    Jeżeli Drużyna liczy więcej niż 10 graczy liczba zawodników się zmniejszy o 1, zaś jeśli mniej niż 3 to zwiększy o 1
 */
DECLARE
     CURSOR cursorDoZwiekszeniaLubZmenijszeniaDruzyn IS
     SELECT NAZWADRUZYNY, LICZBAZAWODNIKOW
     FROM DRUZYNA
     WHERE LICZBAZAWODNIKOW NOT BETWEEN 3 AND 10;
     v_NazwaDruzyny DRUZYNA.NAZWADRUZYNY%type;
     v_liczbaZawodnikow DRUZYNA.LICZBAZAWODNIKOW%type;
BEGIN
     OPEN cursorDoZwiekszeniaLubZmenijszeniaDruzyn;
     LOOP
        FETCH cursorDoZwiekszeniaLubZmenijszeniaDruzyn INTO v_NazwaDruzyny, v_liczbaZawodnikow;
         EXIT WHEN cursorDoZwiekszeniaLubZmenijszeniaDruzyn%NotFound;
         IF v_liczbaZawodnikow > 10 THEN
            v_liczbaZawodnikow := v_liczbaZawodnikow - 1;
         ELSE
            v_liczbaZawodnikow := v_liczbaZawodnikow + 2;
         END IF;
         UPDATE DRUZYNA
         SET LICZBAZAWODNIKOW = v_liczbaZawodnikow
         WHERE NAZWADRUZYNY = v_NazwaDruzyny;
         DBMS_OUTPUT.PUT_LINE('Liczba zawodnikow druzyny ' || v_NazwaDruzyny
         || ' została zmieniona na: ' || v_liczbaZawodnikow || ' graczy ');
     END LOOP;
     CLOSE cursorDoZwiekszeniaLubZmenijszeniaDruzyn;
END;