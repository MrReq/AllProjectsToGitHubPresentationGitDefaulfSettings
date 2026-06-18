package Projekty.MojeProjektyZDiagramamiUML.KlubSeniora;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

public class Main {
    public static void main(String[] args) {
//        PrzyjecieJubileuszowe przyjecieJubileuszowe  = new PrzyjecieJubileuszowe();

    }
}
abstract class Osoba{
    DaneOsobowe daneOsobowe;
    String daneKontaktowe;
    Osoba(DaneOsobowe daneOsobowe, String daneKontaktowe){
        this.daneOsobowe = daneOsobowe;
        this.daneKontaktowe = daneKontaktowe;
    }
}
class Senior extends Osoba{
    Plec plec;
    int wiek ;
    static double wysokoscAktualnejSkladkiKlubowej;
    LocalDate dzis = LocalDate.now();

    Senior(DaneOsobowe daneOsobowe, String daneKontaktowe) {
        super(daneOsobowe, daneKontaktowe);
        this.wiek = dzis.getYear() - daneOsobowe.dataUrodzenia.getYear();
    }
    public void przydzielSenioraDoImprezy(Impreza impreza){

    }
}
class Zgloszenie{
    int numerZgloszenia; //unique
    LocalDate dataZgloszenia;
    static int licznikzgloszen = 1;
    Zgloszenie(int licznikzgloszen, LocalDate chwila){
        this.numerZgloszenia = licznikzgloszen;
    }
    void zglosSenioraDoImprezy(Senior senior, Impreza impreza){
        new Zgloszenie(licznikzgloszen,LocalDate.now());
        licznikzgloszen+=1;
    }
}
abstract class Impreza{
    String nazwa; //unique
    Date data;
    String miejsce;
    String opis; //max 500 znaków
    Status status;
    byte mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy;
    byte liczbaUczestnikowBioracychUdzialWImprezie;
    static byte maksymalnaLiczbaUczestnikowBioracychUDzialWImprezie = 30;
    Senior senior;
    List<Senior> listaSeniorowPomagajacaWImprezie;
    List<Senior> listaSeniorowBioracaUdzialWImprezie;;
    Impreza(String nazwa,Date data, String miejsce, String opis, Status status, byte mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy,
            byte liczbaUczestnikowBioracychUdzialWImprezie){
        if(liczbaUczestnikowBioracychUdzialWImprezie < mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy
                || liczbaUczestnikowBioracychUdzialWImprezie > maksymalnaLiczbaUczestnikowBioracychUDzialWImprezie){
            throw new IllegalArgumentException("Liczba uczestników nie może być mniejsza od liczby minimalnej" +
                    "dla danej imprezy ani nie może być za duża od liczby maksymalnej dla wszystkich imprez");
        }else {
            this.nazwa = nazwa;
            this.data = data;
            this.miejsce = miejsce;
            this.opis = opis;
            this.status = status;
            this.mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy = mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy;
            this.liczbaUczestnikowBioracychUdzialWImprezie = liczbaUczestnikowBioracychUdzialWImprezie;
        }
    } // Impreza nie odbędzie się jeśli liczba uczestników jest mniejsza niż limit
    abstract float obliczKoszt();
//    static void UtworzImpreze(){
//        new Impreza()
//    }
    void przydzielSenioraDoPomocyWImprezie(Senior senior){

    }
    void wyswietlListeWszystkichImprez( Okres okres){

    }
    void usunOdwolaneImprezy(){

    }
    void usunOdwolaneImprezy(Okres okres){

    }
}
class Wycieczka extends Impreza{
    Trasa trasa;
    WieczorTaneczny wieczorTaneczny;

    Wycieczka(String nazwa, Date data, String miejsce, String opis, Status status, byte mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy, byte liczbaUczestnikowBioracychUdzialWImprezie) {
        super(nazwa, data, miejsce, opis, status, mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy, liczbaUczestnikowBioracychUdzialWImprezie);
    }


    float obliczKoszt(){
        float koszt = 2;
        return koszt;
    }
}
class WieczorTaneczny extends Impreza{
    List<UtworMuzyczny> listaUtworowMuzycznych = new ArrayList<>();
    static byte minimalnaLiczbaGranychUtworow = 10; //liczba utworów może ulec zmianie
    Wycieczka wycieczka;

    WieczorTaneczny(String nazwa, Date data, String miejsce, String opis, Status status, byte mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy, byte liczbaUczestnikowBioracychUdzialWImprezie) {
        super(nazwa, data, miejsce, opis, status, mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy, liczbaUczestnikowBioracychUdzialWImprezie);
    }


    @Override
    float obliczKoszt() {
        float koszt = 0;
        return koszt;
    }
}
class PrzyjecieOkolicznosciowe extends Impreza{
    List<String> listaPotraw = new ArrayList<>(); //[2..*]
    float lacznyKosztPotraw;

    PrzyjecieOkolicznosciowe(String nazwa, Date data, String miejsce, String opis, Status status, byte mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy, byte liczbaUczestnikowBioracychUdzialWImprezie) {
        super(nazwa, data, miejsce, opis, status, mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy, liczbaUczestnikowBioracychUdzialWImprezie);
    }


    @Override //należy uwzględnić lączny koszt potraw
    float obliczKoszt() {
        return 0;
    }
}
class PrzyjecieJubileuszowe extends PrzyjecieOkolicznosciowe{
    PrzyjecieOkolicznosciowe przyjecieOkolicznosciowe;

    PrzyjecieJubileuszowe(String nazwa, Date data, String miejsce, String opis, Status status, byte mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy, byte liczbaUczestnikowBioracychUdzialWImprezie) {
        super(nazwa, data, miejsce, opis, status, mminimalnaLiczbaUczestnikowPotrzebnychDoOdbyciaSieImprezy, liczbaUczestnikowBioracychUdzialWImprezie);
    }


    @Override
    float obliczKoszt() {
        return 0;
    }
}
class Trasa{

}
class UtworMuzyczny{

}
class Okres {

    private final LocalDate od;
    private final LocalDate do_;

    public Okres(LocalDate od, LocalDate do_) {
        if (od == null || do_ == null) {
            throw new IllegalArgumentException("Daty nie mogą być null");
        }
        if (od.isAfter(do_)) {
            throw new IllegalArgumentException("Data początkowa nie może być po dacie końcowej");
        }
        this.od = od;
        this.do_ = do_;
    }

    public LocalDate getOd() {
        return od;
    }

    public LocalDate getDo() {
        return do_;
    }

    public Period jakoPeriod() {
        return Period.between(od, do_);
    }

    public long liczbaDni() {
        return od.until(do_).getDays();
    }

    public boolean zawiera(LocalDate data) {
        return !data.isBefore(od) && !data.isAfter(do_);
    }

    public boolean nachodziNa(Okres inny) {
        return !(this.do_.isBefore(inny.od) || this.od.isAfter(inny.do_));
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Okres okres)) return false;
        return od.equals(okres.od) && do_.equals(okres.do_);
    }

    @Override
    public int hashCode() {
        return Objects.hash(od, do_);
    }

    @Override
    public String toString() {
        return od + " - " + do_;
    }
}
enum Plec{
    KOBIETA,MEZCZYZNA
}
enum Status{
    PLANOWANA,ZREALIZOWANA,ODWOLANA
}
abstract class Sponsor{
    String daneTeleadresowe;
    StopienWiarygodnosci stopienWiarygodnosci;
    List<Sponsor> kogoPolecil = new ArrayList<>();
}
class OsobaFizyczna extends Osoba{

    OsobaFizyczna(DaneOsobowe daneOsobowe, String daneKontaktowe) {
        super(daneOsobowe, daneKontaktowe);
    }
}
class Instytucja extends Sponsor{
    String nazwa;
    int numerRegon;
    Sponsor sponsor;
}
class Darowizna{
    float kwota;
    Sponsor sponsor;
    Impreza impreza;
}
enum StopienWiarygodnosci{
    JEDEN(1),
    DWA(2),
    TRZY(3),
    CZTERY(4),
    PIEC(5);

    private final int numerStanuZuzycia;
    StopienWiarygodnosci(int numerStanuZuzycia){
        this.numerStanuZuzycia = numerStanuZuzycia;
    }

    public int getNumerStanuZuzycia(){
        return numerStanuZuzycia;
    }
}
class DaneOsobowe{
    String imie;
    String nazwisko;
    LocalDate dataUrodzenia;
    public String toString(){
        return imie+" "+nazwisko+" "+dataUrodzenia;
    }
}
