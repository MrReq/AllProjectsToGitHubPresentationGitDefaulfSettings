package Projekty.MojeProjektyZDiagramamiUML.Zegary;

import java.time.LocalDate;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        ZakladSieci zakladSieci = new ZakladSieci(Address.WylosujAdres(),Arrays.asList(8283123,1231236312,1231235345));
        System.out.println(zakladSieci.adres);
    }
}
//=============================ZAKŁAD SIECI I ADRESY===============================================
class ZakladSieci{
    private List<Zatrudnienie> zatrudnienia = new ArrayList<>();
    Address adres;
    List<Integer> listaTelefonow = new ArrayList<>();
    private final static String godzinaOtwarcia = "10:00";
    private final static String godzinaZamkniecia = "18:00";
    private final static int MAKSYMALNAL_ICZBA_PRACOWNIKOW = 5;
    ZakladSieci(Address adres, List<Integer> listaTelefonow){
        if (listaTelefonow == null || listaTelefonow.isEmpty()) {
            throw new IllegalArgumentException("Zakład musi mieć co najmniej jeden numer telefonu");
        }
        this.adres = adres;
        this.listaTelefonow = listaTelefonow;
        assert listaTelefonow.isEmpty(): "Lista telefonów nie może być pusta";
    }

    public void dodajZatrudnienie(Zatrudnienie zatrudnienie){
        long aktywni = zatrudnienia.stream().filter(Zatrudnienie::isAktywne).count();

        if(aktywni > MAKSYMALNAL_ICZBA_PRACOWNIKOW){
            throw new IllegalArgumentException("Przekroczono maksymalną liczbę pracowników");
        }else {
            zatrudnienia.add(zatrudnienie);
        }

        }
    public List<Zatrudnienie> getZatrudnienie(){
        return zatrudnienia;
    }
}
enum Kontynent{
    ASIA, EUROPA, AMERYKA_PÓŁNOCNA, AMERYKA_POŁUDNIOWA, AFRYKA, ANTARKTYDA, AUSTRALIA
}
enum Region{
    PÓŁNOCNY, POŁUDNIOWY, WSCHODNI, ZACHODNI
}
enum Kraj{
    POLSKA, NIEMCY
}
enum Wojewodztwo{
    MAZOWIECKIE, MAŁOPOLSKIE
}
enum Powiat{
    LIPIŃSKI, WARSZAWSKI
}
enum Miasto{
    WARSZAWA, ŁÓDŹ
}
 enum KodPocztowy {
    WARSZAWA("00-001"),
    KRAKOW("30-001"),
    POZNAN("60-001");

    private final String kodpocztowy;

     KodPocztowy(String kodpocztowy) {
        this.kodpocztowy = kodpocztowy;
    }
    public String zwrocKod() {
        return kodpocztowy;
    }
}
enum Ulica{
    DOBRA, MIŁA
}
enum NumerBudynku {
    JEDEN("1"),
    DWA("2"),
    TRZY("3");
    private final String numerbudynku;
    NumerBudynku(String numerbudynku) {
        this.numerbudynku = numerbudynku;
    }
    public String ZwrocNumerBudynku() {
        return numerbudynku;
    }
}
//===============OPCJONAL===============
enum LiteraBudynku{
    A,B,C,D,E,F
}
enum NumerMieszkania {
    JEDEN("1"),
    DWA("2"),
    TRZY("3");
    private final String numerMieszkania;
    NumerMieszkania(String numerMieszkania) {
        this.numerMieszkania = numerMieszkania;
    }
    public String ZwrocNumerMieszkania() {
        return numerMieszkania;
    }
}
class Address{
    private Address address;
    private String kontynent;
    private String region;
    private String kraj;
    private String wojewodztwo;
    private String powiat;
    private String miasto;
    private String kodPocztowy;
    private String ulica;
    private String numerBudynku;
    private Optional<String> literaDomu;
    private Optional<String> numerMieszkania;
    private StringBuilder stringBuilder = new StringBuilder();
    private StringBuffer stringBuffer = new StringBuffer();
    public Address(String kontynent, String region, String kraj, String wojewodztwo, String powiat,
                   String miasto, String kodPocztowy, String ulica, String numerBudynku, String literaDomu, String numerMieszkania){
//        stringBuffer.append(kontynent,kraj);
        this.kontynent = kontynent;
        this.region=region;
        this.kraj = kraj;
        this.wojewodztwo = wojewodztwo;
        this.powiat = powiat;
        this.miasto = miasto;
        this.kodPocztowy = kodPocztowy;
        this.ulica = ulica;
        this.numerBudynku = numerBudynku;
        this.literaDomu = Optional.ofNullable(literaDomu);
        this.numerMieszkania = Optional.ofNullable(numerMieszkania);
        this.stringBuilder.append(kontynent+" ").append(region+" ").append(kraj+" ").append(wojewodztwo+" ").append(powiat+" ")
        .append(miasto+" ").append(kodPocztowy+" ").append(ulica+" ").append(numerBudynku+" ").append(literaDomu+" ").append(numerMieszkania+" ");
    }
    public Address(Kontynent losowyKontynent,
                   Region losowyregion,
                   Kraj losowykraj,
                   Wojewodztwo losowewojewodztwo,
                   Powiat losowypowiat,
                   Miasto losowemiasto,
                   KodPocztowy losowykodPocztowy,
                   Ulica losowaulica, NumerBudynku losowyNumerBudynku) {
        this.kontynent = String.valueOf(losowyKontynent);
        this.region= String.valueOf(losowyregion);
        this.kraj = String.valueOf(losowykraj);
        this.wojewodztwo = String.valueOf(losowewojewodztwo);
        this.powiat = String.valueOf(losowypowiat);
        this.miasto = String.valueOf(losowemiasto);
        this.kodPocztowy = String.valueOf(losowykodPocztowy);
        this.ulica = String.valueOf(losowaulica);
        this.numerBudynku = String.valueOf(losowyNumerBudynku);
    }
    public Address(Address address) {
        this.address = address;
    }
    @Override
    public String toString() {
        stringBuilder.append(kontynent+" ").append(region+" ").append(kraj+" ").append(wojewodztwo+" ").append(powiat).append(miasto+" ")
                .append(kodPocztowy+" ").append(ulica+" ").append(numerBudynku+" ");
        if (this.literaDomu != null && !this.literaDomu.isEmpty()) {
            stringBuilder.append(literaDomu);
        }
        if (this.numerMieszkania != null) {
            stringBuilder.append("/").append(numerMieszkania);
        }
        return stringBuilder.toString();
    }
    public Optional<String> getLiteraDomu(){
        return this.literaDomu;
    }
    public static Address WylosujAdres(){
        Random random = new Random();
        Kontynent[] kontynenty = Kontynent.values(); // wszystkie wartości enuma
        Kontynent losowyKontynent = kontynenty[random.nextInt(kontynenty.length)]; // losowy indeks
        Region[] regiony = Region.values(); // wszystkie wartości enuma
        Region losowyregion = regiony[random.nextInt(regiony.length)]; // losowy indeks
        Kraj[] kraje = Kraj.values(); // wszystkie wartości enuma
        Kraj losowykraj = kraje[random.nextInt(kraje.length)]; // losowy indeks
        Wojewodztwo[] wojewodztwo = Wojewodztwo.values(); // wszystkie wartości enuma
        Wojewodztwo losowewojewodztwo = wojewodztwo[random.nextInt(wojewodztwo.length)]; // losowy indeks
        Powiat[] powiaty = Powiat.values(); // wszystkie wartości enuma
        Powiat losowypowiat = powiaty[random.nextInt(powiaty.length)]; // losowy indeks
        Miasto[] miasto = Miasto.values(); // wszystkie wartości enuma
        Miasto losowemiasto = miasto[random.nextInt(miasto.length)]; // losowy indeks
        KodPocztowy[] kodPocztowy = KodPocztowy.values(); // wszystkie wartości enuma
        KodPocztowy losowykodPocztowy = kodPocztowy[random.nextInt(kodPocztowy.length)]; // losowy indeks
        Ulica[] ulica = Ulica.values(); // wszystkie wartości enuma
        Ulica losowaulica = ulica[random.nextInt(ulica.length)]; // losowy indeks
        NumerBudynku[] numerBudynku = NumerBudynku.values();
        NumerBudynku losowyNumerBudynku = numerBudynku[random.nextInt(numerBudynku.length)];

        Address address = new Address(losowyKontynent,losowyregion,losowykraj,losowewojewodztwo,
                losowypowiat,losowemiasto,losowykodPocztowy,losowaulica,losowyNumerBudynku);
        return address;
    }
}
//=================PRACOWNICY I ZATRUDNIENIE===========================================
class Pracownik{
    private List<ZakladSieci> zakladySieci;

    protected String[] daneOsobowe;
    protected int wiek;
    protected int stazPracyWSieciTikTak;
    protected List<String> listaPoprzednichMiejscPracy = new ArrayList<>();
    private List<Zatrudnienie> zatrudnienia = new ArrayList<>();
    protected Pracownik(String[] daneOsobowe, int wiek , int stazPracyWSieciTikTak,
                        ArrayList listaPoprzednichMiejscPracy){
        this.daneOsobowe = daneOsobowe;
        this.wiek=wiek;
        this.stazPracyWSieciTikTak = stazPracyWSieciTikTak;
        this.listaPoprzednichMiejscPracy = listaPoprzednichMiejscPracy;
    }

    public void dodajZatrudnienie(Zatrudnienie zatrudnienie){
        zatrudnienia.add(zatrudnienie);
    }

    public List<Zatrudnienie> getZatrudnienia(){
        return zatrudnienia;
    }
}
class PracownikDoswiadczony extends Pracownik{
    private float dodatekDoPensji;

    private PracownikDoswiadczony(String[] daneOsobowe, int wiek, int stazPracyWSieciTikTak,
                                    ArrayList listaPoprzednichMiejscPracy, float dodatekDoPensji) {
        super(daneOsobowe, wiek, stazPracyWSieciTikTak, listaPoprzednichMiejscPracy);
        this.dodatekDoPensji = dodatekDoPensji;
    }
}
class PracownikNiedoswiadczony extends Pracownik{

    private PracownikNiedoswiadczony(String[] daneOsobowe, int wiek, int stazPracyWSieciTikTak,
                                       ArrayList listaPoprzednichMiejscPracy) {
        super(daneOsobowe, wiek, stazPracyWSieciTikTak, listaPoprzednichMiejscPracy);
    }
}
class TworcaZegarow extends Pracownik{
    float wartoscPremiiZaArtyzm;
    private  TworcaZegarow(String[] daneOsobowe, int wiek, int stazPracyWSieciTikTak,
                  ArrayList listaPoprzednichMiejscPracy, float wartoscPremiiZaArtyzm){
        super(daneOsobowe,  wiek,  stazPracyWSieciTikTak, listaPoprzednichMiejscPracy);
        this.wartoscPremiiZaArtyzm = wartoscPremiiZaArtyzm;
        assert wartoscPremiiZaArtyzm > (0.05 * Serwisant.maxWartoscPremii)
                : "Wartość nie może być większa 5% maksymalnej wartości premiii";
    }
}
class Serwisant{
    static int maxWartoscPremii = 1000;
    int procentOdMaxWartosciPremii;
}
class Zatrudnienie{

    private final ZakladSieci zaklad;
    private final Pracownik pracownik;
    private final LocalDate dataOd;
    private final LocalDate dataDo; // null = nadal pracuje

    public Zatrudnienie(ZakladSieci zaklad,
                        Pracownik pracownik,
                        LocalDate dataOd,
                        LocalDate dataDo) {

        this.zaklad = zaklad;
        this.pracownik = pracownik;
        this.dataOd = dataOd;
        this.dataDo = dataDo;
    }

    public boolean isAktywne() {
        return dataDo == null;
    }

    public ZakladSieci getZaklad() {
        return zaklad;
    }

    public Pracownik getPracownik() {
        return pracownik;
    }
}
//==============================PRODUKTY I NAPRAWA===============================
class Zegar{
    Date dataProdukcji;
    String opis;
    Optional<String> klasaWodoszczelnosci; //inaczej poziom wodoszczelnosci
    private List<Naprawa> naprawy = new ArrayList<>(); //może być null
    Zegar(Date dataProdukcji , String opis, Optional<String> klasaWodoszczelnosci){
        this.dataProdukcji = dataProdukcji;
        this.opis = opis;
        this.klasaWodoszczelnosci = klasaWodoszczelnosci;
    }
}
class ZegarWiszacy extends Zegar{
    double waga;
    ZegarWiszacy(Date dataProdukcji, String opis, Optional<String> klasaWodoszczelnosci, double waga) {
        super(dataProdukcji, opis, klasaWodoszczelnosci);
        this.waga = waga;
    }
}
class ZegarReczny extends Zegar {
    TypZamocowania typZamocowania;
    ZegarReczny(Date dataProdukcji, String opis, Optional<String> klasaWodoszczelnosci,
                TypZamocowania typZamocowania) {
        super(dataProdukcji, opis, klasaWodoszczelnosci);
        this.typZamocowania = typZamocowania;
    }
}

enum TypZamocowania {
    KLEJ, TAŚMA, WKĘT
}
class Naprawa{
    Date odKiedyZegarJestNaprawiany;
    Date odKiedyTrwalaNaprawa;
    double kosztCzesci;
    double lacznyKosztRobocizny;
    String opisNaprawy;
    Naprawa(Date odKiedyZegarJestNaprawiany, Date odKiedyTrwalaNaprawa,double kosztCzesci,
            double lacznyKosztRobocizny,String opisNaprawy){
        this.odKiedyZegarJestNaprawiany = odKiedyZegarJestNaprawiany;
        this.odKiedyTrwalaNaprawa = odKiedyTrwalaNaprawa;
        this.kosztCzesci = kosztCzesci;
        this.lacznyKosztRobocizny = lacznyKosztRobocizny;
        this.opisNaprawy = opisNaprawy;
    }
}