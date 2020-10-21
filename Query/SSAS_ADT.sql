--Exec sp_Compare2Tables
--	Encounter,
--	EncounterTemp,
--	1,
--	1
	
IF OBJECT_ID('ADT.dbo.Encounter', 'U') IS NOT NULL 
Drop Table ADT.dbo.Encounter; 
Select * Into ADT.dbo.Encounter 
From [shyft.hisz.iums.ac.ir].Adt.dbo.Encounter With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
                                 
Go 

IF OBJECT_ID('ADT.dbo.EncounterLocation', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.EncounterLocation; 
Select * Into ADT.dbo.EncounterLocation 
From [shyft.hisz.iums.ac.ir].Adt.dbo.EncounterLocation With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
                                 
Go                                  
 
/* 
IF OBJECT_ID('ADT.dbo.ServiceEvent', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.ServiceEvent; 
Select * --Into ServiceEvent 
From [shyft.hisz.iums.ac.ir].Adt.dbo.ServiceEvent With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
Go                                 

IF OBJECT_ID('ADT.dbo.FinancialTransaction', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.FinancialTransaction; 
Select * --Into FinancialTransaction 
From [shyft.hisz.iums.ac.ir].Adt.dbo.FinancialTransaction With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
                                 */
Go      
      
IF OBJECT_ID('ADT.dbo.Location', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Location; 
Select * Into ADT.dbo.Location From [shyft.hisz.iums.ac.ir].Adt.dbo.Location With(Nolock)    

Go      

IF OBJECT_ID('ADT.dbo.LocationLog', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.LocationLog; 
Select * Into ADT.dbo.LocationLog From [shyft.hisz.iums.ac.ir].Adt.dbo.LocationLog With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))        
Go                                 
                                 
IF OBJECT_ID('ADT.dbo.Arrival', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Arrival; 
Select * Into ADT.dbo.Arrival 
From [shyft.hisz.iums.ac.ir].Adt.dbo.Arrival With(Nolock)  
                                 
Go

IF OBJECT_ID('ADT.dbo.Departure', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Departure; 
Select * Into Departure From [shyft.hisz.iums.ac.ir].Adt.dbo.Departure With(Nolock)
 
Go

IF OBJECT_ID('ADT.dbo.SSASDate', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.SSASDate; 
Select * Into ADT.dbo.SSASDate From [shyft.hisz.iums.ac.ir].Adt.dbo.SSASDate With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.PatientDeath', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.PatientDeath; 
Select * Into ADT.dbo.PatientDeath From [shyft.hisz.iums.ac.ir].Adt.dbo.PatientDeath With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.CPR', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.CPR; 
Select * Into ADT.dbo.CPR From [shyft.hisz.iums.ac.ir].Adt.dbo.CPR With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.HISMapping', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.HISMapping; 
Select * Into ADT.dbo.HISMapping From [shyft.hisz.iums.ac.ir].Adt.dbo.HISMapping With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.IXRecord', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.IXRecord; 
Select * Into ADT.dbo.IXRecord From [shyft.hisz.iums.ac.ir].Adt.dbo.IXRecord With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.IXSubset', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.IXSubset; 
Select * Into ADT.dbo.IXSubset From [shyft.hisz.iums.ac.ir].Adt.dbo.IXSubset With(Nolock)

Go
 --    Select * From SSASDate                                                             
                                                                  	
	--Select * Into ADT.dbo.Encounter From [shyft.hisz.iums.ac.ir].Adt.dbo.Encounter
	--Where StartDate > Getdate()-1
	
	--Select * From EncounterTemp
	
	
	