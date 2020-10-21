SELECT   '1-'+Cast(PatientID As Varchar(10))PatientID, '1-'+Cast(EncounterID As Varchar(10))EncounterID, StartDate, Count_Of_Date_Day, '1-' + Cast(TransportIX As Varchar(10))TransportIX, '1-' + Cast(WhereToIX As Varchar(10))WhereToIX, TriageLevelIS, DeadOnArrivalCount, DeadedBeforArriveCount, DeterminedIn6h, Determined_Minute, DeterminedIn12h, ExitIn12h, Exit_Minute, 
                         Count_of_All_CPR, Count_of_Successfull_CPR, Count_of_UnSuccessfull_CPR, Count_of_Successfull_CPR_Trauma, Count_of_Successfull_CPR_Internal, Count_of_Successfull_CPR_No_vital_signs, 
                         Discharge_Personal_Responsibility, Count_of_Arrival_EMS, TriageLevel1, TriageLevel2, TriageLevel3, TriageLevel4, TriageLevel5, TriageDurationFirstVisitLevel1, TriageDurationFirstVisitLevel2, TriageDurationFirstVisitLevel3, 
                         TriageDurationFirstVisitLevel4, TriageDurationFirstVisitLevel5, TriageDurationLevel1, TriageDurationLevel2, TriageDurationLevel3, TriageDurationLevel4, TriageDurationLevel5, DeathLessThan12, DeathMoreThan12, 
                         DeathLessThan24, DeathMoreThan24, Count_of_All_InPatient, Count_of_InPatient, Count_of_OutPatient, DeterminedIn6hWithWard, DeterminedMoreThan12hWithWard, TemporaryDispatch, PermanentDispatch, TriageDuration, 
                         TriageConsultTime, TriageFirstVisit, TriageExitTime, InPatient, OutPatient, InOutDeterminedIn6h, InOutDeterminedMore12h, TypeIX, '1-'+Cast(Isnull(LocationID,0) As Varchar(Max))LocationID, '1-'+Cast(Isnull(AFTERWARDWardID,0) As Varchar(Max))AFTERWARDWardID, NonInOutPatient, InOutPatient,'1-'+Cast(Isnull(AFTERWARDSpecialWardID,0) As Varchar(Max))AFTERWARDSpecialWardID , 
                         TriageParaClinic, TriageTransferWard, DepartureEmergency, TriageDurationConsultRequestLevel1, TriageDurationConsultRequestLevel2, TriageDurationConsultRequestLevel3, TriageDurationConsultRequestLevel4, 
                         TriageDurationConsultRequestLevel5, TriageTimeByNurseLevel1, TriageTimeByNurseLevel2, TriageTimeByNurseLevel3, TriageTimeByNurseLevel4, TriageTimeByNurseLevel5, TriageDurationParaclinicLevel1, 
                         TriageDurationParaclinicLevel2, TriageDurationParaclinicLevel3, TriageDurationParaclinicLevel4, TriageDurationParaclinicLevel5, TriageDischargeTimeLevel1, TriageDischargeTimeLevel2, TriageDischargeTimeLevel3, 
                         TriageDischargeTimeLevel4, TriageDischargeTimeLevel5, TriageDurationResultTimeLevel1, TriageDurationResultTimeLevel2, TriageDurationResultTimeLevel3, TransferToWardTimeLevel1, TransferToWardTimeLevel2, 
                         TransferToWardTimeLevel3
FROM            [shyft.hisz.iums.ac.ir].ADT.dbo.View_SSAS_Emergency AS vw
Where StartDate > Getdate() -30
UNION ALL
SELECT     '2-'+Cast(PatientID As Varchar(10))PatientID,  '2-'+Cast(EncounterID As Varchar(10))EncounterID, StartDate, Count_Of_Date_Day, '2-' + Cast(TransportIX As Varchar(10))TransportIX, '2-' + Cast(WhereToIX As Varchar(10))WhereToIX, TriageLevelIS, DeadOnArrivalCount, DeadedBeforArriveCount, DeterminedIn6h, Determined_Minute, DeterminedIn12h, ExitIn12h, Exit_Minute, 
                         Count_of_All_CPR, Count_of_Successfull_CPR, Count_of_UnSuccessfull_CPR, Count_of_Successfull_CPR_Trauma, Count_of_Successfull_CPR_Internal, Count_of_Successfull_CPR_No_vital_signs, 
                         Discharge_Personal_Responsibility, Count_of_Arrival_EMS, TriageLevel1, TriageLevel2, TriageLevel3, TriageLevel4, TriageLevel5, TriageDurationFirstVisitLevel1, TriageDurationFirstVisitLevel2, TriageDurationFirstVisitLevel3, 
                         TriageDurationFirstVisitLevel4, TriageDurationFirstVisitLevel5, TriageDurationLevel1, TriageDurationLevel2, TriageDurationLevel3, TriageDurationLevel4, TriageDurationLevel5, DeathLessThan12, DeathMoreThan12, 
                         DeathLessThan24, DeathMoreThan24, Count_of_All_InPatient, Count_of_InPatient, Count_of_OutPatient, DeterminedIn6hWithWard, DeterminedMoreThan12hWithWard, TemporaryDispatch, PermanentDispatch, TriageDuration, 
                         TriageConsultTime, TriageFirstVisit, TriageExitTime, InPatient, OutPatient, InOutDeterminedIn6h, InOutDeterminedMore12h, TypeIX, '2-'+Cast(Isnull(LocationID,0) As Varchar(Max))LocationID, '2-'+Cast(Isnull(AFTERWARDWardID,0) As Varchar(Max))AFTERWARDWardID, NonInOutPatient, InOutPatient,'2-'+Cast(Isnull(AFTERWARDSpecialWardID,0) As Varchar(Max))AFTERWARDSpecialWardID , 
                         TriageParaClinic, TriageTransferWard, DepartureEmergency, TriageDurationConsultRequestLevel1, TriageDurationConsultRequestLevel2, TriageDurationConsultRequestLevel3, TriageDurationConsultRequestLevel4, 
                         TriageDurationConsultRequestLevel5, TriageTimeByNurseLevel1, TriageTimeByNurseLevel2, TriageTimeByNurseLevel3, TriageTimeByNurseLevel4, TriageTimeByNurseLevel5, TriageDurationParaclinicLevel1, 
                         TriageDurationParaclinicLevel2, TriageDurationParaclinicLevel3, TriageDurationParaclinicLevel4, TriageDurationParaclinicLevel5, TriageDischargeTimeLevel1, TriageDischargeTimeLevel2, TriageDischargeTimeLevel3, 
                         TriageDischargeTimeLevel4, TriageDischargeTimeLevel5, TriageDurationResultTimeLevel1, TriageDurationResultTimeLevel2, TriageDurationResultTimeLevel3, TransferToWardTimeLevel1, TransferToWardTimeLevel2, 
                         TransferToWardTimeLevel3
FROM            [fahm.hisz.iums.ac.ir].ADT.dbo.View_SSAS_Emergency AS vw
Where StartDate > Getdate() -30



SELECT        '1-'+Cast(LocationID As Varchar(Max))LocationID,'»Ì„«—” «‰ ‘Âœ«Ì Ì«›  ¬»«œ - ' + Name As Name, TypeIX
FROM            [shyft.hisz.iums.ac.ir].ADT.dbo.Location
WHERE        (TypeIX IN (1, 10, 12, 19, 20, 21)) AND (ISNULL(CalculateInStatistics, 0) = 1)
Union All
SELECT        '2-'+Cast(LocationID As Varchar(Max))LocationID, '»Ì„«—” «‰  ﬂÊœﬂ«‰ ‘ÂÌœ Õ”Ì‰  ›Â„ÌœÂ - ' + Name As Name, TypeIX
FROM            [fahm.hisz.iums.ac.ir].ADT.dbo.Location
WHERE        (TypeIX IN (1, 10, 12, 19, 20, 21)) AND (ISNULL(CalculateInStatistics, 0) = 1)

SELECT        '1-'+Cast(LocationID As Varchar(Max))LocationID,'»Ì„«—” «‰ ‘Âœ«Ì Ì«›  ¬»«œ - ' + Name As Name, TypeIX
FROM            [shyft.hisz.iums.ac.ir].[ADT].[dbo].[Location]
WHERE        (TypeIX IN (19)) AND (ISNULL(CalculateInStatistics, 0) = 1)
Union All
SELECT        '2-'+Cast(LocationID As Varchar(Max))LocationID, '»Ì„«—” «‰  ﬂÊœﬂ«‰ ‘ÂÌœ Õ”Ì‰  ›Â„ÌœÂ - ' + Name As Name, TypeIX
FROM            [fahm.hisz.iums.ac.ir].[ADT].[dbo].[Location]
WHERE        (TypeIX IN (19)) AND (ISNULL(CalculateInStatistics, 0) = 1)



SELECT        '1-'+Cast(PatientID As Varchar(10))PatientID, '1-'+Cast(EncounterID As Varchar(10))EncounterID
FROM            [shyft.hisz.iums.ac.ir].ADT.dbo.vw_Encounters AS e WITH (nolock)
WHERE        (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT         HISString
                                 FROM           [shyft.hisz.iums.ac.ir].ADT.dbo.HISMapping
                                 WHERE        (ID = 1008)) AS Date))
Union All
SELECT        '2-'+Cast(PatientID As Varchar(10))PatientID, '2-'+Cast(EncounterID As Varchar(10))EncounterID
FROM            [fahm.hisz.iums.ac.ir].[ADT].[dbo].vw_Encounters AS e WITH (nolock)
WHERE        (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [fahm.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
                                 
                                 
                                 Select * From 
                                  [shyft.hisz.iums.ac.ir].ADT.dbo.HISMapping  Where id In (1008,1009,1010)
                                 
                                 Select * From 
                                  [fahm.hisz.iums.ac.ir].[ADT].[dbo].HISMapping  Where id In (1008,1009,1010)

Select * From [shyft.hisz.iums.ac.ir].ADT.dbo.Location



SELECT       '1-'+Cast(IXCode As Varchar(10)) AS WhereToIX, '»Ì„«—” «‰ ‘Âœ«Ì Ì«›  ¬»«œ - ' + Name AS WhereToTitle
FROM            [shyft.hisz.iums.ac.ir].ADT.dbo.IXRecord AS i2
WHERE        (IXSubsetID IN
                             (SELECT        ID
                                FROM            [shyft.hisz.iums.ac.ir].ADT.dbo.IXSubset AS i
                                WHERE        (Name LIKE '%WhereTo%')))
UNION
SELECT       '1-0' AS WhereToIX, '»Ì„«—” «‰ ‘Âœ«Ì Ì«›  ¬»«œ - ' + CAST('À»  ‰‘œÂ' AS NVARCHAR) AS WhereToTitle

Union All

SELECT       '2-'+Cast(IXCode As Varchar(10)) AS WhereToIX, '»Ì„«—” «‰  ﬂÊœﬂ«‰ ‘ÂÌœ Õ”Ì‰  ›Â„ÌœÂ - ' + Name AS WhereToTitle
FROM            [fahm.hisz.iums.ac.ir].ADT.dbo.IXRecord AS i2
WHERE        (IXSubsetID IN
                             (SELECT        ID
                                FROM            [fahm.hisz.iums.ac.ir].ADT.dbo.IXSubset AS i
                                WHERE        (Name LIKE '%WhereTo%')))
UNION
SELECT       '2-0' AS WhereToIX, '»Ì„«—” «‰  ﬂÊœﬂ«‰ ‘ÂÌœ Õ”Ì‰  ›Â„ÌœÂ - ' + CAST('À»  ‰‘œÂ' AS NVARCHAR) AS WhereToTitle





SELECT '1-'+Cast(IXCode As Varchar(10)) AS TransportIX, '»Ì„«—” «‰ ‘Âœ«Ì Ì«›  ¬»«œ - ' + Name AS TransportTitle
FROM            [shyft.hisz.iums.ac.ir].ADT.dbo.IXRecord AS i2
WHERE        (IXSubsetID IN
                             (SELECT        ID
                                FROM            [shyft.hisz.iums.ac.ir].ADT.dbo.IXSubset AS i
                                WHERE        (Name LIKE '%Transport%')))
UNION
SELECT      '1-0' AS TransportIX, '»Ì„«—” «‰  ﬂÊœﬂ«‰ ‘ÂÌœ Õ”Ì‰  ›Â„ÌœÂ - ' + CAST('À»  ‰‘œÂ' AS NVARCHAR) AS TransportTitle  

Union All

SELECT '2-'+Cast(IXCode As Varchar(10)) AS TransportIX, '»Ì„«—” «‰ ‘Âœ«Ì Ì«›  ¬»«œ - ' + Name AS TransportTitle
FROM            [fahm.hisz.iums.ac.ir].ADT.dbo.IXRecord AS i2
WHERE        (IXSubsetID IN
                             (SELECT        ID
                                FROM            [fahm.hisz.iums.ac.ir].ADT.dbo.IXSubset AS i
                                WHERE        (Name LIKE '%Transport%')))
UNION
SELECT      '2-0' AS TransportIX, '»Ì„«—” «‰  ﬂÊœﬂ«‰ ‘ÂÌœ Õ”Ì‰  ›Â„ÌœÂ - ' + CAST('À»  ‰‘œÂ' AS NVARCHAR) AS TransportTitle  




SELECT        '1-'+Cast(LocationID As Varchar(Max))LocationID,'»Ì„«—” «‰ ‘Âœ«Ì Ì«›  ¬»«œ - ' + Name As Name,TypeIX
FROM            [shyft.hisz.iums.ac.ir].ADT.dbo.Location
WHERE        (ISNULL(CalculateInStatistics, 0) = 1) AND (LocationID IN
                             (SELECT        Code
                                FROM            [shyft.hisz.iums.ac.ir].ADT.dbo.vw_HISMapping
                                WHERE        (ID = 1007)))
Union All
SELECT        '2-'+Cast(LocationID As Varchar(Max))LocationID,'»Ì„«—” «‰  ﬂÊœﬂ«‰ ‘ÂÌœ Õ”Ì‰  ›Â„ÌœÂ - ' + Name As Name,TypeIX
FROM            [shyft.hisz.iums.ac.ir].ADT.dbo.Location
WHERE        (ISNULL(CalculateInStatistics, 0) = 1) AND (LocationID IN
                             (SELECT        Code
                                FROM            [shyft.hisz.iums.ac.ir].ADT.dbo.vw_HISMapping
                                WHERE        (ID = 1007)))
                                