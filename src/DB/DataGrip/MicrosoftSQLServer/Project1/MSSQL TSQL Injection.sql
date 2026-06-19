USE [s27593]

IF OBJECT_ID('RejestracjaWTurnieju', 'U') IS NOT NULL DROP TABLE RejestracjaWTurnieju;
IF OBJECT_ID('RejestracjaWDruzynie', 'U') IS NOT NULL DROP TABLE RejestracjaWDruzynie;
IF OBJECT_ID('RezerwacjaKomputera', 'U') IS NOT NULL DROP TABLE RezerwacjaKomputera;
IF OBJECT_ID('ZamowienieJedzenia', 'U') IS NOT NULL DROP TABLE ZamowienieJedzenia;
IF OBJECT_ID('Turniej', 'U') IS NOT NULL DROP TABLE Turniej;
IF OBJECT_ID('Druzyna', 'U') IS NOT NULL DROP TABLE Druzyna;
IF OBJECT_ID('Komputer', 'U') IS NOT NULL DROP TABLE Komputer;
IF OBJECT_ID('Gracz', 'U') IS NOT NULL DROP TABLE Gracz;
IF OBJECT_ID('Klient', 'U') IS NOT NULL DROP TABLE Klient;
IF OBJECT_ID('Restauracja', 'U') IS NOT NULL DROP TABLE Restauracja;



CREATE TABLE Restauracja
(
    NIP NUMERIC(10) NOT NULL,
    DataPowstania DATE NOT NULL,
    Powierzchnia DECIMAL(10,2) NOT NULL,
    Adres VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Restauracja
        PRIMARY KEY (NIP)
);



CREATE TABLE Klient
(
    IDUzytkownika INT NOT NULL,
    Imie VARCHAR(100) NOT NULL,
    Nazwisko VARCHAR(100) NOT NULL,
    DataUrodzenia DATE NOT NULL,

    Plec CHAR(1) NULL,

    Pesel VARCHAR(11) NOT NULL,

    Obywatelstwo VARCHAR(100) NOT NULL,
    MiejscowoscZamieszkania VARCHAR(100) NOT NULL,

    RestauracjaNIP NUMERIC(10) NOT NULL,

    CONSTRAINT PK_Klient
        PRIMARY KEY(IDUzytkownika),

    CONSTRAINT CHK_Klient_Plec
        CHECK(Plec IN ('M','K') OR Plec IS NULL),

    CONSTRAINT UQ_Klient_Pesel
        UNIQUE(Pesel)
);



CREATE TABLE Gracz
(
    IDGracza INT NOT NULL,

    LiczbaRozegranychGodzin DECIMAL(10,2) NULL,

    LiczbaRozegranychGier INT NOT NULL,

    KlientIDUzytkownika INT NOT NULL,

    CONSTRAINT PK_Gracz
        PRIMARY KEY(IDGracza),

    CONSTRAINT CHK_Gracz_Godziny
        CHECK(LiczbaRozegranychGodzin >= 0),

    CONSTRAINT CHK_Gracz_Gry
        CHECK(LiczbaRozegranychGier >= 0)
);



CREATE TABLE Komputer
(
    IDKomputera INT NOT NULL,
    Nazwa VARCHAR(100) NOT NULL,
    DataZamontowania DATE NOT NULL,
    SystemOperacyjny VARCHAR(100) NOT NULL,
    Firma VARCHAR(100) NOT NULL,
    Rocznik SMALLINT NOT NULL,

    CONSTRAINT PK_Komputer
        PRIMARY KEY(IDKomputera)
);



CREATE TABLE RezerwacjaKomputera
(
    IDRezerwacji INT NOT NULL,

    Stanowisko INT NOT NULL,

    GodzinaRezerwacji DATETIME2 NOT NULL,

    GraczIDGracza INT NOT NULL,

    KomputerIDKomputera INT NOT NULL,

    CONSTRAINT PK_RezerwacjaKomputera
        PRIMARY KEY(IDRezerwacji)
);



CREATE TABLE Druzyna
(
    IDDruzyny INT NOT NULL,

    NazwaDruzyny VARCHAR(100) NOT NULL,

    LiczbaZawodnikow INT NOT NULL,

    RegionReprezentujacy VARCHAR(100) NOT NULL,

    Lider VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Druzyna
        PRIMARY KEY(IDDruzyny),

    CONSTRAINT CHK_Druzyna_Liczba
        CHECK(LiczbaZawodnikow >= 0)
);



CREATE TABLE RejestracjaWDruzynie
(
    IDRejestracji INT NOT NULL,

    DataRejestracji DATE NOT NULL,

    GraczIDGracza INT NOT NULL,

    DruzynaIDDruzyny INT NOT NULL,

    CONSTRAINT PK_RejestracjaWDruzynie
        PRIMARY KEY(IDRejestracji)
);



CREATE TABLE Turniej
(
    IDTurnieju INT NOT NULL,

    DataRozpoczecia DATE NOT NULL,

    DataZakonczenia DATE NOT NULL,

    LiczbaZawodnikow SMALLINT NOT NULL,

    LiczbaDruzyn SMALLINT NOT NULL,

    NazwaTurnieju VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Turniej
        PRIMARY KEY(IDTurnieju),

    CONSTRAINT CHK_Turniej_Daty
        CHECK(DataZakonczenia > DataRozpoczecia)
);
GO


CREATE TABLE RejestracjaWTurnieju
(
    GraczIDGracza INT NOT NULL,

    TurniejIDTurnieju INT NOT NULL,

    CONSTRAINT PK_RejestracjaWTurnieju
        PRIMARY KEY
        (
            GraczIDGracza,
            TurniejIDTurnieju
        )
);
GO


CREATE TABLE ZamowienieJedzenia
(
    IDZamowienia INT NOT NULL,

    DataObslugiKlienta DATE NOT NULL,

    NIP NUMERIC(10) NULL,

    KlientIDUzytkownika INT NOT NULL,

    CONSTRAINT PK_ZamowienieJedzenia
        PRIMARY KEY(IDZamowienia)
);




ALTER TABLE Klient
ADD CONSTRAINT FK_Klient_Restauracja
FOREIGN KEY(RestauracjaNIP)
REFERENCES Restauracja(NIP);


ALTER TABLE Gracz
ADD CONSTRAINT FK_Gracz_Klient
FOREIGN KEY(KlientIDUzytkownika)
REFERENCES Klient(IDUzytkownika);


ALTER TABLE RezerwacjaKomputera
ADD CONSTRAINT FK_Rezerwacja_Gracz
FOREIGN KEY(GraczIDGracza)
REFERENCES Gracz(IDGracza);


ALTER TABLE RezerwacjaKomputera
ADD CONSTRAINT FK_Rezerwacja_Komputer
FOREIGN KEY(KomputerIDKomputera)
REFERENCES Komputer(IDKomputera);


ALTER TABLE RejestracjaWDruzynie
ADD CONSTRAINT FK_RejestracjaDruzyna_Gracz
FOREIGN KEY(GraczIDGracza)
REFERENCES Gracz(IDGracza);


ALTER TABLE RejestracjaWDruzynie
ADD CONSTRAINT FK_RejestracjaDruzyna_Druzyna
FOREIGN KEY(DruzynaIDDruzyny)
REFERENCES Druzyna(IDDruzyny);


ALTER TABLE RejestracjaWTurnieju
ADD CONSTRAINT FK_RejestracjaTurniej_Gracz
FOREIGN KEY(GraczIDGracza)
REFERENCES Gracz(IDGracza);


ALTER TABLE RejestracjaWTurnieju
ADD CONSTRAINT FK_RejestracjaTurniej_Turniej
FOREIGN KEY(TurniejIDTurnieju)
REFERENCES Turniej(IDTurnieju);


ALTER TABLE ZamowienieJedzenia
ADD CONSTRAINT FK_Zamowienie_Klient
FOREIGN KEY(KlientIDUzytkownika)
REFERENCES Klient(IDUzytkownika);


ALTER TABLE ZamowienieJedzenia
ADD CONSTRAINT FK_Zamowienie_Restauracja
FOREIGN KEY(NIP)
REFERENCES Restauracja(NIP);


--wypelnione
INSERT INTO Restauracja VALUES(4920581583, '2005-04-19', 407.93, 'Nowa');
INSERT INTO Restauracja VALUES(8362749104, '2006-04-19', 408.93, 'dobra');
INSERT INTO Restauracja VALUES(1847264002, '2006-04-19', 408.93, 'mila');

--select *
--from Restauracja;


--wypelnione
INSERT INTO Klient VALUES(1, 'Marcin', 'Zabkowski', '2000-07-16', 'M', 12345678901, 'Polskie', 'Warszawa', 1847264002);
INSERT INTO Klient VALUES(2, 'Dominik', 'Dobry', '2002-02-20', 'M', 12345618901, 'Polskie', 'Radom', 1847264002);
INSERT INTO Klient VALUES(3, 'Dzesika', 'Borto', '2002-10-22', 'K', 28956946183,'Polskie', 'Lodz', 1847264002);
INSERT INTO Klient VALUES(4, 'Mateusz', 'Swiech', '1999-09-20', 'M', 89852880291, 'Polskie', 'Lodz', 1847264002);
INSERT INTO Klient VALUES(5, 'Lukasz', 'Chmielowiec', '1999-11-20', 'M', 36453833868, 'Polskie', 'Poznan', 1847264002);
INSERT INTO Klient VALUES(6, 'Anna', 'Szczera', '2001-01-09', 'K', 13789844882, 'Polskie', 'Bydgoszcz', 1847264002);
INSERT INTO Klient VALUES(7, 'Mariusz', 'Kaminski', '2007-11-25', 'M', 42498752103, 'Polskie', 'Sosnowiec', 1847264002);
INSERT INTO Klient VALUES(8, 'Jaroslaw', 'Nowicki', '2001-11-04', 'M', 82564199588, 'Polskie', 'Karpacz', 1847264002);
INSERT INTO Klient VALUES(9, 'Maria', 'Nowacka', '1992-04-17', 'K', 79683187314, 'Polskie', 'Radomsko', 1847264002);
INSERT INTO Klient VALUES(10, 'Antonina', 'Spokojna', '2000-07-10', 'K', 76411155769, 'Polskie', 'Gdansk', 1847264002);
INSERT INTO Klient VALUES(11, 'Niels', 'James', '2003-05-04', 'M', 42771664109, 'Niemiecki', 'Monachium', 1847264002);
INSERT INTO Klient VALUES(12, 'Dominik', 'Strzelczyk', '2001-09-19', 'M', 81416393468, 'Polskie', 'Szczecin', 1847264002);
INSERT INTO Klient VALUES(13, 'Przemyslaw', 'Sedek', '1995-12-01', 'M', 45922115200, 'Polskie', 'Bialystok', 1847264002);
INSERT INTO Klient VALUES(14, 'Diana', 'Lesniak', '2000-10-18', 'K', 77359328834, 'Polskie', 'Warszawa', 1847264002);
INSERT INTO Klient VALUES(15, 'Sandra', 'Smierzynska', '1990-06-12', 'K', 73878235112, 'Polskie', 'Warszawa', 1847264002);
INSERT INTO Klient VALUES(16, 'Bartosz', 'Zak', '2004-05-18', 'M', 71197705724, 'Polskie', 'Katowice', 1847264002);
INSERT INTO Klient VALUES(17, 'Andrzej', 'Kowalski', '2005-07-14', 'M', 84582970489, 'Polskie', 'Wroclaw', 1847264002);
INSERT INTO Klient VALUES(18, 'Marta', 'Zagumna', '1992-11-27', 'K', 72494924771, 'Polskie', 'Gniezno', 1847264002);
INSERT INTO Klient VALUES(19, 'Blazej', 'Chojny', '2000-11-30', 'M', 43105112523, 'Polskie', 'Gorzow', 1847264002);
INSERT INTO Klient VALUES(20, 'Anastazja', 'Ostrocka', '1993-03-13', 'K', 78743485245, 'Polskie', 'Wisla', 1847264002);
INSERT INTO Klient VALUES(21, 'Albert', 'Brocki', '2001-06-20', 'M', 54585801283, 'Polskie', 'Lodz', 1847264002);
INSERT INTO Klient VALUES(22, 'Monika', 'Ostrowska', '2005-10-3', 'K', 23923943319, 'Polskie', 'Davos', 1847264002);
INSERT INTO Klient VALUES(23, 'Astoria', 'Malinowa', '1992-9-16', 'K', 89465722058, 'Polskie', 'Radoslaw', 1847264002);
INSERT INTO Klient VALUES(24, 'Mariola', 'Rozda', '1999-7-25', 'K', 17749864489, 'Polskie', 'Baltow', 1847264002);
INSERT INTO Klient VALUES(25, 'John', 'Neils', '1999-1-18', 'M', 39110647003, 'Polskie', 'Sanok', 1847264002);
INSERT INTO Klient VALUES(26, 'Jonatan', 'Pobozny', '1996-6-10', 'M', 52940936244, 'Polskie', 'Olkusz', 1847264002);
INSERT INTO Klient VALUES(27, 'Boguslaw', 'Mily', '1999-3-10', 'M', 27845976254, 'Polskie', 'Duzy Dol', 1847264002);
INSERT INTO Klient VALUES(28, 'Diana', 'Wiosenna', '1999-1-23', 'K', 91180800007, 'Polskie', 'Narwisko', 1847264002);
INSERT INTO Klient VALUES(29, 'Ariana', 'Troskliwa', '1993-5-10', 'K', 11007951256, 'Polskie', 'Maniewo', 1847264002);
INSERT INTO Klient VALUES(30, 'Zbigniew', 'Wetny', '1991-2-12', 'M', 10117845060, 'Polskie', 'Masno', 1847264002);
INSERT INTO Klient VALUES(31, 'Adrian', 'Utny', '2007-6-7', 'M', 32979850670, 'Polskie', 'Poliszew', 1847264002);
INSERT INTO Klient VALUES(32, 'Julia', 'Sumienna', '1997-3-7', 'K', 41622383872, 'Polskie', 'Zakopane', 1847264002);
INSERT INTO Klient VALUES(33, 'Micheal', 'Jack', '1999-1-22', 'M', 85432688878, 'Polskie', 'Krakow', 1847264002);
INSERT INTO Klient VALUES(34, 'Bartosz', 'Bro', '2008-8-11', 'M', 62039485837, 'Polskie', 'Sarono', 1847264002);
INSERT INTO Klient VALUES(35, 'Marcin', 'Beben', '2002-5-10', 'M', 77210863321, 'Polskie', 'Uliszew', 1847264002);
INSERT INTO Klient VALUES(36, 'Jerzy', 'Zabkowski', '2005-05-20', 'M', 73721085463, 'Polskie', 'Mrozy', 1847264002);
INSERT INTO Klient VALUES(37, 'Michal', 'Wojtyra', '2000-5-10', 'M', 64765692519, 'Polskie', 'Kaluszyn', 1847264002);
INSERT INTO Klient VALUES(38, 'Przemyslaw', 'Sendowski', '2009-7-8', 'M', 31737605924, 'Polskie', 'Terespol', 1847264002);
INSERT INTO Klient VALUES(39, 'Magda', 'Wrzosek', '1992-9-6', 'K', 25661153630, 'Polskie', 'Wal Mazowiecki', 1847264002);
INSERT INTO Klient VALUES(40, 'Monika', 'Erowska', '2001-2-12', 'K', 25336671680, 'Polskie', 'Polesie', 1847264002);
INSERT INTO Klient VALUES(41, 'Andrzej', 'Zajac', '1994-6-7', 'M', 69863162280, 'Polskie', 'Olsztyn', 1847264002);
INSERT INTO Klient VALUES(42, 'Maciej', 'Zajac', '2003-2-20', 'M', 74134323117, 'Polskie', 'Grodno', 1847264002);
INSERT INTO Klient VALUES(43, 'Mikolaj', 'Lipinski', '1990-9-6', 'M', 30811527026, 'Polskie', 'Koszalin', 1847264002);
INSERT INTO Klient VALUES(44, 'Janusz', 'Dom', '1992-3-8', 'M', 81005879685, 'Polskie', 'Gliwice', 1847264002);
INSERT INTO Klient VALUES(45, 'Anna', 'Wesolowska', '1994-10-4', 'K', 29388817503, 'Polskie', 'Byton', 1847264002);
INSERT INTO Klient VALUES(46, 'Ewa', 'Pierwsza', '1993-4-22', 'M', 18933525675, 'Polskie', 'Mieszkalne', 1847264002);
INSERT INTO Klient VALUES(47, 'Iwona', 'Glownia', '1998-4-11', 'M', 45618891016, 'Polskie', 'Lodz', 1847264002);
INSERT INTO Klient VALUES(48, 'Konrad', 'Glownia', '1998-4-11', 'M', 80788489122, 'Polskie', 'Poznan', 1847264002);
INSERT INTO Klient VALUES(49, 'Jan', 'Nowicki', '2001-11-15', 'M', 31947068448, 'Australijskie', 'Melbourne', 1847264002);
INSERT INTO Klient VALUES(50, 'Nick', 'Americano', '2001-06-20', 'M', 12692739495, 'Polskie', 'Mrozna Kraina', 1847264002);
INSERT INTO Klient VALUES(51, 'Sara', 'James', '2001-06-20', 'K', 20756103653, 'Polskie', 'Zawirucha', 1847264002);
INSERT INTO Klient VALUES(52, 'Konstanty', 'Brocki', '1992-7-6', 'M', 80991769040, 'Polskie', 'Polno', 1847264002);
INSERT INTO Klient VALUES(53, 'Zuzanna', 'Jablonska', '1993-4-15', 'K', 47857385646, 'Polskie', 'SwietyOgrod', 1847264002);
INSERT INTO Klient VALUES(54, 'Angelika', 'Szczupla', '2007-3-2', 'K', 48395523053, 'Polskie', 'Lodz', 1847264002);
INSERT INTO Klient VALUES(55, 'Marianna', 'Wichowska', '2006-10-3', 'K', 24306904766, 'Kobosko', 'MalaSucha', 1847264002);
INSERT INTO Klient VALUES(56, 'Lukasz', 'Wichrocki', '1996-10-23', 'M', 23966880120, 'Polskie', 'Lodz', 1847264002);
INSERT INTO Klient VALUES(57, 'Oskar', 'Dab', '2007-6-12', 'M', 14973249963, 'Polskie', 'Wengrzynew', 1847264002);
INSERT INTO Klient VALUES(58, 'Kasper', 'Lipka', '2003-10-27', 'M', 82565104677, 'Polskie', 'Maly Las', 1847264002);
INSERT INTO Klient VALUES(59, 'Kasper', 'Gawronski', '1994-2-20', 'M', 24311520198, 'Polskie', 'Las', 1847264002);
INSERT INTO Klient VALUES(60, 'Kacper', 'Bodnar', '1995-9-23', 'M', 44160736377, 'Polskie', 'Lidzbark', 1847264002);
INSERT INTO Klient VALUES(61, 'Nicole', 'Shlezenger', '1999-9-10', 'K', 21332088558, 'Polskie', 'Pogorzelec', 1847264002);
INSERT INTO Klient VALUES(62, 'Mariusz', 'Polak', '1995-2-23', 'M', 35948708964, 'Polskie', 'Augustowka', 1847264002);
INSERT INTO Klient VALUES(63, 'Anastazy', 'Polaczek', '1994-7-4', 'M', 13529551440, 'Polskie', 'Wieliszew', 1847264002);
INSERT INTO Klient VALUES(64, 'Antoni', 'Krajowy', '2001-06-20', 'M', 15797478137, 'Hiszpanskie', 'Barcelona', 1847264002);
INSERT INTO Klient VALUES(65, 'Bogumil', 'Mily', '2008-9-9', 'M', 75656358323, 'Hiszpanskie', 'Madryt', 1847264002);
INSERT INTO Klient VALUES(66, 'Dominik', 'Swiety', '1990-3-22', 'M', 07221136747, 'Singapurskie', 'Singapur', 1847264002);
INSERT INTO Klient VALUES(67, 'Dominik', 'zaczarowany', '1992-11-17', 'M', 97336478597, 'Monakijskie', 'Monako', 1847264002);
INSERT INTO Klient VALUES(68, 'Konstanty', 'Galczynski', '1996-2-14', 'M', 93319116377, 'Polskie', 'Augustow', 1847264002);
INSERT INTO Klient VALUES(69, 'Marcin', 'Nietyko', '2007-8-24', 'M', 72598505213, 'Polskie', 'Walbrzych', 1847264002);
INSERT INTO Klient VALUES(70, 'Michal', 'Pobozny', '1991-7-6', 'M', 66727766448, 'Polskie', 'Wieliczka', 1847264002);
INSERT INTO Klient VALUES(71, 'Marcin', 'Zamrocki', '2005-10-17', 'M', 62918669252, 'Polskie', 'Gniezdno', 1847264002);
INSERT INTO Klient VALUES(72, 'Jerzy', 'Gadula', '1993-8-15', 'M', 50454252899, 'Polskie', 'Grodno', 1847264002);
INSERT INTO Klient VALUES(73, 'Julia', 'Podgorska',  '2003-7-5', 'K', 84016208287, 'Polskie', 'Zamosc', 1847264002);
INSERT INTO Klient VALUES(74, 'Kamila', 'Szczesna', '2000-11-4', 'K', 95196549663, 'Polskie', 'Torun', 1847264002);
INSERT INTO Klient VALUES(75, 'Alina', 'Domyslna', '1990-2-17', NULL, 72815039876, 'Polskie', 'Bydgoszcz', 1847264002);
INSERT INTO Klient VALUES(76, 'Tomasz', 'Borowski', '1996-11-16', 'M', 95482122556, 'Polskie', 'Szczecin', 1847264002);
INSERT INTO Klient VALUES(77, 'Nel', 'Zabkowska', '1996-1-8', 'M', 91169051471, 'Niemiecki', 'Monachium', 1847264002);
INSERT INTO Klient VALUES(78, 'Samara', 'Kimono', '1990-9-22', 'M', 47215815898, 'Niemieckie', 'Berlin', 1847264002);
INSERT INTO Klient VALUES(79, 'Dzesika', 'Hojna', '2003-8-12', 'M', 58443854027, 'Serbskie', 'Belgrad', 1847264002);
INSERT INTO Klient VALUES(80, 'Mateusz', 'Czesty', '2007-8-17', 'M', 54672920493, 'RPA', 'Kapsztad', 1847264002);
INSERT INTO Klient VALUES(81, 'Katarzyna', 'Gestowa', '1990-7-11', 'M', 47227593843, 'Rosyjskie', 'Moskwa', 1847264002);
INSERT INTO Klient VALUES(82, 'Jacek', 'Slusarz', '1997-5-27', 'M', 74180541089, 'Amerykanskie', 'Los Angeles', 1847264002);
INSERT INTO Klient VALUES(83, 'Witold', 'Tomczyk', '1991-8-2', 'M', 14786449403, 'Polskie', 'Skierniewice', 1847264002);
INSERT INTO Klient VALUES(84, 'Michal', 'Sadownik', '2005-9-19', 'M', 99406367688, 'Polskie', 'Walbrzych', 1847264002);

select *
from Klient;

--
-- --wypelnione
INSERT INTO ZamowienieJedzenia VALUES(1, '2016-02-12', 4920581583 ,1);
INSERT INTO ZamowienieJedzenia VALUES(2, '2012-09-08', 4920581583,2);
INSERT INTO ZamowienieJedzenia VALUES(3, '2017-11-01', 4920581583,3);
INSERT INTO ZamowienieJedzenia VALUES(4, '2010-07-22', 4920581583,4);
INSERT INTO ZamowienieJedzenia VALUES(5, '2011-10-25', 4920581583,1);
INSERT INTO ZamowienieJedzenia VALUES(6, '2018-12-23', 4920581583,7);
INSERT INTO ZamowienieJedzenia VALUES(7, '2006-12-03', 4920581583,19);
INSERT INTO ZamowienieJedzenia VALUES(8, '2010-01-09', 4920581583,20);
INSERT INTO ZamowienieJedzenia VALUES(9, '2009-07-02', 4920581583,6);
INSERT INTO ZamowienieJedzenia VALUES(10, '2014-11-17', 4920581583,19);
INSERT INTO ZamowienieJedzenia VALUES(11, '2009-05-13', 4920581583,20);
INSERT INTO ZamowienieJedzenia VALUES(12, '2016-09-16', 4920581583,15);
INSERT INTO ZamowienieJedzenia VALUES(13, '2006-03-24', 4920581583,12);
INSERT INTO ZamowienieJedzenia VALUES(14, '2008-07-07', 4920581583,15);
INSERT INTO ZamowienieJedzenia VALUES(15, '2014-12-01', 4920581583,7);
INSERT INTO ZamowienieJedzenia VALUES(16, '2013-12-07', 8362749104,10);
INSERT INTO ZamowienieJedzenia VALUES(17, '2007-01-11', 8362749104,5);
INSERT INTO ZamowienieJedzenia VALUES(18, '2017-11-01', 8362749104,15);
INSERT INTO ZamowienieJedzenia VALUES(19, '2008-05-10', 8362749104,2);
INSERT INTO ZamowienieJedzenia VALUES(20, '2015-05-09', 8362749104,10);
INSERT INTO ZamowienieJedzenia VALUES(21, '2008-09-15', 8362749104,7);
INSERT INTO ZamowienieJedzenia VALUES(22, '2018-04-06', 8362749104,12);
INSERT INTO ZamowienieJedzenia VALUES(23, '2009-05-24', 8362749104,11);
INSERT INTO ZamowienieJedzenia VALUES(24, '2008-03-22', 8362749104,3);
INSERT INTO ZamowienieJedzenia VALUES(25, '2009-04-15', 8362749104,1);
INSERT INTO ZamowienieJedzenia VALUES(26, '2010-02-21', 8362749104,9);
INSERT INTO ZamowienieJedzenia VALUES(27, '2013-11-27', 8362749104,4);
INSERT INTO ZamowienieJedzenia VALUES(28, '2015-08-12', 8362749104,12);
INSERT INTO ZamowienieJedzenia VALUES(29, '2015-8-22', 8362749104,13);
INSERT INTO ZamowienieJedzenia VALUES(30, '2021-3-9', 8362749104,10);
INSERT INTO ZamowienieJedzenia VALUES(31, '2021-10-20', 8362749104,21);
INSERT INTO ZamowienieJedzenia VALUES(32, '2018-9-4', 8362749104,8);
INSERT INTO ZamowienieJedzenia VALUES(33, '2015-9-16', 8362749104,9);
INSERT INTO ZamowienieJedzenia VALUES(34, '2019-11-13', 8362749104,51);
INSERT INTO ZamowienieJedzenia VALUES(35, '2018-1-5', 8362749104,64);
INSERT INTO ZamowienieJedzenia VALUES(36, '2022-8-24', 8362749104,21);
INSERT INTO ZamowienieJedzenia VALUES(37, '2010-4-19', 8362749104,2);
INSERT INTO ZamowienieJedzenia VALUES(38, '2020-11-26', 8362749104,42);
INSERT INTO ZamowienieJedzenia VALUES(39, '2014-1-25', 8362749104,15);
INSERT INTO ZamowienieJedzenia VALUES(40, '2015-1-8', 8362749104,17);
INSERT INTO ZamowienieJedzenia VALUES(41, '2012-6-5', 8362749104,69);
INSERT INTO ZamowienieJedzenia VALUES(42, '2020-4-17', 8362749104,18);
INSERT INTO ZamowienieJedzenia VALUES(43, '2020-8-22', 8362749104,7);
INSERT INTO ZamowienieJedzenia VALUES(44, '2012-11-24', 8362749104,43);
INSERT INTO ZamowienieJedzenia VALUES(45, '2022-6-9', 8362749104,21);
INSERT INTO ZamowienieJedzenia VALUES(46, '2013-7-24', 8362749104,64);
INSERT INTO ZamowienieJedzenia VALUES(47, '2021-10-6', 8362749104,28);
INSERT INTO ZamowienieJedzenia VALUES(48, '2021-1-27', 8362749104,12);
INSERT INTO ZamowienieJedzenia VALUES(49, '2012-8-13', 8362749104,64);
INSERT INTO ZamowienieJedzenia VALUES(50, '2017-8-18', 8362749104,63);
INSERT INTO ZamowienieJedzenia VALUES(51, '2013-8-15', 8362749104,8);
INSERT INTO ZamowienieJedzenia VALUES(52, '2017-1-15', 8362749104,61);
INSERT INTO ZamowienieJedzenia VALUES(53, '2022-6-25', 8362749104,30);
INSERT INTO ZamowienieJedzenia VALUES(54, '2017-4-11', 8362749104,8);
INSERT INTO ZamowienieJedzenia VALUES(55, '2011-2-3', 8362749104,38);
INSERT INTO ZamowienieJedzenia VALUES(56, '2019-5-18', 8362749104,10);
INSERT INTO ZamowienieJedzenia VALUES(57, '2010-4-24', 8362749104,5);
INSERT INTO ZamowienieJedzenia VALUES(58, '2012-4-4', 8362749104,2);
INSERT INTO ZamowienieJedzenia VALUES(59, '2016-3-3', 8362749104,54);
INSERT INTO ZamowienieJedzenia VALUES(60, '2019-6-25', 8362749104,49);
INSERT INTO ZamowienieJedzenia VALUES(61, '2012-7-1', 8362749104,1);
INSERT INTO ZamowienieJedzenia VALUES(62, '2016-11-4', 8362749104,10);
INSERT INTO ZamowienieJedzenia VALUES(63, '2020-7-9', 8362749104,62);
INSERT INTO ZamowienieJedzenia VALUES(64, '2015-3-19', 8362749104,9);
INSERT INTO ZamowienieJedzenia VALUES(65, '2022-9-9', 8362749104,56);
INSERT INTO ZamowienieJedzenia VALUES(66, '2015-1-25', 8362749104,42);
INSERT INTO ZamowienieJedzenia VALUES(67, '2015-5-16', 8362749104,61);
INSERT INTO ZamowienieJedzenia VALUES(68, '2022-6-23', 8362749104,8);
INSERT INTO ZamowienieJedzenia VALUES(69, '2019-7-13', 8362749104,16);
INSERT INTO ZamowienieJedzenia VALUES(70, '2016-10-9', 8362749104,67);

select *
from ZamowienieJedzenia;


-- --wypelnione
INSERT INTO Gracz VALUES(1, 2, 1, 1);
INSERT INTO Gracz VALUES(2, 5, 4, 3);
INSERT INTO Gracz VALUES(3, 32, 2, 4);
INSERT INTO Gracz VALUES(4, 30, 3, 6);
INSERT INTO Gracz VALUES(5, 23, 1, 7);
INSERT INTO Gracz VALUES(6, 11, 5, 9);
INSERT INTO Gracz VALUES(7, 3, 6, 10);
INSERT INTO Gracz VALUES(8, 42, 1, 12);
INSERT INTO Gracz VALUES(9, 8, 3, 13);
INSERT INTO Gracz VALUES(10, 8, 3, 14);
INSERT INTO Gracz VALUES(11, 68, 4, 15);
INSERT INTO Gracz VALUES(12, 23, 4, 18);
INSERT INTO Gracz VALUES(13, 8, 3, 19);
INSERT INTO Gracz VALUES(14, 17, 10, 20);
INSERT INTO Gracz VALUES(15, 71, 18, 21);
INSERT INTO Gracz VALUES(16, 52, 14, 23);
INSERT INTO Gracz VALUES(17, 60, 19, 24);
INSERT INTO Gracz VALUES(18, 93, 7, 25);
INSERT INTO Gracz VALUES(19, 82, 4, 18);
INSERT INTO Gracz VALUES(20, 48, 11, 50);
INSERT INTO Gracz VALUES(21, 99, 11, 59);
INSERT INTO Gracz VALUES(22, 69, 2, 63);
INSERT INTO Gracz VALUES(23, 54, 14, 22);
INSERT INTO Gracz VALUES(24, 1, 13, 35);
INSERT INTO Gracz VALUES(25, 61, 4, 60);
INSERT INTO Gracz VALUES(26, 66, 13, 26);
INSERT INTO Gracz VALUES(27, 15, 11, 34);
INSERT INTO Gracz VALUES(28, 92, 4, 17);
INSERT INTO Gracz VALUES(29, 22, 6, 9);
INSERT INTO Gracz VALUES(30, 15, 15, 62);
INSERT INTO Gracz VALUES(31, 36, 17, 22);
INSERT INTO Gracz VALUES(32, 57, 4, 17);
INSERT INTO Gracz VALUES(33, 43, 17, 68);
INSERT INTO Gracz VALUES(34, 75, 2, 63);
INSERT INTO Gracz VALUES(35, 2, 15, 27);
INSERT INTO Gracz VALUES(36, 22, 13, 30);
INSERT INTO Gracz VALUES(37, 74, 4, 16);
INSERT INTO Gracz VALUES(38, 83, 17, 63);
INSERT INTO Gracz VALUES(39, 82, 12, 20);
INSERT INTO Gracz VALUES(40, 28, 2, 17);
INSERT INTO Gracz VALUES(41, 68, 2, 62);
INSERT INTO Gracz VALUES(42, 39, 5, 37);
INSERT INTO Gracz VALUES(43, 18, 18, 2);
INSERT INTO Gracz VALUES(44, 37, 18, 18);
INSERT INTO Gracz VALUES(45, 35, 12, 29);
INSERT INTO Gracz VALUES(46, 16, 17, 17);
INSERT INTO Gracz VALUES(47, 61, 16, 45);
INSERT INTO Gracz VALUES(48, 32, 17, 13);
INSERT INTO Gracz VALUES(49, 69, 14, 68);
INSERT INTO Gracz VALUES(50, 51, 2, 38);
INSERT INTO Gracz VALUES(51, 99, 16, 58);
INSERT INTO Gracz VALUES(52, 15, 14, 51);
INSERT INTO Gracz VALUES(53, 24, 16, 14);
INSERT INTO Gracz VALUES(54, 11, 7, 8);
INSERT INTO Gracz VALUES(55, 55, 15, 36);
INSERT INTO Gracz VALUES(56, 39, 17, 18);
INSERT INTO Gracz VALUES(57, 55, 14, 47);
INSERT INTO Gracz VALUES(58, 53, 14, 2);
INSERT INTO Gracz VALUES(59, 6, 10, 11);
INSERT INTO Gracz VALUES(60, 34, 1, 62);
INSERT INTO Gracz VALUES(61, 99, 15, 26);
INSERT INTO Gracz VALUES(62, 48, 11, 69);
INSERT INTO Gracz VALUES(63, 53, 13, 68);
INSERT INTO Gracz VALUES(64, 91, 4, 69);
INSERT INTO Gracz VALUES(65, 7, 5, 50);
INSERT INTO Gracz VALUES(66, 78, 16, 36);
INSERT INTO Gracz VALUES(67, 40, 11, 25);
INSERT INTO Gracz VALUES(68, 86, 10, 13);
INSERT INTO Gracz VALUES(69, 3, 4, 26);
INSERT INTO Gracz VALUES(70, 91, 7, 61);
INSERT INTO Gracz VALUES(71, 68, 2, 13);
INSERT INTO Gracz VALUES(72, 3, 10, 5);
INSERT INTO Gracz VALUES(73, 71, 12, 37);

select *
from Gracz;

-- --wypelnione
INSERT INTO Komputer VALUES(1, 'BlackDragon', '2005-04-19', 'Windows', 'HP', 2004 );
INSERT INTO Komputer VALUES(2, 'Wizzard', '2006-03-02', 'Windows', 'AMD', 2005 );
INSERT INTO Komputer VALUES(3, 'DarkKnifth', '2005-07-12', 'IOS', 'Apple', 2005 );
INSERT INTO Komputer VALUES(4, 'BloodySky', '2007-09-20', 'Windows', 'HP', 2007 );
INSERT INTO Komputer VALUES(5, 'RedWave', '2008-9-12', 'Linux', 'IBM', 2008 );
INSERT INTO Komputer VALUES(6, 'RedMoon', '2008-4-12', 'Linux', 'IBM', 2008 );
INSERT INTO Komputer VALUES(7, 'BlackSun', '2008-6-4', 'IOS', 'Apple', 2008 );
INSERT INTO Komputer VALUES(8, 'Memoriiesss', '2006-4-9', 'Linux', 'HP', 2005 );
INSERT INTO Komputer VALUES(9, 'RedWave2', '2009-7-21', 'Linux', 'IBM', 2008 );
INSERT INTO Komputer VALUES(10, 'Polaris', '2009-1-9', 'Windows', 'HP', 2009 );
INSERT INTO Komputer VALUES(11, 'Solaris', '2008-10-7', 'Linux', 'IBM', 2008 );
INSERT INTO Komputer VALUES(12, 'Machine', '2005-5-17', 'Windows', 'IBM', 2004 );
INSERT INTO Komputer VALUES(13, 'NewOne', '2009-2-13', 'Linux', 'IBM', 2009 );
INSERT INTO Komputer VALUES(14, 'BetterMe', '2007-10-7', 'Linux', 'HP', 2007 );
INSERT INTO Komputer VALUES(15, 'Optimus', '2008-4-16', 'Windows', 'AMD', 2008 );
INSERT INTO Komputer VALUES(16, 'Optical', '2008-4-16', 'Linux', 'IBM', 2007 );
INSERT INTO Komputer VALUES(17, 'Mystery', '2009-7-1', 'Windows', 'IBM', 2008 );
INSERT INTO Komputer VALUES(18, 'Fedy', '2006-10-7', 'Windows', 'IBM', 2006 );
INSERT INTO Komputer VALUES(19, 'Faster3', '2007-1-23', 'Linux', 'AMD', 2005 );
INSERT INTO Komputer VALUES(20, 'BTHX', '2009-9-27', 'Linux', 'IBM', 2009 );
INSERT INTO Komputer VALUES(21, 'HFVS', '2007-11-1', 'Linux', 'AMD', 2006 );

select *
from Komputer;

-- --wypelnione
INSERT INTO RezerwacjaKomputera VALUES(1, 2, '2007-11-23 12:29:43', 47, 11);
INSERT INTO RezerwacjaKomputera VALUES(2, 12, '2009-04-26 12:29:43', 58, 1);
INSERT INTO RezerwacjaKomputera VALUES(3, 23, '2017-07-27 12:29:43', 61, 2);
INSERT INTO RezerwacjaKomputera VALUES(4, 1, '2010-12-23 12:29:43', 29, 4);
INSERT INTO RezerwacjaKomputera VALUES(8, 26, '2010-07-13 12:29:43', 73, 19);
INSERT INTO RezerwacjaKomputera VALUES(10, 6, '2022-08-12 12:29:43', 4, 7);
INSERT INTO RezerwacjaKomputera VALUES(11, 9, '2007-05-19 12:29:43', 59, 1);
INSERT INTO RezerwacjaKomputera VALUES(12, 19, '2006-01-01 12:29:43', 69, 12);
INSERT INTO RezerwacjaKomputera VALUES(13, 28, '2014-11-27 17:29:43', 45, 7);
INSERT INTO RezerwacjaKomputera VALUES(16, 13, '2017-09-13 12:29:43', 70, 1);
INSERT INTO RezerwacjaKomputera VALUES(17, 2, '2019-12-16 12:29:43', 22, 14);
INSERT INTO RezerwacjaKomputera VALUES(18, 12, '2013-11-24 11:21:35', 11, 17);
INSERT INTO RezerwacjaKomputera VALUES(19, 15, '2016-09-08 22:33:15', 35, 10);
INSERT INTO RezerwacjaKomputera VALUES(20, 14, '2017-01-15 13:23:08', 1, 4);
INSERT INTO RezerwacjaKomputera VALUES(21, 29, '2012-04-11 08:34:21', 37, 4);
INSERT INTO RezerwacjaKomputera VALUES(22, 42, '2022-03-07 02:18:08', 1, 4);
INSERT INTO RezerwacjaKomputera VALUES(23, 60, '2020-06-25 08:13:52', 54, 14);
INSERT INTO RezerwacjaKomputera VALUES(24, 64, '2010-05-05 19:27:10', 18, 2);
INSERT INTO RezerwacjaKomputera VALUES(25, 63, '2016-05-06 10:01:36', 62, 10);
INSERT INTO RezerwacjaKomputera VALUES(26, 60, '2020-06-25 08:13:52', 1, 4);
INSERT INTO RezerwacjaKomputera VALUES(27, 61, '2022-03-25 11:24:40', 26, 5);
INSERT INTO RezerwacjaKomputera VALUES(28, 47, '2016-06-08 15:11:29', 29, 9);
INSERT INTO RezerwacjaKomputera VALUES(29, 36, '2019-02-26 03:02:00', 21, 3);
INSERT INTO RezerwacjaKomputera VALUES(30, 48, '2015-01-04 14:24:38', 64, 15);
INSERT INTO RezerwacjaKomputera VALUES(31, 2, '2011-10-24 04:24:01', 7, 2);
INSERT INTO RezerwacjaKomputera VALUES(32, 22, '2020-05-11 10:28:31', 45, 18);
INSERT INTO RezerwacjaKomputera VALUES(34, 22, '2012-10-17 02:53:49', 65, 11);
INSERT INTO RezerwacjaKomputera VALUES(35, 12, '2010-06-15 09:17:59', 3, 20);
INSERT INTO RezerwacjaKomputera VALUES(36, 28, '2014-04-06 01:08:53', 51, 12);
INSERT INTO RezerwacjaKomputera VALUES(37, 23, '2022-09-26 03:15:59', 5, 8);
INSERT INTO RezerwacjaKomputera VALUES(38, 1, '2016-03-02 00:10:36', 38, 12);
INSERT INTO RezerwacjaKomputera VALUES(41, 33, '2019-03-16 08:17:30', 50, 12);
INSERT INTO RezerwacjaKomputera VALUES(42, 65, '2014-06-01 02:55:26', 1, 1);
INSERT INTO RezerwacjaKomputera VALUES(45, 5, '2020-01-18 00:10:12', 28, 3);
INSERT INTO RezerwacjaKomputera VALUES(47, 21, '2011-01-25 00:07:08', 56, 15);
INSERT INTO RezerwacjaKomputera VALUES(48, 2, '2018-04-19 14:22:22', 2, 11);
INSERT INTO RezerwacjaKomputera VALUES(50, 22, '2011-10-17 12:30:25', 68, 10);
INSERT INTO RezerwacjaKomputera VALUES(52, 47, '2019-10-07 13:02:42', 10, 19);
INSERT INTO RezerwacjaKomputera VALUES(53, 23, '2017-07-18 18:40:54', 29, 11);
INSERT INTO RezerwacjaKomputera VALUES(54, 67, '2010-07-13 15:07:42', 19, 8);
INSERT INTO RezerwacjaKomputera VALUES(55, 35, '2013-05-23 19:04:59', 41, 19);
INSERT INTO RezerwacjaKomputera VALUES(56, 30, '2012-05-02 11:25:07', 51, 18);
INSERT INTO RezerwacjaKomputera VALUES(57, 68, '2015-01-22 16:01:47', 7, 18);
INSERT INTO RezerwacjaKomputera VALUES(58, 19, '2012-09-11 01:14:48', 13, 17);
INSERT INTO RezerwacjaKomputera VALUES(61, 55, '2012-09-21 20:24:53', 2, 18);
INSERT INTO RezerwacjaKomputera VALUES(63, 16, '2013-09-04 19:31:16', 55, 5);
INSERT INTO RezerwacjaKomputera VALUES(64, 38, '2019-04-23 20:44:00', 70, 7);
INSERT INTO RezerwacjaKomputera VALUES(65, 20, '2015-11-02 12:07:12', 2, 9);
INSERT INTO RezerwacjaKomputera VALUES(66, 19, '2010-05-06 22:53:06', 19, 8);
INSERT INTO RezerwacjaKomputera VALUES(67, 31, '2017-02-09 14:31:58', 71, 10);
INSERT INTO RezerwacjaKomputera VALUES(68, 55, '2011-09-23 21:26:17', 64, 18);
INSERT INTO RezerwacjaKomputera VALUES(69, 66, '2013-05-15 16:08:06', 15, 16);
INSERT INTO RezerwacjaKomputera VALUES(70, 17, '2017-02-20 05:39:33', 5, 5);
INSERT INTO RezerwacjaKomputera VALUES(71, 29, '2015-03-19 15:37:02', 72, 12);

select *
from RezerwacjaKomputera;

-- --wypelnione
INSERT INTO Druzyna VALUES(1,'BlackWidows', 3, 'EUWest', 'BladeX');
INSERT INTO Druzyna VALUES(2,'NightRiders', 7, 'NA', 'Runner');
INSERT INTO Druzyna VALUES(3,'GameReaders', 9, 'SA', 'Disney');
INSERT INTO Druzyna VALUES(4,'GameChangers', 6, 'NA', 'DayZ');
INSERT INTO Druzyna VALUES(5,'BackIsReal', 4, 'EUEast', 'Rocky');
INSERT INTO Druzyna VALUES(6,'Naughties', 7, 'EUEast', 'SouthEast');
INSERT INTO Druzyna VALUES(7,'GGandBB', 6, 'Arfica', 'Darky');
INSERT INTO Druzyna VALUES(8,'LuckyWe', 6, 'Asia', 'Termashine');
INSERT INTO Druzyna VALUES(9,'GoGyal', 10, 'Asia', 'Lollipop');
INSERT INTO Druzyna VALUES(10,'ModernSyles', 5, 'Asia', 'LiderY');
INSERT INTO Druzyna VALUES(11,'WeGotU', 5, 'EUWest', 'Porando');
INSERT INTO Druzyna VALUES(12,'WeRock', 7, 'EUWest', 'OutOfZone');
INSERT INTO Druzyna VALUES(13,'FF15', 12, 'Australia', '10TimesBetter');
INSERT INTO Druzyna VALUES(14,'WeAllUnited', 18, 'EUCentral', 'XYXYX');
INSERT INTO Druzyna VALUES(15,'Unity', 9, 'EUWest', 'SpicyTaste');
INSERT INTO Druzyna VALUES(16,'DarkDream', 14, 'Australia', 'HereIAM');
INSERT INTO Druzyna VALUES(17,'Blessed', 16, 'EUEast', 'Mindset');
INSERT INTO Druzyna VALUES(18,'WeJudge', 8, 'EUWest', 'YourBadDream');
INSERT INTO Druzyna VALUES(19,'Zombies', 8, 'EUWest', 'GuessWho');
INSERT INTO Druzyna VALUES(20,'HighEnd', 9, 'EUEast', 'PinkFlover');

select *
from Druzyna;

--
-- --wypelnione
INSERT INTO RejestracjaWDruzynie VALUES(1,'2007-01-19', 1,1);
INSERT INTO RejestracjaWDruzynie VALUES(2,'2007-11-21', 2,2);
INSERT INTO RejestracjaWDruzynie VALUES(3,'2008-01-03', 3,3);
INSERT INTO RejestracjaWDruzynie VALUES(4,'2007-12-31', 4,4);
INSERT INTO RejestracjaWDruzynie VALUES(5,'2008-06-09', 5,5);
INSERT INTO RejestracjaWDruzynie VALUES(6,'2007-11-27', 6,6);
INSERT INTO RejestracjaWDruzynie VALUES(7,'2009-7-12', 66,7);
INSERT INTO RejestracjaWDruzynie VALUES(8,'2009-11-19', 25,20);
INSERT INTO RejestracjaWDruzynie VALUES(9,'2009-2-21', 41,17);
INSERT INTO RejestracjaWDruzynie VALUES(10,'2008-2-10', 7,15);
INSERT INTO RejestracjaWDruzynie VALUES(11,'2008-6-9', 35,8);
INSERT INTO RejestracjaWDruzynie VALUES(12,'2009-5-19', 17,7);
INSERT INTO RejestracjaWDruzynie VALUES(13,'2009-11-26', 39,7);
INSERT INTO RejestracjaWDruzynie VALUES(14,'2009-7-27', 37,15);
INSERT INTO RejestracjaWDruzynie VALUES(15,'2008-9-25', 7,15);
INSERT INTO RejestracjaWDruzynie VALUES(16,'2008-11-4', 44,16);
INSERT INTO RejestracjaWDruzynie VALUES(17,'2009-5-21', 44,1);
INSERT INTO RejestracjaWDruzynie VALUES(18,'2008-9-7', 69,7);
INSERT INTO RejestracjaWDruzynie VALUES(19,'2008-9-3', 7,7);
INSERT INTO RejestracjaWDruzynie VALUES(20,'2008-7-15', 35,5);
INSERT INTO RejestracjaWDruzynie VALUES(21,'2008-9-24', 53,12);
INSERT INTO RejestracjaWDruzynie VALUES(22,'2009-5-4', 64,9);
INSERT INTO RejestracjaWDruzynie VALUES(23,'2009-2-19', 10,13);
INSERT INTO RejestracjaWDruzynie VALUES(24,'2008-1-13', 54,9);
INSERT INTO RejestracjaWDruzynie VALUES(25,'2008-2-26', 65,10);
INSERT INTO RejestracjaWDruzynie VALUES(26,'2009-11-14', 57,16);
INSERT INTO RejestracjaWDruzynie VALUES(27,'2009-11-13', 43,9);
INSERT INTO RejestracjaWDruzynie VALUES(28,'2009-10-17', 47,5);
INSERT INTO RejestracjaWDruzynie VALUES(29,'2008-4-4', 50,14);
INSERT INTO RejestracjaWDruzynie VALUES(30,'2008-10-7', 39,19);
INSERT INTO RejestracjaWDruzynie VALUES(31,'2009-8-18', 59,11);
INSERT INTO RejestracjaWDruzynie VALUES(32,'2009-8-1', 27,6);
INSERT INTO RejestracjaWDruzynie VALUES(33,'2009-2-27', 54,5);
INSERT INTO RejestracjaWDruzynie VALUES(34,'2008-11-13', 50,1);
INSERT INTO RejestracjaWDruzynie VALUES(35,'2008-8-17', 51,7);
INSERT INTO RejestracjaWDruzynie VALUES(36,'2008-5-15', 60,18);
INSERT INTO RejestracjaWDruzynie VALUES(37,'2009-10-12', 47,4);
INSERT INTO RejestracjaWDruzynie VALUES(38,'2008-6-3', 3,15);
INSERT INTO RejestracjaWDruzynie VALUES(39,'2009-4-14', 54,15);
INSERT INTO RejestracjaWDruzynie VALUES(40,'2009-1-17', 8,6);
INSERT INTO RejestracjaWDruzynie VALUES(41,'2008-11-1', 58,18);
INSERT INTO RejestracjaWDruzynie VALUES(42,'2009-5-1', 11,17);
INSERT INTO RejestracjaWDruzynie VALUES(43,'2008-9-5', 60,4);
INSERT INTO RejestracjaWDruzynie VALUES(44,'2008-9-17', 26,17);
INSERT INTO RejestracjaWDruzynie VALUES(45,'2008-5-23', 58,14);
INSERT INTO RejestracjaWDruzynie VALUES(46,'2009-1-8', 36,3);
INSERT INTO RejestracjaWDruzynie VALUES(47,'2009-1-23', 33,17);
INSERT INTO RejestracjaWDruzynie VALUES(48,'2009-4-25', 32,7);
INSERT INTO RejestracjaWDruzynie VALUES(49,'2009-7-3', 7,18);
INSERT INTO RejestracjaWDruzynie VALUES(50,'2008-6-9', 60,14);
INSERT INTO RejestracjaWDruzynie VALUES(51,'2008-6-9', 13,7);
INSERT INTO RejestracjaWDruzynie VALUES(52,'2008-11-25', 22,12);
INSERT INTO RejestracjaWDruzynie VALUES(53,'2009-3-14', 54,8);
INSERT INTO RejestracjaWDruzynie VALUES(54,'2008-11-26', 15,4);
INSERT INTO RejestracjaWDruzynie VALUES(55,'2009-3-20', 68,1);
INSERT INTO RejestracjaWDruzynie VALUES(56,'2009-9-3', 63,13);
INSERT INTO RejestracjaWDruzynie VALUES(57,'2009-9-23', 33,17);
INSERT INTO RejestracjaWDruzynie VALUES(58,'2008-11-19', 44,3);
INSERT INTO RejestracjaWDruzynie VALUES(59,'2008-6-3', 14,16);
INSERT INTO RejestracjaWDruzynie VALUES(60,'2008-9-21', 46,18);
INSERT INTO RejestracjaWDruzynie VALUES(61,'2009-11-6', 19,13);
INSERT INTO RejestracjaWDruzynie VALUES(62,'2009-11-1', 65,11);
INSERT INTO RejestracjaWDruzynie VALUES(63,'2009-7-21', 16,2);
INSERT INTO RejestracjaWDruzynie VALUES(64,'2008-4-24', 56,18);
INSERT INTO RejestracjaWDruzynie VALUES(65,'2009-7-2', 37,9);
INSERT INTO RejestracjaWDruzynie VALUES(66,'2009-11-9', 20,5);
INSERT INTO RejestracjaWDruzynie VALUES(67,'2009-1-3', 55,1);
INSERT INTO RejestracjaWDruzynie VALUES(68,'2008-3-9', 8,17);
INSERT INTO RejestracjaWDruzynie VALUES(69,'2009-4-2', 35,18);
INSERT INTO RejestracjaWDruzynie VALUES(70,'2008-8-10', 63,4);

select *
from RejestracjaWDruzynie;

--
-- --wypelnione
INSERT INTO Turniej VALUES(1, '2010-11-2', '2010-11-27', 59, 20, 'DeathOfRace');
INSERT INTO Turniej VALUES(2, '2016-8-9', '2016-8-29', 104, 7, 'DeathOfNight');
INSERT INTO Turniej VALUES(3, '2019-10-13', '2019-10-23', 97, 10, 'WinOfShadows');
INSERT INTO Turniej VALUES(4, '2011-2-2', '2011-2-24', 18, 4, 'BigDaady');
INSERT INTO Turniej VALUES(5, '2016-3-16', '2016-3-26', 53, 18, 'BornOfEarth');
INSERT INTO Turniej VALUES(6, '2014-10-24', '2014-10-29', 47, 7, 'Secreat');
INSERT INTO Turniej VALUES(7, '2013-10-22', '2013-10-30', 77, 14, 'Saint');
INSERT INTO Turniej VALUES(8, '2021-2-6', '2021-2-26', 24, 20, 'Miserable');
INSERT INTO Turniej VALUES(9, '2019-6-14', '2019-6-24', 81, 15, 'OldSchool');
INSERT INTO Turniej VALUES(10, '2012-3-6', '2012-3-26', 29, 5, 'Holidays');
INSERT INTO Turniej VALUES(11, '2020-1-20', '2020-1-29', 60, 4, 'Triumph');
INSERT INTO Turniej VALUES(12, '2016-6-2', '2016-6-22', 69, 3, 'FastCars');
INSERT INTO Turniej VALUES(13, '2022-7-17', '2022-7-27', 49, 14, 'BadGirls');
INSERT INTO Turniej VALUES(14, '2018-10-17', '2018-10-27', 82, 8, 'JD');
INSERT INTO Turniej VALUES(15, '2019-7-23', '2019-7-29', 32, 9, 'MakeTheDay');
INSERT INTO Turniej VALUES(16, '2022-4-16', '2022-4-26', 66, 4, 'TasteOfWin');
INSERT INTO Turniej VALUES(17, '2010-7-2', '2010-7-21', 53, 18, 'DayON');
INSERT INTO Turniej VALUES(18, '2013-9-10', '2013-9-19', 21, 4, 'MOVEment');
INSERT INTO Turniej VALUES(19, '2014-6-13', '2014-6-23', 13, 13, 'RockTheFloor');
INSERT INTO Turniej VALUES(20, '2017-1-23', '2017-1-28', 60, 5, 'KeepIT');
INSERT INTO Turniej VALUES(21, '2019-4-12', '2019-4-18', 52, 20, 'Golders');


select *
from Turniej;

-- --wypelnione
INSERT INTO RejestracjaWTurnieju VALUES(1, 1);
INSERT INTO RejestracjaWTurnieju VALUES(2, 4);
INSERT INTO RejestracjaWTurnieju VALUES(3, 19);
INSERT INTO RejestracjaWTurnieju VALUES(4, 7);
INSERT INTO RejestracjaWTurnieju VALUES(5, 10);
INSERT INTO RejestracjaWTurnieju VALUES(6, 15);
INSERT INTO RejestracjaWTurnieju VALUES(7, 21);
INSERT INTO RejestracjaWTurnieju VALUES(8, 10);
INSERT INTO RejestracjaWTurnieju VALUES(9, 6);
INSERT INTO RejestracjaWTurnieju VALUES(10, 12);
INSERT INTO RejestracjaWTurnieju VALUES(11, 18);
INSERT INTO RejestracjaWTurnieju VALUES(12, 3);
INSERT INTO RejestracjaWTurnieju VALUES(13, 9);
INSERT INTO RejestracjaWTurnieju VALUES(14, 3);
INSERT INTO RejestracjaWTurnieju VALUES(15, 6);
INSERT INTO RejestracjaWTurnieju VALUES(16, 3);
INSERT INTO RejestracjaWTurnieju VALUES(17, 17);
INSERT INTO RejestracjaWTurnieju VALUES(18, 20);
INSERT INTO RejestracjaWTurnieju VALUES(19, 19);
INSERT INTO RejestracjaWTurnieju VALUES(20, 13);
INSERT INTO RejestracjaWTurnieju VALUES(21, 7);
INSERT INTO RejestracjaWTurnieju VALUES(22, 18);
INSERT INTO RejestracjaWTurnieju VALUES(23, 5);
INSERT INTO RejestracjaWTurnieju VALUES(24, 18);
INSERT INTO RejestracjaWTurnieju VALUES(25, 2);
INSERT INTO RejestracjaWTurnieju VALUES(26, 10);
INSERT INTO RejestracjaWTurnieju VALUES(27, 14);
INSERT INTO RejestracjaWTurnieju VALUES(28, 7);
INSERT INTO RejestracjaWTurnieju VALUES(29, 14);
INSERT INTO RejestracjaWTurnieju VALUES(30, 4);
INSERT INTO RejestracjaWTurnieju VALUES(31, 1);
INSERT INTO RejestracjaWTurnieju VALUES(32, 8);
INSERT INTO RejestracjaWTurnieju VALUES(33, 7);
INSERT INTO RejestracjaWTurnieju VALUES(34, 11);
INSERT INTO RejestracjaWTurnieju VALUES(35, 14);
INSERT INTO RejestracjaWTurnieju VALUES(36, 10);
INSERT INTO RejestracjaWTurnieju VALUES(37, 12);
INSERT INTO RejestracjaWTurnieju VALUES(38, 6);
INSERT INTO RejestracjaWTurnieju VALUES(39, 7);
INSERT INTO RejestracjaWTurnieju VALUES(40, 1);
INSERT INTO RejestracjaWTurnieju VALUES(41, 1);
INSERT INTO RejestracjaWTurnieju VALUES(42, 13);
INSERT INTO RejestracjaWTurnieju VALUES(43, 15);
INSERT INTO RejestracjaWTurnieju VALUES(44, 2);
INSERT INTO RejestracjaWTurnieju VALUES(45, 15);
INSERT INTO RejestracjaWTurnieju VALUES(46, 1);
INSERT INTO RejestracjaWTurnieju VALUES(47, 14);
INSERT INTO RejestracjaWTurnieju VALUES(48, 7);
INSERT INTO RejestracjaWTurnieju VALUES(49, 6);
INSERT INTO RejestracjaWTurnieju VALUES(50, 10);
INSERT INTO RejestracjaWTurnieju VALUES(51, 14);
INSERT INTO RejestracjaWTurnieju VALUES(52, 13);
INSERT INTO RejestracjaWTurnieju VALUES(53, 14);
INSERT INTO RejestracjaWTurnieju VALUES(54, 10);
INSERT INTO RejestracjaWTurnieju VALUES(55, 10);
INSERT INTO RejestracjaWTurnieju VALUES(56, 2);
INSERT INTO RejestracjaWTurnieju VALUES(57, 5);
INSERT INTO RejestracjaWTurnieju VALUES(58, 15);
INSERT INTO RejestracjaWTurnieju VALUES(59, 17);
INSERT INTO RejestracjaWTurnieju VALUES(60, 6);
INSERT INTO RejestracjaWTurnieju VALUES(61, 9);
INSERT INTO RejestracjaWTurnieju VALUES(62, 14);
INSERT INTO RejestracjaWTurnieju VALUES(63, 9);
INSERT INTO RejestracjaWTurnieju VALUES(64, 16);
INSERT INTO RejestracjaWTurnieju VALUES(65, 3);
INSERT INTO RejestracjaWTurnieju VALUES(66, 12);
INSERT INTO RejestracjaWTurnieju VALUES(67, 7);
INSERT INTO RejestracjaWTurnieju VALUES(68, 20);
INSERT INTO RejestracjaWTurnieju VALUES(69, 2);

select *
from RejestracjaWTurnieju;

