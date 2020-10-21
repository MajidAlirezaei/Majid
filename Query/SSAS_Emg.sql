IF OBJECT_ID('ADT.dbo.Triage', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Triage; 
Select * Into ADT.dbo.Triage 
From [shyft.hisz.iums.ac.ir].Adt.dbo.Triage With(Nolock)

Go 

IF OBJECT_ID('ADT.dbo.CPR', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.CPR; 
Select * Into ADT.dbo.CPR From [shyft.hisz.iums.ac.ir].Adt.dbo.CPR With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.BillingAccount', 'U') IS NOT NULL 
Drop Table ADT.dbo.BillingAccount; 
Select * Into ADT.dbo.BillingAccount 
From [shyft.hisz.iums.ac.ir].Adt.dbo.BillingAccount With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
                                 
Go 

IF OBJECT_ID('ADT.dbo.FinancialTransaction', 'U') IS NOT NULL 
Drop Table ADT.dbo.FinancialTransaction; 
Select * Into ADT.dbo.FinancialTransaction 
From [shyft.hisz.iums.ac.ir].Adt.dbo.FinancialTransaction With(Nolock)
Where (CAST(CONVERT(Varchar, DateOf, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))

Go


IF OBJECT_ID('ADT.dbo.InsurerRejected', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.InsurerRejected; 
Select * Into ADT.dbo.InsurerRejected From [shyft.hisz.iums.ac.ir].Adt.dbo.InsurerRejected With(Nolock)
Where BillingAccID >= (Select Top 1 p.BillingAccountID From [shyft.hisz.iums.ac.ir].Adt.dbo.BillingAccount AS p With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))  
Order By p.StartDate)

Go

IF OBJECT_ID('ADT.dbo.Diagnosis', 'U') IS NOT NULL 
Drop Table ADT.dbo.Diagnosis; 
Select * Into ADT.dbo.Diagnosis 
From [shyft.hisz.iums.ac.ir].Adt.dbo.Diagnosis With(Nolock)
Where (CAST(CONVERT(Varchar, DateOf, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))

Go

IF OBJECT_ID('ADT.dbo.EncounterPractitioner', 'U') IS NOT NULL 
Drop Table ADT.dbo.EncounterPractitioner; 
Select * Into ADT.dbo.EncounterPractitioner 
From [shyft.hisz.iums.ac.ir].Adt.dbo.EncounterPractitioner With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))

Go

IF OBJECT_ID('ADT.dbo.InsuranceContract', 'U') IS NOT NULL 
Drop Table ADT.dbo.InsuranceContract; 
Select * Into ADT.dbo.InsuranceContract 
From [shyft.hisz.iums.ac.ir].Adt.dbo.InsuranceContract With(Nolock)
Where (CAST(CONVERT(Varchar, DateOf, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))

Go

IF OBJECT_ID('ADT.dbo.Insurer', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Insurer; 
Select * Into ADT.dbo.Insurer From [shyft.hisz.iums.ac.ir].Adt.dbo.Insurer With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.SRGSession', 'U') IS NOT NULL 
Drop Table ADT.dbo.SRGSession; 
Select * Into ADT.dbo.SRGSession 
From [shyft.hisz.iums.ac.ir].Adt.dbo.SRGSession With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))

Go

IF OBJECT_ID('ADT.dbo.OutPatientRecord', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.OutPatientRecord; 
Select * Into ADT.dbo.OutPatientRecord From [shyft.hisz.iums.ac.ir].Adt.dbo.OutPatientRecord With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.PatientRecord', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.PatientRecord; 
Select * Into ADT.dbo.PatientRecord From [shyft.hisz.iums.ac.ir].Adt.dbo.PatientRecord With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.DBRegistry', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.DBRegistry; 
Select * Into ADT.dbo.DBRegistry From [shyft.hisz.iums.ac.ir].Adt.dbo.DBRegistry With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.Patient', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Patient; 
Select * Into ADT.dbo.Patient From [shyft.hisz.iums.ac.ir].Adt.dbo.Patient With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.Person', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Person; 
Select * Into ADT.dbo.Person From [shyft.hisz.iums.ac.ir].Adt.dbo.Person With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.CaliforniaCode', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.CaliforniaCode; 
Select * Into ADT.dbo.CaliforniaCode From [shyft.hisz.iums.ac.ir].Adt.dbo.CaliforniaCode With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.Surgeon', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Surgeon; 
Select * Into ADT.dbo.Surgeon From [shyft.hisz.iums.ac.ir].Adt.dbo.Surgeon With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.OutPatRecArchive', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.OutPatRecArchive; 
Select * Into ADT.dbo.OutPatRecArchive From [shyft.hisz.iums.ac.ir].Adt.dbo.OutPatRecArchive With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.CaliforniaCode', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.CaliforniaCode; 
Select * Into ADT.dbo.CaliforniaCode From [shyft.hisz.iums.ac.ir].Adt.dbo.CaliforniaCode With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.Surgeon', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Surgeon; 
Select * Into ADT.dbo.Surgeon From [shyft.hisz.iums.ac.ir].Adt.dbo.Surgeon With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.OutPatRecArchive', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.OutPatRecArchive; 
Select * Into ADT.dbo.OutPatRecArchive From [shyft.hisz.iums.ac.ir].Adt.dbo.OutPatRecArchive With(Nolock)





