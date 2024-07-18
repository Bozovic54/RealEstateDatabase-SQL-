
USE CetiriZida;
GO
select * from Nekretnina;

INSERT INTO Grad VALUES
('Beograd',011),('Novi Sad',021),('Nis',018),('Kragujevac',032),('Subotica',024),('Zrenjanin',023),('Pancevo',013);

INSERT INTO Sprat VALUES
('Prizemlje'),('I sprat'),('II sprat'),('II sprat'),('IV sprat'),('V sprat'),('VI sprat'),('VII sprat'),('VIII sprat'),('IX sprat'),
('X sprat'),('XI sprat'),('XII sprat'),('XII sprat'),('XIV sprat'),('XV sprat'),('XVI sprat'),('XVII sprat'),('XVIII sprat'),('XIX sprat'),
('XX sprat'),('XXI sprat'),('XXII sprat'),('XXIII sprat'),('XXIV sprat'),('XXV sprat');

INSERT INTO Opremljenost VALUES
('Namesteno'),('Prazno'),('Polunamesteno');

INSERT INTO Grejanje VALUES
('Centralno'),('Etazno'),('Struja'),('Gas'),('Kaljeva pec'),('TA pec'),('Norveski radijatori'),('Podno');

INSERT INTO Pogodnosti VALUES
('Ima tarasu'),('Ima podrum'),('Ima tavan'),('Oglas ima video ili 3D turu'),('Mogućnost video pokazivanja'),('Samo sa slikom');

INSERT INTO Parking VALUES
('Garaza',1),('Garaza',2),('Garaza',3),('Garaza',4),('Parking',1),('Parking',2),('Parking',3),('Parking',4);

INSERT INTO Usluga VALUES
('Izdavanje'),('Prodaja');

INSERT INTO TipOglasivaca VALUES
('Agencija'),('Firma'),('Investitor'),('Fizicko lice');

INSERT INTO VrstaNekretnine VALUES 
('Stan'),('Kuca'),('Poslovni prostor'),('Plac'),('Garaza/parking');

INSERT INTO Oglasivac VALUES 
('Alfa Plus nekretnine',0611774348,'alfaplus@gmail.com','alfaplus',1,1),('Best nekretnine',0617153720,'bestnekretnine@gmail.com','bestnekretnine',1,3),
('CBRE',0643882099,'cbre@gmail.com','cbre123',2,5),('Sunnyville',0617000388,'sunnyville@gmail.com','sunny123',2,4),
('Milos',0637201118,'miloss@gmail.com','miki1234',4,1),('Marko',061234318,'markicss@gmail.com','mare234',4,1);


INSERT INTO Nekretnina VALUES 
('Garsonjera','50m2',80000,'Novogradnja',NULL,'Odlična zgrada,mirno okruženje.Mogućnost kupovine parking mesta.Stanu pripada terasa od 6,5m2
PROSTORIJE: ulazni hodnik, dnevna soba, kuhinja, kupatilo, terasa.',1,1,2,1,4,4,3),
('Cetvorosoban','127m2',500000,'Novogradnja',NULL,'Odlična cena i kvalitet izgradnje + besplatan parking + mogućnost kupovine ostave uz stan
Bez dodatnih provizija, kupovina direktno od investitora, mogućnost dogovora',1,1,2,1,12,2,5),
('Dvosoban','57m2',500,'Starogradnja','2023-10-31',NULL,1,2,2,1,22,4,6),
('Trosoban','87m2',1500,'Starogradnja','2023-10-21','Dobra lokacija, mirna ulica, blizina prevoza, marketa, parka. 
Zgrada je iz 2000. godine u korektnom stanju lepo održavana. ',1,1,1,1,2,1,4),
('Dvosoban','57m2',500,'Starogradnja','2023-10-11',NULL,1,1,3,1,3,2,5),
('Jednosoban','17m2',25000,'Novogradnja','2023-10-22','Uknjižen jednosoban stan.',1,2,2,1,12,4,6),
('Garsonjera','19m2',500,'Starogradnja','2023-10-13','Stan je iz dva nivoa, donji nivo: ulazni hodnik, kuhinja, kupatilo, prostrana dnevna soba sa izlazom na terasu.
Gornji nivo: velika spavaća soba.',1,1,5,1,20,4,6),
('Dvosoban','47m2',900,'Novogradnja','2023-10-10','Raspored stana - hodnik sa trpezarijom, kupatilo, kuhinja i soba od 6m2.',1,1,1,1,2,3,6),
('Dvosoban','57m2',500,'Starogradnja','2023-10-31','Stan se nalazi na izuzetnoj lokaciji.
Za svaku preporuku.',1,2,2,1,22,4,6),
('Jednosoban','27m2',700,'Novogradnja','2023-10-21','Zgrada je predata na legalizaciju, sa kompletnom dokumentacijom, samo keš kupci, 
može overa kod notara.',1,1,5,1,20,2,5),
('Cetvorosoban','97m2',150000,'Starogradnja','2023-10-15','Četvorosoban stan(tri spavaće i dnevna soba) odličan raspored,dve terase.
Stan se nalaze u urbanom uređenom naselju u blizini Somborskog Bulevara.',1,2,6,1,12,4,6),
('Dvosoban','57m2',1500,'Starogradnja','2023-10-31','Dvosoban stan 45m2(T), na 4/4, TA grejanje, ktv, internet, interfon, klima.',1,1,2,1,12,2,3),
('Garsonjera','17m2',300,'Novogradnja','2023-10-30',NULL,1,1,4,1,16,1,3),
('Garsonjera','19m2',40000,'Starogradnja','2023-10-24','Super garsonjera na prvom spratu u lepo održavanoj zgradi na glavnoj ulici, Blizu prevoza i snabdevanja.',1,2,1,1,1,2,6),
('Dvosoban','57m2',500,'Starogradnja','2023-10-31','Stan je u izvornom stanju potrebna je adaptacija, idealan za kancelariju, poslovni prostor, izdavanje ili apartman.',1,2,2,1,22,4,6),

('1-etazna','127m2',150000,'Starogradnja','2023-10-20','Pogodno za investitore, dozvoljena gradnja 660m2.Uknjizena.',2,2,3,1,1,1,1),
('2-etazna','220m2',300000,'Novogradnja','2023-10-22','Prodaje se porodicna kuca u lepoj širokoj ulici, miran kraj u Kerskom naselju na povrsini od 600m2.',2,2,1,2,2,2,4),
('4-etazna','500m2',1500000,'Starogradnja','2023-10-25','Prodaje se kuća na sprat sa dva ulaza i pomoćnim prostorom ukupne površine od 360m2 naplacu površine od 20 ari.',2,2,3,2,4,4,2),
('3-etazna','204m2',2000,'Novogradnja','2023-10-26',NULL,2,1,5,2,3,3,3),
('2-etazna','167m2',340000,'Novogradnja','2023-10-22',' .U prizemlju se nalazi dnevni boravak sa trpezarijom i kuhinjom, a na spratu su dve spavaće sobe i kupatilo.Sprat nije finiširan.',2,2,1,3,2,1,1),
('1-etazna','100m2',250000,'Starogradnja','2023-10-25','Pomoćni prostor ima površinu od 50m2 i sastoji se od kotlarnice(dva kotla:na čvrsto gorivo i na struju),dve garaže i prostorije za odlaganje.',2,2,5,1,1,4,2),
('1-etazna','120m2',190000,'Starogradnja','2023-10-27','Kuća je ograđena zidanom ogradom a duž ograde su zasađeni četinari.U dnu dvorišta je uredno održavan i orezan voćnjak (šljive,trešnje kruške,jabuke……..)',2,2,3,1,1,2,4),
('4-etazna','540m2',400000,'Novogradnja','2023-10-22',NULL,2,2,1,2,4,1,3),
('2-etazna','220m2',220000,'Starogradnja','2023-10-28','Kuća je lepa i prostrana, urađena je PVC stolarija, grejanje je centralno na pelet.',2,2,1,3,2,4,1),
('1-etazna','100m2',150000,'Starogradnja','2023-10-21','Za sve dodatne informacije pozovite nas na telefon: 063/562-888 ; 066/365-745; 066/365-743',2,2,2,1,1,1,1),
('3-etazna','380m2',380000,'Starogradnja','2023-10-25',NULL,2,2,5,1,3,1,2),
('3-etazna','420m2',200000,'Novogradnja','2023-10-22','Na prodaju lepa i komforna porodična kuća sa bazenom u odličnom stanju. Ne zahteva dodatna ulaganja osim ličnih želja kupca.',2,2,3,2,4,2,3),
('1-etazna','120m2',200000,'Starogradnja','2023-11-25','idealna je za porodični život. Pametno i potpuno iskorišćen prostor uređen u mininalističkom stilu.',2,2,6,3,1,3,3),
('2-etazna','236m2',190000,'Starogradnja','2023-11-24','Kuća je odmah useljiva. Po podu se nalazi keramika, ispod koje je postavljeno podno grejanje duž cele površine, na oba sprata. ',2,2,1,1,2,3,2),
('4-etazna','520m2',1000000,'Novogradnja','2023-11-22','Sagrađena je na placu površine 6.21 a, na kojoj je postavljen i temelj za budući pomoćni objekat ili garažu. Locirana u izuzetno mirnom delu naselja.',2,2,2,1,4,1,4),

('Kancelarija','50m2',80000,'Starogradnja','2023-11-22',NULL,3,2,4,1,2,4,5),
('Lokal','70m2',800,'Starogradnja','2023-11-12','Na prodaju kvalitetan poslovni prostor kod Tehničkih fakulteta, pogodan za razne poslovne namene ',3,1,1,2,1,1,5),
('Ordinacija','100m2',1000,'Starogradnja','2023-11-30','Prostor u prizemlju je površine 70 m2, koji čine uslužni prostor, nekoliko kancelarija otvorenog tipa, kuhinja i toalet.',3,1,2,1,1,3,5),
('Ordinacija','40m2',80000,'v','2023-11-21',NULL,3,2,1,1,3,2,6),
('Lokal','50m2',120000,'Novogradnja','2023-11-25','Prodaje se poslovni prostor površine 58m2, u suturenu nove stambene zgrade do same ulice.',3,2,2,1,4,3,5),
('Kancelarija','60m2',280000,'Novogradnja','2023-11-23','Odličan poslovni prostor- kafeterija u radu Lokal se se nalazi na odličnoj lokaciji sa puno parkinga u okolini.',3,2,1,3,2,3,6),
('Lokal','20m2',180000,'Novogradnja','2023-11-29','Vredi pogledati, nazovite našu agenciju za više informacija',3,2,1,1,2,1,6),
('Ordinacija','40m2',800,'Starogradnja','2023-11-20','Odlicna ponuda. Lokal sa izlogom na visokom prizemlju u YBC.Mokri cvor, okrecen lokal odmah useljiv.',3,1,4,1,1,1,7),
('Kancelarija','70m2',30000,'Starogradnja','2023-11-22','Prodaje se sa kompletnim inventarom sa slika. Postavljena je keramika i alu stolarija. Grejanje je na klima uređaje.',3,2,3,2,1,3,5),
('Ordinacija','20m2',250000,'Novogradnja','2023-11-21',NULL,3,2,2,2,1,2,5),
('Ordinacija','30m2',800,'Starogradnja','2023-11-23',NULL,3,1,1,1,1,4,5),
('Lokal','30m2',600,'Starogradnja','2023-11-25','Odlična lokacija. Lokal se nalazi u neposrednoj blizini gradske pijace na veoma prometnom mestu.',3,1,2,1,1,3,6),

('Zemljiste','2900m2',300000,'Starogradnja','2023-11-15','Malo je danas ovakvih zelenih oaza na ovako zavidnoj površini kao što je ova a da su u blzini grada.',4,2,1,3,1,2,6),
('Zemljiste','900m2',30000,'Starogradnja','2023-11-23','Velika površina na ovoj lokaciji daje mogućnost da van grada napravite oazu gde ćete rado provoditi dane sa svojom porodicom, gde ćete imati inspiraciju za posao/',4,2,2,3,1,1,6),
('Zemljiste','5000m2',240000,'Starogradnja','2023-11-24','Plac se nalazi u Sremskoj Kamenici na potezu Paragovo.. Sa ovog mesta do Novog Sada vam treba nekih 10 tak minuta kolima.',4,2,2,3,1,2,6),
('Zemljiste','2000m2',160000,'Starogradnja','2023-11-12','Ono što ovaj plac čini jedinstvenim jeste upravo drveće i ostalo ukrasno rastinje na samom placu. Ovde se svaka biljka pažljivo birala i savršeno uklopila.',4,2,3,3,1,4,6),
('Zemljiste','10000m2',500000,'Starogradnja','2023-11-25',NULL,4,2,1,3,1,5,6),
('Zemljiste','4000m2',200000,'Starogradnja','2023-11-25','Plac je građevinsko zemljište, nalazi se u blizini hotela Šumarice, dozvoljena je gradnja. Uknjiženo. Vlasnik 1/1. ',4,2,2,3,1,2,6),
('Zemljiste','9000m2',100000,'Starogradnja','2023-11-24','Na placu ima i dosta raznog voća vrlo kvalitetnih sadnica- kruške, jabuke, trešnje, šljive, višnje, dunje a tu je i 10 tak stabala oraha.',4,2,1,3,1,1,6);

INSERT INTO GrejanjeNekretnina VALUES (223,1),(232,2),(234,3),(256,1),(231,2),(252,6),(265,7),(245,5),(265,3),(236,2),(254,4),(251,1),(247,8);
INSERT INTO PogodnostiNekretnina VALUES (233,1),(242,2),(230,3),(250,1),(235,2),(252,6),(245,3),(255,5),(261,3),(243,2),(254,4),(259,1),(247,2);

UPDATE Nekretnina SET NekretninaCena=160000 WHERE NekretninaID=247;

UPDATE Nekretnina SET NekretninaOpis='Za sve dodatne informacije pozovite nas na telefon: 063/562-888 ; 066/365-745; 066/365-740' WHERE NekretninaID=247;

UPDATE Oglasivac SET OglasivacBrojTelefona = 0611774341 WHERE OglasivacID=1;

DELETE Nekretnina WHERE NekretninaID=247;

DELETE GrejanjeNekretnina WHERE NekretninaID=247;

DELETE PogodnostiNekretnina WHERE NekretninaID=247;

DELETE Oglasivac WHERE OglasivacIme= 'CBRE';

SELECT * FROM Nekretnina;