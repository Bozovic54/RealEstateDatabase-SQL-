USE master;
GO
DROP DATABASE IF EXISTS CetiriZida;
GO
CREATE DATABASE CetiriZida;
GO
USE CetiriZida;
GO
CREATE TABLE VrstaNekretnine
(
	VrstaNekretnineID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	VrstaNekretnineNaziv nvarchar(40) NOT NULL
);
CREATE TABLE Grad
(
	GradID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	GradNaziv nvarchar(30) NOT NULL,
	GradPozivniBroj int NOT NULL
);
CREATE TABLE Sprat
(
	SpratID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	SpratNaziv nvarchar(30) NOT NULL,
);
CREATE TABLE Opremljenost
(
	OpremljenostID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	OpremljenostNaziv nvarchar(30) NOT NULL,
);
CREATE TABLE Grejanje
(
	GrejanjeID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	GrejanjeNaziv nvarchar(30) NOT NULL
);
CREATE TABLE Pogodnosti
(
	PogodnostiID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	PogodnostiNaziv nvarchar(30) NOT NULL,
);
CREATE TABLE Parking
(
	ParkingID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ParkingTip nvarchar(30) NOT NULL,
	ParkingBrojMesta int NOT NULL
);
CREATE TABLE Usluga
(
	UslugaID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	UslugaNaziv nvarchar(20) NOT NULL
);
CREATE TABLE TipOglasivaca
(
	TipOglasivacaID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	TipOglasivacaNaziv nvarchar(40) NOT NULL
);

CREATE TABLE Oglasivac
(
	OglasivacID int NOT NULL IDENTITY(1,1),
	OglasivacIme nvarchar(20) NOT NULL,
	OglasivacBrojTelefona int NOT NULL,
	OglasivacEmail nvarchar(40) NOT NULL,
	OglasivacPassword nvarchar(40) NOT NULL,
	TipOglasivacaID int NOT NULL,
	GradID int NOT NULL,
	CONSTRAINT PK_Oglasivac PRIMARY KEY (OglasivacID),
	CONSTRAINT FK_TipOglasivaca FOREIGN KEY(TipOglasivacaID) REFERENCES TipOglasivaca(TipOglasivacaID),
	CONSTRAINT FK_Grad FOREIGN KEY(GradID) REFERENCES Grad(GradID)
);
CREATE TABLE Nekretnina
(
	NekretninaID int NOT NULL IDENTITY(1,1),
	NekretninaTip nvarchar(50) NOT NULL,
	NekretninaPovrsina nvarchar(10) NOT NULL,
	NekretninaCena int NULL,
	NekretninaTipGradnje nvarchar(30) NULL,
	NekretninaDatumOglasavanja date NULL,
	NekretninaOpis nvarchar(200) NULL,
	VrstaNekretnineID int NOT NULL,
	UslugaID int NOT NULL,
	GradID int NOT NULL,
	OpremljenostID int NOT NULL,
	SpratID int NOT NULL,
	OglasivacID int NOT NULL,
	ParkingID int NOT NULL,

	CONSTRAINT PK_Nekretnina PRIMARY KEY(NekretninaID),
	CONSTRAINT FK_VrstaNekretnine FOREIGN KEY(VrstaNekretnineID) REFERENCES VrstaNekretnine(VrstaNekretnineID),
	CONSTRAINT FK_Usluga FOREIGN KEY(UslugaID) REFERENCES Usluga(UslugaID),
	CONSTRAINT FK_Grad2 FOREIGN KEY(GradID) REFERENCES Grad(GradID),
	CONSTRAINT FK_Opremljenost FOREIGN KEY(OpremljenostID) REFERENCES Opremljenost(OpremljenostID),
	CONSTRAINT FK_Parking FOREIGN KEY(ParkingID) REFERENCES Parking(ParkingID),
	CONSTRAINT FK_Oglasivac FOREIGN KEY(OglasivacID) REFERENCES Oglasivac(OglasivacID),
	CONSTRAINT FK_Sprat FOREIGN KEY(SpratID) REFERENCES Sprat(SpratID)
);
CREATE TABLE GrejanjeNekretnina
(
	NekretninaID int NOT NULL,
	GrejanjeID int NOT NULL,
	CONSTRAINT PK_GrejanjeNekretnina PRIMARY KEY(NekretninaID,GrejanjeID),
	CONSTRAINT FK_Nekretnina FOREIGN KEY(NekretninaID) REFERENCES Nekretnina(NekretninaID),
	CONSTRAINT FK_Grejanje FOREIGN KEY(GrejanjeID) REFERENCES Grejanje(GrejanjeID)
);
CREATE TABLE PogodnostiNekretnina
(
	NekretninaID int NOT NULL,
	PogodnostiID int NOT NULL,
	CONSTRAINT PK_PogodnostiNekretnina PRIMARY KEY(NekretninaID,PogodnostiID),
	CONSTRAINT FK_Nekretnina2 FOREIGN KEY(NekretninaID) REFERENCES Nekretnina(NekretninaID),
	CONSTRAINT FK_Pogodnosti FOREIGN KEY(PogodnostiID) REFERENCES Pogodnosti(PogodnostiID)
);