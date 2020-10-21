Select p.NationalCode, * From InsuranceContract AS ic
Inner Join Insurer AS i On i.InsurerID = ic.InsurerID
Inner Join Patient AS p On ic.PatientID = p.PatientID
Inner Join BillingAccount AS ba On ba.InsuranceContractID = ic.InsuranceContractID
Where i.Name Like '%”·«„ -%'
And p.NationalCode <> ''
And ic.DateOf > Getdate () - 30
And ba.TypeIX  =1