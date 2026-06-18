package MainProjects.MojeProjektyZDiagramamiUML.Scenografia;

import java.time.LocalDate;
import java.util.*;

public class Main {
    public static void main(String[] args) {

    }
}

abstract class ElementScenografii{
    int id;
    String nazwa;
    String opis;
    int stopienZuzycia;
    StanZuzycia stan;
    Date dataWykonania; //może być null
    static List<ElementScenografii> listaElemetowScenografii = new ArrayList<>();
    protected List<Naprawa> listaNapraw = new ArrayList<>();

    abstract int obliczStopienZuzycia();

    protected ElementScenografii(int id, String nazwa, String opis, int stopienZuzycia, StanZuzycia stan, Date dataWykonania){
        this.id = id;
        this.nazwa = nazwa;
        this.opis = opis;
        this.stopienZuzycia = stopienZuzycia;
        this.stan = stan;
        this.dataWykonania = dataWykonania;
    }
    public static List<ElementScenografii> utworzListeWszystkichElementowScenografii(){
        return listaElemetowScenografii;
    }

    public int getStopienZuzycia(){
        return stopienZuzycia;
    }
}

class Kostium extends ElementScenografii{
    int rozmiar;
    int iloscCzyszczenia;
    Date dataOstatniegoCzyszczenia;
    Krawiec krawiec;

    protected Kostium(int id, String nazwa, String opis, int stopienZuzycia, StanZuzycia stan, Date dataWykonania) {
        super(id, nazwa, opis, stopienZuzycia, stan, dataWykonania);
    }

    @Override
    int obliczStopienZuzycia() {
        return stopienZuzycia;
    }
}

class PracaKrawcaPrzyKostiumach{
    Date odKiedyPracowalPrzyKostiumie;
    Date doKiedyPracowalPrzyKostiumie;
    int ocenaPracyPrzyKostiumie;
    int miejsceWRankinguKrawcow;
}

class Rekwizyt extends ElementScenografii{
    boolean czyJestPrzenosny;
    protected Rekwizyt(int id, String nazwa, String opis, int stopienZuzycia, StanZuzycia stan, Date dataWykonania,
                        boolean czyJestPrzenosny) {
        super(id, nazwa, opis, stopienZuzycia, stan, dataWykonania);
        this.czyJestPrzenosny = czyJestPrzenosny;
    }
    @Override
    int obliczStopienZuzycia() {
        return stopienZuzycia;
    }
}

class ElementDekoracji extends ElementScenografii{
    Typ typ;
    double waga;
    String rodzajMaterialu;
    int wspolczynnikTempaZuzycia; //zależny od rodzaju materiału

    protected ElementDekoracji(int id, String nazwa, String opis, int stopienZuzycia, StanZuzycia stan, Date dataWykonania) {
        super(id, nazwa, opis, stopienZuzycia, stan, dataWykonania);
    }

    @Override
    int obliczStopienZuzycia() {
        return stopienZuzycia;
    }
}

enum StanZuzycia{
    DO_WYKORZYSTANIA, ZAREZERWOWANY, W_NAPRAWIE
}

enum Typ{
    STOJACY,WISZACY,TROJWYMIAROWY
}

class SztukaTeatralna{
    String tytul;
    String streszczenie;
    static final int maxCzasTrwania = 90;
    int czasTrwania;
    List<ElementScenografii> wykorzystaneElementyScenografii = new ArrayList<>(); //może być null
    List<Spektakl> listaSpektakli = new ArrayList<>();//może być null
    Scenograf scenograf; // może być null
    public static void wprowadzNowaSztukeTeatralna(SztukaTeatralna sztukaTeatralna){

    }
    public void przypiszElementScenografiiDoSztuki(List<ElementScenografii> listaElementowScenografiii){

    }
}

class Spektakl{
    private final SztukaTeatralna sztukaTeatralna;
    Date dataRozpoczecia;
    Date godzinaRozpoczecia;
    Date godzinaZakonczenia;

    Spektakl(SztukaTeatralna sztukaTeatralna, Date dataRozpoczecia, Date godzinaRozpoczecia, Date godzinaZakonczenia){
        if(sztukaTeatralna == null){
            throw new IllegalArgumentException("Spektakl może istnieć jeżeli istnieje już jakaś Sztuka");
        }else {
            this.sztukaTeatralna=sztukaTeatralna;
            this.dataRozpoczecia = dataRozpoczecia;
            this.dataRozpoczecia = godzinaRozpoczecia;
            this.godzinaZakonczenia = godzinaZakonczenia;
        }
    }
}

class Rezerwacja{
    Date rezerwacjaOd;
    Date rezerwacjaDo;
    public void rezerwowanieElementowScenografii(ElementScenografii elementScenografii , SztukaTeatralna sztukaTeatralna){

    }
}

class PracownikTeatru{
    String daneOsobowe;
    String daneKontaktowe;
    String daneOZatrudnieniu;
    PracownikTeatru(String daneOsobowe, String daneKontaktowe, String daneOZatrudnieniu){
        this.daneOsobowe=daneOsobowe;
        this.daneKontaktowe = daneKontaktowe;
        this.daneOZatrudnieniu=daneOZatrudnieniu;
    }
}

class Krawiec extends PracownikTeatru{
    List<String> kwalifikacje = new ArrayList<>();
    List<String> kostiumy = new ArrayList<>();
    Kostium kostium;

    Krawiec(String daneOsobowe, String daneKontaktowe, String daneOZatrudnieniu) {
        super(daneOsobowe, daneKontaktowe, daneOZatrudnieniu);
    }
}

class Scenograf extends PracownikTeatru{
    List<SztukaTeatralna> listaSztukTeatralnych = new ArrayList<>(); //może być null
    SztukaTeatralna sztukaTeatralna;

    Scenograf(String daneOsobowe, String daneKontaktowe, String daneOZatrudnieniu) {
        super(daneOsobowe, daneKontaktowe, daneOZatrudnieniu);
    }
}



class Naprawa{
    private final ElementScenografii elementScenografii;
    Date dataRozpoczecia;
    LocalDate dataZakonczenia;
    String opisUszkodzenia;
    String opisNaprawy;
    static List<ElementScenografii> listaNajczesciejNaprawianychElemetnowScenografii = new ArrayList<>();

    Naprawa(ElementScenografii elementScenografii, Date dataRozpoczecia, String opisUszkodzenia) {
        if(elementScenografii == null){
            throw new IllegalArgumentException("Naprawa musi dotyczyć jakiegoś elementu scenografii");
        }
        this.elementScenografii = elementScenografii;
        this.dataRozpoczecia = dataRozpoczecia;
        this.opisUszkodzenia = opisUszkodzenia;
    }
    public void zakonczNaprawe(String opisNaprawy){
        this.opisNaprawy = opisNaprawy;
        this.dataZakonczenia = LocalDate.now();
    }

    public static List<ElementScenografii> najczesciejNaprawianeElemetnyScenografii(){
        return listaNajczesciejNaprawianychElemetnowScenografii;
    }
}