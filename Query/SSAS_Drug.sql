IF OBJECT_ID('ADT.dbo.Prescription', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Prescription; 
Select * Into ADT.dbo.Prescription From [shyft.hisz.iums.ac.ir].Adt.dbo.Prescription With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))  
                                 
Go  

IF OBJECT_ID('ADT.dbo.PrescriptionItem', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.PrescriptionItem; 
Select * Into ADT.dbo.PrescriptionItem From [shyft.hisz.iums.ac.ir].Adt.dbo.PrescriptionItem With(Nolock)
Where PrescriptionID >= (Select Top 1 p.ID From [shyft.hisz.iums.ac.ir].Adt.dbo.Prescription AS p With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))  
Order By p.DateOf)
                                  
Go                                 

IF OBJECT_ID('ADT.dbo.DrugstoreDoc', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.DrugstoreDoc; 
Select * Into ADT.dbo.DrugstoreDoc From [shyft.hisz.iums.ac.ir].Adt.dbo.DrugstoreDoc With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))  
                                 
Go  

IF OBJECT_ID('ADT.dbo.DrugStoreDocItem', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.DrugStoreDocItem; 
Select * Into ADT.dbo.DrugStoreDocItem From [shyft.hisz.iums.ac.ir].Adt.dbo.DrugStoreDocItem With(Nolock)
Where DrugStoreDocID >= (Select Top 1 p.ID From [shyft.hisz.iums.ac.ir].Adt.dbo.DrugStoreDoc AS p With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))  
Order By p.DateOf)
                                  
Go

IF OBJECT_ID('ADT.dbo.Storage', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Storage; 
Select * Into ADT.dbo.Storage From [shyft.hisz.iums.ac.ir].Adt.dbo.Storage With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))  
                                 
Go  

IF OBJECT_ID('ADT.dbo.Salable', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Salable; 
Select * Into ADT.dbo.Salable 
From [shyft.hisz.iums.ac.ir].Adt.dbo.Salable With(Nolock)  

IF OBJECT_ID('ADT.dbo.Dept', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Dept; 
Select * Into ADT.dbo.Dept 
From [shyft.hisz.iums.ac.ir].Adt.dbo.Dept With(Nolock)  


IF OBJECT_ID('ADT.dbo.Threshold', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Threshold; 
Select * Into ADT.dbo.Threshold 
From [shyft.hisz.iums.ac.ir].Adt.dbo.Threshold With(Nolock)  


IF OBJECT_ID('ADT.dbo.Packaging', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Packaging; 
Select * Into ADT.dbo.Packaging 
From [shyft.hisz.iums.ac.ir].Adt.dbo.Packaging With(Nolock)  





