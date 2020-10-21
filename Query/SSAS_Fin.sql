IF OBJECT_ID('ADT.dbo.MasterService', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.MasterService; 
Select * Into ADT.dbo.MasterService From [shyft.hisz.iums.ac.ir].Adt.dbo.MasterService With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.ServiceEvent', 'U') IS NOT NULL 
Drop Table ADT.dbo.ServiceEvent; 
Select * Into ADT.dbo.ServiceEvent 
From [shyft.hisz.iums.ac.ir].Adt.dbo.ServiceEvent With(Nolock)
Where (CAST(CONVERT(Varchar, DateOf, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
   
Go

IF OBJECT_ID('ADT.dbo.DocPrac2', 'U') IS NOT NULL 
Drop Table ADT.dbo.DocPrac2; 
Select * Into ADT.dbo.DocPrac2 
From [shyft.hisz.iums.ac.ir].Adt.dbo.DocPrac2 With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [shyft.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))        

Go 

IF OBJECT_ID('ADT.dbo.Practitioner', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.Practitioner; 
Select * Into ADT.dbo.Practitioner From [shyft.hisz.iums.ac.ir].Adt.dbo.Practitioner With(Nolock)

Go                                 

IF OBJECT_ID('ADT.dbo.PractitionerPerson', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.PractitionerPerson; 
Select * Into ADT.dbo.PractitionerPerson From [shyft.hisz.iums.ac.ir].Adt.dbo.PractitionerPerson With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.SRGFinance', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.SRGFinance; 
Select * Into ADT.dbo.SRGFinance From [shyft.hisz.iums.ac.ir].Adt.dbo.SRGFinance With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.RVU_Formula_History', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.RVU_Formula_History; 
Select * Into ADT.dbo.RVU_Formula_History From [shyft.hisz.iums.ac.ir].Adt.dbo.RVU_Formula_History With(Nolock)

Go
    
IF OBJECT_ID('ADT.dbo.RVU_MasterService_Version3_1399', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.RVU_MasterService_Version3_1399; 
Select * Into ADT.dbo.RVU_MasterService_Version3_1399 From [shyft.hisz.iums.ac.ir].Adt.dbo.RVU_MasterService_Version3_1399 With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.RVU_MasterService_version3', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.RVU_MasterService_version3; 
Select * Into ADT.dbo.RVU_MasterService_version3 From [shyft.hisz.iums.ac.ir].Adt.dbo.RVU_MasterService_version3 With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.RVU_MasterService_version2', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.RVU_MasterService_version2; 
Select * Into ADT.dbo.RVU_MasterService_version2 From [shyft.hisz.iums.ac.ir].Adt.dbo.RVU_MasterService_version2 With(Nolock)

Go

IF OBJECT_ID('ADT.dbo.RVU_MasterService', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.RVU_MasterService; 
Select * Into ADT.dbo.RVU_MasterService From [shyft.hisz.iums.ac.ir].Adt.dbo.RVU_MasterService With(Nolock)

Go
 
IF OBJECT_ID('ADT.dbo.DiscountInfo', 'U') IS NOT NULL 
DROP TABLE ADT.dbo.DiscountInfo; 
Select * Into ADT.dbo.DiscountInfo From [shyft.hisz.iums.ac.ir].Adt.dbo.DiscountInfo With(Nolock)

Go 
       







                                 
         
        
                             