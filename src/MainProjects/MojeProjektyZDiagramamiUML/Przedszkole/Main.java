package MainProjects.MojeProjektyZDiagramamiUML.Przedszkole;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static java.time.LocalDate.*;

public class Main {
    public static void main(String[] args) {

    }
}
abstract class Osoba{
    DaneOsobowe daneOsobowe;
    DaneKontaktowe daneKontaktowe;
    Osoba(DaneOsobowe daneOsobowe, DaneKontaktowe daneKontaktowe){
        this.daneOsobowe=daneOsobowe;
        this.daneKontaktowe=daneKontaktowe;
    }
}
class DaneOsobowe{
    String imie;
    String nazwisko;
    LocalDate urodziny;
    DaneOsobowe(String  imie, String nazwisko, LocalDate urodziny, int pesel){
        this.imie = imie;
        this.nazwisko = nazwisko;
        this.urodziny = urodziny;
        this.pesel = pesel;
    }
    int pesel;
    public String toString(){
        return imie+" "+nazwisko+" "+pesel;
    }
}
class DaneKontaktowe{
    int numertelefonu;
    String mail;
}
class Przedszkolak extends Osoba{
   LocalDate now = LocalDate.now();
    int wiek =(now().getYear() - this.daneOsobowe.urodziny.getYear());
    static final byte minimalnywiek = 3;
    Przedszkolak(DaneOsobowe daneOsobowe, DaneKontaktowe daneKontaktowe) {
        super(daneOsobowe, daneKontaktowe);
    }
}
class Rodzic extends Osoba{
    Przedszkolak przedszkolak; //dziecko rodzica jeśli rodzic ma tylko jedno dziecko
    List<Przedszkolak> listaDzieciRodzica = new ArrayList<>();// w przypadku kiedy rodzic ma conajmniej 2 dzieci
    Rodzic(DaneOsobowe daneOsobowe, DaneKontaktowe daneKontaktowe) {
        super(daneOsobowe, daneKontaktowe);
    }
}
class Nauczyciel{
    LocalDate now = LocalDate.now();
    LocalDate poczatekPracyWPrzedszkolu;
    byte stazpracy;
}
class Konkurs{
    Przedszkolak przedszkolak;
    String tytul;
    String opis;
    LocalDate dataPrzeprowadzenia;
}
class UdzialPrzedszkolakaWKonkursie{
    Przedszkolak przedszkolak;
    Konkurs konkurs;
    byte miejsce; // unikatowe w ramach konkursu
}
class GrupaPrzedszkola{
    ZajeciaDydaktyczne zajeciaDydaktyczne;
    String nazwa;
    byte poziomNauczania;
    int rokSzkolny; //rok w którym została utworzona
}
class PrzynaleznoscDoGrupy{
    Przedszkolak przedszkolak;
    GrupaPrzedszkola grupaPrzedszkola;
    Date dataPrzypisania;
    Date dataWypisania;
    String zdrobnioneImie;
}
abstract class ZajeciaDydaktyczne{
    GrupaPrzedszkola grupaPrzedszkola;
    String nazwa;
    String opis;
    byte czasTrwania; // <= max czas trwania
    byte poziomNauczania;
    static final byte maxCzasTrwania = 60;
    ZajeciaDydaktyczne(String nazwa, String opis, byte czasTrwania, byte poziomNauczania) {
        if (czasTrwania > maxCzasTrwania) {
            throw new IllegalArgumentException("Czas trwania nie może być większy niż maksymalny czas trwania tj. 60minut");
        } else {
            this.nazwa = nazwa;
            this.opis = opis;
            this.czasTrwania = czasTrwania;
            this.poziomNauczania = poziomNauczania;
        }
    }
    abstract byte obliczStopienPracochlonnosci();
}
class ZajeciaMuzyczne extends ZajeciaDydaktyczne{
    List<UtworMuzyczny> listaUtworowMuzyczny = new ArrayList<>();
    List<InstrumentMuzyczny> listaInstrumentow = new ArrayList<>(); //opcjonalny
    ZajeciaMuzyczne(String nazwa, String opis, byte czasTrwania, byte poziomNauczania) {
        super(nazwa, opis, czasTrwania, poziomNauczania);
    }
    @Override
    byte obliczStopienPracochlonnosci() {
        return 0;
    }
}
class ZajeciaPlastyczne extends ZajeciaDydaktyczne{
    List<String> listaZastosowanychTechnik = new ArrayList<>();//[0..*]
    ZajeciaPlastyczne(String nazwa, String opis, byte czasTrwania, byte poziomNauczania) {
        super(nazwa, opis, czasTrwania, poziomNauczania);
    }

    @Override
    byte obliczStopienPracochlonnosci() {
        return 0;
    }
}
class Wycieczka{
    RealizacjaZajec realizacjaZajec;
    String opis;
    String miejscowosc;
    Date dataRozpoczecia;
    Date dataZakonczenia;
}
class RealizacjaZajec{
    Date dataPoczatku;
    Date dataKonca;
}
class UtworMuzyczny{
    String tytuł;
    String autor;
    UtworMuzyczny(String tytul, String autor){
        this.tytuł = tytul;
        this.autor = autor;
    }
}
class InstrumentMuzyczny{
    String nazwaInstrumentu;
    String materialWykonania;
}

