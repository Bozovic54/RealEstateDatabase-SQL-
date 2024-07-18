
/** View that returns the average apartment prices in each city. **/
CREATE VIEW Nekretnina_Cene
AS
	SELECT Grad.GradNaziv AS Grad,AVG(NekretninaCena) AS ProsecnaCena
	FROM Nekretnina
	INNER JOIN VrstaNekretnine ON Nekretnina.VrstaNekretnineID = VrstaNekretnine.VrstaNekretnineID
	INNER JOIN Grad ON Nekretnina.GradID = Grad.GradID
	INNER JOIN Usluga ON Nekretnina.UslugaID = Usluga.UslugaID
	WHERE VrstaNekretnineNaziv = 'Stan' and UslugaNaziv = 'Izdavanje'
	GROUP BY GradNaziv;
GO
/** SELECT * FROM Nekretnina_Cene **/

/* Procedure that inserts an error into the Error table */
CREATE PROCEDURE Unos_Greske(
	@Opis nvarchar(240),
	@DatumVreme datetime
)
AS
BEGIN 
	INSERT INTO Error VALUES (@Opis,@DatumVreme);
END;
GO

/* Procedure that adds a new advertiser */
CREATE PROCEDURE Oglasivac_INSERT
(
	@OglasivacIme nvarchar(20), 
	@OglasivacBrojTelefona int,
	@OglasivacEmail nvarchar(40),
	@OglasivacPassword nvarchar(40),
	@TipOglasivacaID int,
	@GradID int
)
AS 
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF NOT EXISTS(SELECT * FROM Oglasivac WHERE OglasivacIme = @OglasivacIme)
        BEGIN 
            INSERT INTO Oglasivac
            VALUES (@OglasivacIme, @OglasivacBrojTelefona, @OglasivacEmail, @OglasivacPassword, @TipOglasivacaID, @GradID);
            PRINT N'Uspesno ubacen novi oglasivac.'
        END
        ELSE 
        BEGIN
            PRINT N'Korisnik sa imenom ' + @OglasivacIme + N' vec postoji';
        END;
    END TRY
    BEGIN CATCH
        DECLARE 
			@opis nvarchar(240),
			@DatumVreme datetime
        SET @opis = ERROR_MESSAGE();
		SET @DatumVreme = GETDATE();

		EXECUTE Unos_Greske
			@Opis= @opis,
			@DatumVreme = @DatumVreme;
        PRINT N'Neuspesno, proverite tabelu "ERROR". ';
    END CATCH;
END;
GO
/*
EXECUTE Oglasivac_INSERT
	@OglasivacIme= N'NoviOglasivac12',
	@OglasivacBrojTelefona = 061888888,
	@OglasivacEmail = N'noviemail@gmail.com',
	@OglasivacPassword = N'npsswd',
	@TipOglasivacaID = 2,
	@GradID = 2

SELECT * FROM Error
*/

/* Procedure that updates an existing advertiser */
CREATE PROCEDURE Oglasivac_UPDATE
(
	@OglasivacID int,
	@OglasivacIme nvarchar(20) = NULL, 
	@OglasivacBrojTelefona int = NULL,
	@OglasivacEmail nvarchar(40) = NULL,
	@OglasivacPassword nvarchar(40) = NULL,
	@TipOglasivacaID int = NULL,
	@GradID int = NULL
)
AS 
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF NOT EXISTS(SELECT * FROM Oglasivac WHERE OglasivacID = @OglasivacID)
        BEGIN 
            PRINT N'Ne postoji oglasivac sa tim ID.'
        END
        ELSE 
        BEGIN
            UPDATE Oglasivac 
			SET
				OglasivacIme = ISNULL(@OglasivacIme, OglasivacIme),
                OglasivacBrojTelefona = ISNULL(@OglasivacBrojTelefona, OglasivacBrojTelefona),
                OglasivacEmail = ISNULL(@OglasivacEmail, OglasivacEmail),
                OglasivacPassword = ISNULL(@OglasivacPassword, OglasivacPassword),
                TipOglasivacaID = ISNULL(@TipOglasivacaID, TipOglasivacaID),
                GradID = ISNULL(@GradID, GradID)
			WHERE OglasivacID = @OglasivacID;
			PRINT N'Uspesno ste azurirali oglasivaca sa imenom: ' + @OglasivacIme
        END;
    END TRY
    BEGIN CATCH
        DECLARE 
			@opis nvarchar(240),
			@DatumVreme datetime
        SET @opis = ERROR_MESSAGE();
		SET @DatumVreme = GETDATE();

		EXECUTE Unos_Greske  
			@Opis= @opis,
			@DatumVreme = @DatumVreme;
        PRINT N'Neuspesno, proverite tabelu "ERROR". ';
    END CATCH;
END;
GO
/*
EXEC Oglasivac_UPDATE
	@OglasivacID =  3,
	@OglasivacIme = 'Mateja',
	@GradID = 3

SELECT * FROM Oglasivac
*/

/* Procedure that deletes advertiser from table */
CREATE PROCEDURE Oglasivac_DELETE
(
	@OglasivacID int
)
AS 
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF NOT EXISTS(SELECT * FROM Oglasivac WHERE OglasivacID = @OglasivacID)
        BEGIN 
            PRINT N'Ne postoji oglasivac sa tim ID-em.'
        END
        ELSE 
        BEGIN
            DELETE Oglasivac 
			WHERE OglasivacID = @OglasivacID;
			PRINT N'Uspesno ste obrisali oglasivaca'
        END;
    END TRY
    BEGIN CATCH
        DECLARE 
			@opis nvarchar(240),
			@DatumVreme datetime
        SET @opis = ERROR_MESSAGE();
		SET @DatumVreme = GETDATE();

		EXECUTE Unos_Greske  
			@Opis= @opis,
			@DatumVreme = @DatumVreme;
        PRINT N'Neuspesno, proverite tabelu "ERROR". ';
    END CATCH;
END;
GO
/*
EXECUTE Oglasivac_DELETE
	@OglasivacID = 6
SELECT * FROM Oglasivac  
*/

/* Procedure that paginates results based on input parameters */
CREATE PROCEDURE StranicenjeRezultata
(
    @BrojStrane INT,
    @VelicinaStrane INT
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @BrojPreskocenihRedova INT, @PrviRed INT, @PoslednjiRed INT;

    SET @BrojPreskocenihRedova = (@BrojStrane - 1) * @VelicinaStrane;

    SET @PrviRed = @BrojPreskocenihRedova + 1;
	
    SET @PoslednjiRed = @BrojPreskocenihRedova + @VelicinaStrane;

    SELECT *
    FROM
    (
        SELECT 
            NekretninaTip,
            NekretninaCena,
            ROW_NUMBER() OVER (ORDER BY NekretninaCena) AS BrojRedova
        FROM Nekretnina
    ) AS Rezultat
    WHERE BrojRedova BETWEEN @PrviRed AND @PoslednjiRed;
END;
/*EXECUTE StranicenjeRezultata @BrojStrane = 5, @VelicinaStrane = 5;*/

/* Scalar function that returns Name and Email of advertiser whose ID is passed as input parameter */
CREATE FUNCTION InformacijeOOglasivacu
(
    @OglasivacID INT
)
RETURNS NVARCHAR(60) 
AS
BEGIN
    DECLARE @Informacija NVARCHAR(60);

		IF NOT EXISTS (SELECT * FROM Oglasivac WHERE OglasivacID = @OglasivacID)
			SET @Informacija = N'Oglasivac sa ID-em ' + CAST(@OglasivacID AS NVARCHAR(50)) + N' ne postoji.';
	
		SELECT @Informacija = N'Ime: ' + OglasivacIme + ', Email: ' + OglasivacEmail
		FROM Oglasivac
		WHERE OglasivacID = @OglasivacID;
	

    RETURN @Informacija;
END;
/*
	DECLARE @OglasivacID INT = 1;  
	DECLARE @Informacija NVARCHAR(60);
	SET @Informacija = dbo.InformacijeOOglasivacu(@OglasivacID);
	SELECT @Informacija AS 'Informacije';
*/

/* Function that returns a specific number of ads of selected advertiser, based on input parameters */
CREATE FUNCTION NekretnineOglasivaca
(@OglasivacID int, @BrojOglasa int)
RETURNS TABLE
AS
	RETURN (SELECT TOP(@BrojOglasa)
				VrstaNekretnineNaziv,
				NekretninaDatumOglasavanja,
				NekretninaCena
			FROM Nekretnina 
			INNER JOIN VrstaNekretnine ON Nekretnina.VrstaNekretnineID = VrstaNekretnine.VrstaNekretnineID
			WHERE Nekretnina.OglasivacID = @OglasivacID
			ORDER BY NekretninaDatumOglasavanja);

GO
/*SELECT * FROM NekretnineOglasivaca(3,3);*/

/* After_UPDATE trigger that updates property advertising date whenever a change is made to property ad */
CREATE OR ALTER TRIGGER trg_AfterUpdateNekretnina
ON Nekretnina
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
	IF UPDATE (OglasivacID)
	BEGIN
		RAISERROR ('Nije dozvoljena promena oglasivaca nekretnine!', 10, 1);
		ROLLBACK TRANSACTION;
	END

    UPDATE N
    SET NekretninaDatumOglasavanja = GETDATE()
    FROM Nekretnina AS N
    INNER JOIN inserted AS I ON N.NekretninaID = I.NekretninaID;
END;
/*
UPDATE Nekretnina SET OglasivacID = 5 WHERE NekretninaID = 3;
SELECT * FROM Nekretnina
*/

/* INSTEAD OF trigger that prevents deleting multiple advertisers at once */
CREATE TRIGGER trg_Oglasivac_DELETE
ON Oglasivac
AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @brojObrisanih int;
	SELECT @brojObrisanih = COUNT(*) FROM deleted;
	IF @brojObrisanih > 1
		BEGIN
			RAISERROR ('Nije moguce brisanje vise oglasivaca', 10, 1);
			IF @@TRANCOUNT > 0
				ROLLBACK TRAN;
		END;
	ELSE
		BEGIN
			DECLARE @OglasivacID int
			SELECT @OglasivacID = deleted.OglasivacID FROM deleted;
			DELETE Oglasivac WHERE OglasivacID = @OglasivacID;
		END;
END
GO
/*
DELETE Oglasivac WHERE OglasivacID = 8 and OglasivacID = 7;
SELECT * FROM Oglasivac
*/


/*DDL trigger that prevents creating, altering, and dropping tables */
CREATE TRIGGER trg_SprecavanjeAkcijaNadTabelama
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    DECLARE @PodaciEventa XML;
    SET @PodaciEventa = EVENTDATA();

    DECLARE @TipDogadjaja NVARCHAR(120);
    DECLARE @ImeDogadjaja NVARCHAR(120);

    SET @TipDogadjaja = @PodaciEventa.value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(120)');
    SET @ImeDogadjaja = @PodaciEventa.value('(/EVENT_INSTANCE/ObjectName)[1]', 'nvarchar(120)');

    PRINT 'DDL Trigger je aktiviran:';
    PRINT 'Tip dogadjaja: ' + @TipDogadjaja;
    PRINT 'Ime dogadjaja: ' + @ImeDogadjaja;

END;
GO
/*
DROP table Error
*/
/* The procedure represents a transaction that adds a new advertiser, and then a property. */
CREATE PROCEDURE DodajDobavljacaINekretninu
	@OglasivacIme nvarchar(20) ,
	@OglasivacBrojTelefona int ,
	@OglasivacEmail nvarchar(40),
	@OglasivacPassword nvarchar(40),
	@TipOglasivaca nvarchar(30),
	@Grad nvarchar(30),
	@NekretninaTip nvarchar(50) ,
	@NekretninaPovrsina nvarchar(10) ,
	@NekretninaCena int ,
	@NekretninaTipGradnje nvarchar(30) ,
	@NekretninaDatumOglasavanja date ,
	@NekretninaOpis nvarchar(200) ,
	@VrstaNekretnine nvarchar(30) ,
	@Usluga nvarchar(30) ,
	@NGrad nvarchar(30) ,
	@Opremljenost nvarchar(30) ,
	@Sprat nvarchar(30) ,
	@Parking nvarchar(30),
	@ParkingBrojMesta int
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		DECLARE @OglasivacID int;
		INSERT INTO Oglasivac(OglasivacIme,OglasivacBrojTelefona,OglasivacEmail, OglasivacPassword,TipOglasivacaID,GradID)
		VALUES (@OglasivacIme,@OglasivacBrojTelefona,@OglasivacEmail,@OglasivacPassword,
				(SELECT TipOglasivacaID FROM TipOglasivaca WHERE TipOglasivacaNaziv = @TipOglasivaca),
				(SELECT GradID FROM Grad WHERE GradNaziv = @Grad));
		SET @OglasivacID = SCOPE_IDENTITY();

		DECLARE @NekretninaID int
		INSERT INTO	Nekretnina (NekretninaTip,NekretninaPovrsina,NekretninaCena,NekretninaTipGradnje,NekretninaDatumOglasavanja,NekretninaOpis,VrstaNekretnineID,
								UslugaID,GradID,OpremljenostID,SpratID,OglasivacID,ParkingID) 
		VALUES(@NekretninaTip,@NekretninaPovrsina,@NekretninaCena,@NekretninaTipGradnje,@NekretninaDatumOglasavanja,@NekretninaOpis,
			  (SELECT VrstaNekretnineID FROM VrstaNekretnine WHERE VrstaNekretnineNaziv = @VrstaNekretnine),
			  (SELECT UslugaID FROM Usluga WHERE UslugaNaziv = @Usluga),
			  (SELECT GradID FROM Grad WHERE GradNaziv = @NGrad),
			  (SELECT OpremljenostID FROM Opremljenost WHERE OpremljenostNaziv = @Opremljenost),
			  (SELECT SpratID FROM Sprat WHERE SpratNaziv = @Sprat),
			  @OglasivacID,
			  (SELECT ParkingID FROM Parking WHERE ParkingTip = @Parking and ParkingBrojMesta = @ParkingBrojMesta));
		COMMIT;
    END TRY
    BEGIN CATCH
		PRINT 'Transakcija nije uspela!';
        ROLLBACK;
        THROW;
    END CATCH;
END;
GO
/*
EXECUTE DodajDobavljacaINekretninu
	@OglasivacIme= N'NoviDobavljac',
	@OglasivacBrojTelefona = 06312313 ,
	@OglasivacEmail = N'noviemail@gmail.com',
	@OglasivacPassword = N'passswd',
	@TipOglasivaca = N'Fizicko lice',
	@Grad = N'Beograd',
	@NekretninaTip = N'Garsonjera',
	@NekretninaPovrsina = N'54m2',
	@NekretninaCena = 400000 ,
	@NekretninaTipGradnje = N'Novogradnja' ,
	@NekretninaDatumOglasavanja = '2022-01-01',
	@NekretninaOpis = N'Neki opis' ,
	@VrstaNekretnine = N'Stan',
	@Usluga  = N'Prodaja',
	@NGrad = N'Beograd',
	@Opremljenost = N'Namesteno' ,
	@Sprat = N'Prizemlje' ,
	@Parking = N'Garaza',
	@ParkingBrojMesta = 3
*/
/* Upit koji rezultat vraca kao xml */
SELECT 
    NekretninaTip,
    NekretninaPovrsina,
    NekretninaCena,
    NekretninaDatumOglasavanja,
    NekretninaOpis
FROM 
    Nekretnina
FOR XML PATH ('NEKRETNINA'), ROOT('Podaci')
GO

/* Parsiranje i transformiranje XML podataka pomocu OPENXML funkcije */
SELECT 
    NekretninaTip,
    NekretninaPovrsina,
    NekretninaCena,
    NekretninaDatumOglasavanja,
    NekretninaOpis
FROM 
    Nekretnina

DECLARE @xmlPodaci XML
SET @xmlPodaci = 
    (SELECT 
		NekretninaTip,
		NekretninaPovrsina,
		NekretninaCena,
		NekretninaDatumOglasavanja,
		NekretninaOpis
    FROM 
        Nekretnina
    FOR XML AUTO, ROOT('Podaci'))

DECLARE @idoc INT
EXEC sp_xml_preparedocument @idoc OUTPUT, @xmlPodaci

SELECT 
   *
FROM 
    OPENXML(@idoc, '/Podaci/Nekretnina', 2)
WITH (
    NekretninaID INT,
    NekretninaTip NVARCHAR(30),
    NekretninaPovrsina NVARCHAR(40),
	NekretninaCena INT,
    NekretninaDatumOglasavanja DATE,
    NekretninaOpis NVARCHAR(40)
)

EXEC sp_xml_removedocument @idoc
GO

/* Upit koji rezultate vraca kao json */
SELECT
    NekretninaID,
    NekretninaTip,
    NekretninaPovrsina,
    NekretninaCena,
    NekretninaDatumOglasavanja,
    NekretninaOpis
FROM
    Nekretnina
FOR JSON AUTO;
GO

/* Parsiranje i transformiranje JSON podataka pomocu OPENJSON funkcije */
SELECT 
    j.NekretninaID,
    j.NekretninaTip,
    j.NekretninaPovrsina,
    j.NekretninaCena,
    j.NekretninaDatumOglasavanja,
    j.NekretninaOpis
FROM Nekretnina
CROSS APPLY OPENJSON((SELECT Nekretnina.* FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)) 
WITH (
    NekretninaID INT '$.NekretninaID',
    NekretninaTip NVARCHAR(30) '$.NekretninaTip',
    NekretninaPovrsina NVARCHAR(10) '$.NekretninaPovrsina',
    NekretninaCena INT '$.NekretninaCena',
    NekretninaDatumOglasavanja DATE '$.NekretninaDatumOglasavanja',
    NekretninaOpis NVARCHAR(115) '$.NekretninaOpis'
) AS j;
GO