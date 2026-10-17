//STRING======================================================================================================================
let pierwszyString = 'To jests tring w pojedynczych cudzyslowach'
let drugiString = "A to jest string w podwójnych cudzysłowach"
let trzeciString = `Można również użyć backticków do zdefiniowania stringa`

//NUMBER======================================================================================================================
let calkowitaLiczba = 42;
let liczbaZmiennoprzecinkowa = 3.14

//BIGINT======================================================================================================================
let bardzoDuzaLiczba = 123456789034n;

//BOOLEAN======================================================================================================================
let prawda = true;
let falsz = false;

//UNDEFINED======================================================================================================================
let niezdefiniowanaZmienna;
console.log(niezdefiniowanaZmienna);

//NULL======================================================================================================================
let zmiennaNull = null;
console.log(zmiennaNull);


//OBJECT======================================================================================================================
let osoba = {
    imie:'Jan',
    nazwisko: 'Kowalski',
    adres: {
        ulica: 'Krakowska',
        numer: 123
    }
}
console.log(osoba.imie)
console.log(osoba.nazwisko)
console.log(osoba.adres)
console.log(osoba.adres.ulica)
console.log(osoba.adres.numer)

let numbers = [1,2,3,4,5]
console.log(typeof numbers)

let data = new Date();
console.log(data);
let year = data.getFullYear()
let month = data.getMonth() + 1;//bo indeksacja od 0
let day = data.getDay();
console.log(year,month,day)
//SYMBOL======================================================================================================================
let symbol1 = Symbol();
let symbol2 = Symbol();
console.log(symbol1 === symbol2) //symbole są zawsze unikalne
let symbolA = Symbol('Opis symbolu A');
let symbolB = Symbol('Opis symbolu B');