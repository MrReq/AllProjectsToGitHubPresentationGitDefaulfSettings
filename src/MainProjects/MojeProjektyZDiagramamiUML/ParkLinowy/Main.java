package Projekty.MojeProjektyZDiagramamiUML.ParkLinowy;
import java.net.URI;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Main {
    public static void main(String[] args) {

    }
}
class Strefa{
    String nazwa;
    String opis; //max 600 znaków
    Mapa mapa;
}
class Trasa{
    static List<Trasa> listaWszystkichTras = new ArrayList<>();
    String nazwa;
    StopienTrudnosci stopienTrudnosci;
    int dlugosc;
    int minimalnaWysokoscNaJakiejPrzebiegaTrasa;
    int maksymalnaWysokoscNaJakiejPrzebiegaTrasa;
    float cenaZaJednokrotnePrzejscie;
    int minimalnyWzrostOsobyPokonujacejTrase;
    double maksymalnaDopuszczalnaWagaOsobyPokonujacejTrase;
    Asekuracja asekuracja;
    public Trasa(String nazwa, StopienTrudnosci stopienTrudnosci, int dlugosc, int minimalnaWysokoscNaJakiejPrzebiegaTrasa,
                 int maksymalnaWysokoscNaJakiejPrzebiegaTrasa, float cenaZaJednokrotnePrzejscie,
                 int minimalnyWzrostOsobyPokonujacejTrase, double maksymalnaDopuszczalnaWagaOsobyPokonujacejTrase,
                 Asekuracja asekuracja) {
        this.nazwa = nazwa;
        this.stopienTrudnosci = stopienTrudnosci;
        this.dlugosc = dlugosc;
        this.minimalnaWysokoscNaJakiejPrzebiegaTrasa = minimalnaWysokoscNaJakiejPrzebiegaTrasa;
        this.maksymalnaWysokoscNaJakiejPrzebiegaTrasa = maksymalnaWysokoscNaJakiejPrzebiegaTrasa;
        this.cenaZaJednokrotnePrzejscie = cenaZaJednokrotnePrzejscie;
        this.minimalnyWzrostOsobyPokonujacejTrase = minimalnyWzrostOsobyPokonujacejTrase;
        this.maksymalnaDopuszczalnaWagaOsobyPokonujacejTrase = maksymalnaDopuszczalnaWagaOsobyPokonujacejTrase;
        this.asekuracja = asekuracja;
        listaWszystkichTras.add(this);
    }
    void wyswietlInformacjeOTrasachWrazZIchDostepnoscia(Okres okres){
        System.out.println();
    }
}
class Rezerwacja{
    Trasa trasa;
    static List<Rezerwacja> listaPrzyjetychRezerwacji = new ArrayList<>();
    static List<Rezerwacja> listaAnulowanychRezerwacji = new ArrayList<>();
    int numer; //unikatowy w ramach trasy
    Klient ktoJaZalozyl;
    Trasa ktorejTrasyDotyczy;
    LocalDate data;
    LocalDate godzinaPoczatku;
    LocalDate godzinaKonca;
    Termin Termin;
    byte liczbaOsobWGrupie;
    Status status;
    double koszt;
    String jezykKomunikacjiWRamachRezerwacji;
    Rezerwacja(Trasa trasa, Klient klient, String jezyk){
        this.trasa = trasa;
        this.ktoJaZalozyl = klient;
        this.jezykKomunikacjiWRamachRezerwacji = jezyk;
        listaPrzyjetychRezerwacji.add(this);
    }
//    static void przyjmujNowaRezerwacje(Trasa trasa, Klient klient, String jezyk){
//
//    }
    void przydzielInstruktora(InstruktorWspinaczkiSportowej instruktor){
    }
    static void usunAnulowaneRezerwacje(){
        listaAnulowanychRezerwacji.clear();
    }
}
abstract class Osoba{
    DaneOsobowe daneOsobowe;
}
abstract class Klient{
    DaneTeleadresowe daneTeleadresowe;
}
abstract class Pracownik extends Osoba{
    LocalDate dataZatrudnienia;
    int stazPracyWParkuLinowym;
    double stawkaZa1GodzinePracy;
    int liczbaGodzinPrzepracowanychWMiesiacu;
    abstract double obliczMiesieczneWynagrodzenia(); //algorytm zalezy od rodzaju pracownika
    public Pracownik(LocalDate dataZatrudnienia, int stazPracyWParkuLinowym, double stawkaZa1GodzinePracy) {
        this.dataZatrudnienia = dataZatrudnienia;
        this.stazPracyWParkuLinowym = stazPracyWParkuLinowym;
        this.stawkaZa1GodzinePracy = stawkaZa1GodzinePracy;
    }
    public LocalDate getDataZatrudnienia() {
        return dataZatrudnienia;
    }
    public void setDataZatrudnienia(LocalDate dataZatrudnienia) {
        this.dataZatrudnienia = dataZatrudnienia;
    }
    public int getStazPracyWParkuLinowym() {
        return stazPracyWParkuLinowym;
    }
    public void setStazPracyWParkuLinowym(int stazPracyWParkuLinowym) {
        this.stazPracyWParkuLinowym = stazPracyWParkuLinowym;
    }
    public double getStawkaZa1GodzinePracy() {
        return stawkaZa1GodzinePracy;
    }
    public void setStawkaZa1GodzinePracy(double stawkaZa1GodzinePracy) {
        this.stawkaZa1GodzinePracy = stawkaZa1GodzinePracy;
    }
    public int getLiczbaGodzinPrzepracowanychWMiesiacu() {
        return liczbaGodzinPrzepracowanychWMiesiacu;
    }
    public void setLiczbaGodzinPrzepracowanychWMiesiacu(int liczbaGodzinPrzepracowanychWMiesiacu) {
        this.liczbaGodzinPrzepracowanychWMiesiacu = liczbaGodzinPrzepracowanychWMiesiacu;
    }
}
class InstruktorWspinaczkiSportowej extends Pracownik{
    List<Jezyk> listaJezykowKtorymiSiePosluguje = new ArrayList<>();
    static  byte dodatekZaObslugeRezerwacjiWJezykuMigowym = 30; //zmiana nie może odbywać się częsciej niż raz na kwartał
    static Date dataZmianyDodatku;
    Jezyk jezyk;
    public InstruktorWspinaczkiSportowej(LocalDate dataZatrudnienia, int stazPracyWParkuLinowym, double stawkaZa1GodzinePracy,
                                         Jezyk jezyk) {
        super(dataZatrudnienia, stazPracyWParkuLinowym, stawkaZa1GodzinePracy);
        this.jezyk = jezyk;
        listaJezykowKtorymiSiePosluguje.add(jezyk);
    }
    static void znajdzWolnegoInstruktoraWspinaczkiSportowej(Termin termin){
    }
    @Override
    double obliczMiesieczneWynagrodzenia() {
        double wynagrodzenie = this.liczbaGodzinPrzepracowanychWMiesiacu*this.stawkaZa1GodzinePracy;
        if(listaJezykowKtorymiSiePosluguje.contains("Migowy")){
            wynagrodzenie+=30;
        }
        return wynagrodzenie;
    }
}
class Jezyk{
    String nazwa;
    List<String> listaPanstwWKtorymJestJezykiemUrzedowym = new ArrayList<>(); //może być null
    public Jezyk(String nazwa, List<String> listaPanstwWKtorymJestJezykiemUrzedowym) {
        this.nazwa = nazwa;
        this.listaPanstwWKtorymJestJezykiemUrzedowym = listaPanstwWKtorymJestJezykiemUrzedowym;
    }
    public String getNazwa() {
        return nazwa;
    }
    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }
    public List<String> getListaPanstwWKtorymJestJezykiemUrzedowym() {
        return listaPanstwWKtorymJestJezykiemUrzedowym;
    }
    public void setListaPanstwWKtorymJestJezykiemUrzedowym(List<String> listaPanstwWKtorymJestJezykiemUrzedowym) {
        this.listaPanstwWKtorymJestJezykiemUrzedowym = listaPanstwWKtorymJestJezykiemUrzedowym;
    }
    @Override
    public String toString() {
        return "Jezyk{" +
                "nazwa='" + nazwa + '\'' +
                ", listaPanstwWKtorymJestJezykiemUrzedowym=" + listaPanstwWKtorymJestJezykiemUrzedowym +
                '}';
    }
}
class ZnajomoscJezyka{
    Jezyk jezyk;
    InstruktorWspinaczkiSportowej instruktorWspinaczkiSportowej;
    String stopienZaawansowania;
}
class DaneOsobowe{
    String imie;
    String nazwisko;
    int pesel;
    LocalDate dataUrodzenia;
    public DaneOsobowe(String imie, String nazwisko, int pesel, LocalDate dataUrodzenia) {
        this.imie = imie;
        this.nazwisko = nazwisko;
        this.pesel = pesel;
        this.dataUrodzenia = dataUrodzenia;
    }
    public String getImie() {
        return imie;
    }
    public void setImie(String imie) {
        this.imie = imie;
    }
    public String getNazwisko() {
        return nazwisko;
    }
    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }
    public int getPesel() {
        return pesel;
    }
    public void setPesel(int pesel) {
        this.pesel = pesel;
    }
    public LocalDate getDataUrodzenia() {
        return dataUrodzenia;
    }
    public void setDataUrodzenia(LocalDate dataUrodzenia) {
        this.dataUrodzenia = dataUrodzenia;
    }
    @Override
    public String toString() {
        return "DaneOsobowe{" +
                "imie='" + imie + '\'' +
                ", nazwisko='" + nazwisko + '\'' +
                ", pesel=" + pesel +
                ", dataUrodzenia=" + dataUrodzenia +
                '}';
    }
}
class DaneTeleadresowe{
    int numerTelefonu;
    String mail;
    public DaneTeleadresowe(int numerTelefonu, String mail) {
        this.numerTelefonu = numerTelefonu;
        this.mail = mail;
    }
    public int getNumerTelefonu() {
        return numerTelefonu;
    }
    public String getMail() {
        return mail;
    }
    public void setNumerTelefonu(int numerTelefonu) {
        this.numerTelefonu = numerTelefonu;
    }
    public void setMail(String mail) {
        this.mail = mail;
    }
    @Override
    public String toString() {
        return "DaneTeleadresowe{" +
                "numerTelefonu=" + numerTelefonu +
                ", mail='" + mail + '\'' +
                '}';
    }
}
class KlientIndywidualny extends Klient{

}
class KlientInstytucjonalny extends Klient{
    String nazwa;
}
class PowietrznaPrzeszkoda{
    byte numerKolejnyPrzeszkodyNaTrasie;
    String nazwa; //np. most birmański krótki
    Zdjecie zdjecie;
}
enum Status{
    PRZYJETA,ZREALIZOWANA,ANULOWANA
}
class Termin{

}
class Zdjecie{
    private URI uri;
    private String typ;
    private long rozmiar;
}
class Okres{

}
class Asekuracja{

}
enum StopienTrudnosci{
    JEDEN(1),
    DWA(2),
    TRZY(3);
    private final int stopienTrudnosci;
    StopienTrudnosci(int stopienTrudnosci){
        this.stopienTrudnosci = stopienTrudnosci;
    }
    public  int getStopienTrudnosci() {
        return stopienTrudnosci;
    }
}
class Mapa{
    URI uri;
    String typ;
    private double szerokosc;
    private double dlugosc;
    private double promien;
}
