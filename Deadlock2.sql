USE CetiriZida
GO

BEGIN TRAN

UPDATE Oglasivac SET OglasivacIme = 'NovoIme' WHERE OglasivacID = 1

WAITFOR DELAY '00:00:05'

UPDATE Nekretnina SET NekretninaTip = 'NovaNekretnina' WHERE NekretninaID = 1

COMMIT
----------------------------------------------------------------------------------
BEGIN TRAN

UPDATE Nekretnina SET NekretninaTip = 'NovaNekretnina' WHERE NekretninaID = 1

WAITFOR DELAY '00:00:05'

UPDATE Oglasivac SET OglasivacIme = 'NovoIme' WHERE OglasivacID = 1

COMMIT
