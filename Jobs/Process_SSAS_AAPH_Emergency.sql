USE [msdb]
GO

/****** Object:  Job [Process_SSAS_AAPH_Emergency]    Script Date: 10/21/2020 11:48:34 AM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 10/21/2020 11:48:34 AM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Process_SSAS_AAPH_Emergency', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'RW-SERVER\alirezaee.m', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Prepare Data To Process Emergency]    Script Date: 10/21/2020 11:48:34 AM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Prepare Data To Process Emergency', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=2, 
		@retry_interval=1, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Triage'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Triage; 
Select * Into ADT_SSAS_AAPH.dbo.Triage 
From [alias.hisz.iums.ac.ir].Adt.dbo.Triage With(Nolock)

Go 

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.CPR'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.CPR; 
Select * Into ADT_SSAS_AAPH.dbo.CPR From [alias.hisz.iums.ac.ir].Adt.dbo.CPR With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.BillingAccount'', ''U'') IS NOT NULL 
Drop Table ADT_SSAS_AAPH.dbo.BillingAccount; 
Select * Into ADT_SSAS_AAPH.dbo.BillingAccount 
From [alias.hisz.iums.ac.ir].Adt.dbo.BillingAccount With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
                                 
Go 

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.FinancialTransaction'', ''U'') IS NOT NULL 
Drop Table ADT_SSAS_AAPH.dbo.FinancialTransaction; 
Select * Into ADT_SSAS_AAPH.dbo.FinancialTransaction 
From [alias.hisz.iums.ac.ir].Adt.dbo.FinancialTransaction With(Nolock)
Where (CAST(CONVERT(Varchar, DateOf, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))

Go


IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.InsurerRejected'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.InsurerRejected; 
Select * Into ADT_SSAS_AAPH.dbo.InsurerRejected From [alias.hisz.iums.ac.ir].Adt.dbo.InsurerRejected With(Nolock)
Where BillingAccID >= (Select Top 1 p.BillingAccountID From [alias.hisz.iums.ac.ir].Adt.dbo.BillingAccount AS p With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))  
Order By p.StartDate)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Diagnosis'', ''U'') IS NOT NULL 
Drop Table ADT_SSAS_AAPH.dbo.Diagnosis; 
Select * Into ADT_SSAS_AAPH.dbo.Diagnosis 
From [alias.hisz.iums.ac.ir].Adt.dbo.Diagnosis With(Nolock)
Where (CAST(CONVERT(Varchar, DateOf, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.EncounterPractitioner'', ''U'') IS NOT NULL 
Drop Table ADT_SSAS_AAPH.dbo.EncounterPractitioner; 
Select * Into ADT_SSAS_AAPH.dbo.EncounterPractitioner 
From [alias.hisz.iums.ac.ir].Adt.dbo.EncounterPractitioner With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.InsuranceContract'', ''U'') IS NOT NULL 
Drop Table ADT_SSAS_AAPH.dbo.InsuranceContract; 
Select * Into ADT_SSAS_AAPH.dbo.InsuranceContract 
From [alias.hisz.iums.ac.ir].Adt.dbo.InsuranceContract With(Nolock)
Where (CAST(CONVERT(Varchar, DateOf, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Insurer'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Insurer; 
Select * Into ADT_SSAS_AAPH.dbo.Insurer From [alias.hisz.iums.ac.ir].Adt.dbo.Insurer With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.SRGSession'', ''U'') IS NOT NULL 
Drop Table ADT_SSAS_AAPH.dbo.SRGSession; 
Select * Into ADT_SSAS_AAPH.dbo.SRGSession 
From [alias.hisz.iums.ac.ir].Adt.dbo.SRGSession With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.OutPatientRecord'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.OutPatientRecord; 
Select * Into ADT_SSAS_AAPH.dbo.OutPatientRecord From [alias.hisz.iums.ac.ir].Adt.dbo.OutPatientRecord With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.PatientRecord'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.PatientRecord; 
Select * Into ADT_SSAS_AAPH.dbo.PatientRecord From [alias.hisz.iums.ac.ir].Adt.dbo.PatientRecord With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.DBRegistry'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.DBRegistry; 
Select * Into ADT_SSAS_AAPH.dbo.DBRegistry From [alias.hisz.iums.ac.ir].Adt.dbo.DBRegistry With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Patient'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Patient; 
Select * Into ADT_SSAS_AAPH.dbo.Patient From [alias.hisz.iums.ac.ir].Adt.dbo.Patient With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Person'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Person; 
Select * Into ADT_SSAS_AAPH.dbo.Person From [alias.hisz.iums.ac.ir].Adt.dbo.Person With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.CaliforniaCode'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.CaliforniaCode; 
Select * Into ADT_SSAS_AAPH.dbo.CaliforniaCode From [alias.hisz.iums.ac.ir].Adt.dbo.CaliforniaCode With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Surgeon'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Surgeon; 
Select * Into ADT_SSAS_AAPH.dbo.Surgeon From [alias.hisz.iums.ac.ir].Adt.dbo.Surgeon With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.OutPatRecArchive'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.OutPatRecArchive; 
Select * Into ADT_SSAS_AAPH.dbo.OutPatRecArchive From [alias.hisz.iums.ac.ir].Adt.dbo.OutPatRecArchive With(Nolock)
', 
		@database_name=N'ADT_SSAS_AAPH', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Process Emergency]    Script Date: 10/21/2020 11:48:34 AM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Process Emergency', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=2, 
		@retry_interval=1, 
		@os_run_priority=0, @subsystem=N'ANALYSISCOMMAND', 
		@command=N'<Batch xmlns="http://schemas.microsoft.com/analysisservices/2003/engine">
  <ErrorConfiguration xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ddl2="http://schemas.microsoft.com/analysisservices/2003/engine/2" xmlns:ddl2_2="http://schemas.microsoft.com/analysisservices/2003/engine/2/2" xmlns:ddl100_100="http://schemas.microsoft.com/analysisservices/2008/engine/100/100" xmlns:ddl200="http://schemas.microsoft.com/analysisservices/2010/engine/200" xmlns:ddl200_200="http://schemas.microsoft.com/analysisservices/2010/engine/200/200" xmlns:ddl300="http://schemas.microsoft.com/analysisservices/2011/engine/300" xmlns:ddl300_300="http://schemas.microsoft.com/analysisservices/2011/engine/300/300" xmlns:ddl400="http://schemas.microsoft.com/analysisservices/2012/engine/400" xmlns:ddl400_400="http://schemas.microsoft.com/analysisservices/2012/engine/400/400">
    <KeyNotFound>IgnoreError</KeyNotFound>
    <NullKeyNotAllowed>IgnoreError</NullKeyNotAllowed>
  </ErrorConfiguration>
  <Parallel>
    <Process xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ddl2="http://schemas.microsoft.com/analysisservices/2003/engine/2" xmlns:ddl2_2="http://schemas.microsoft.com/analysisservices/2003/engine/2/2" xmlns:ddl100_100="http://schemas.microsoft.com/analysisservices/2008/engine/100/100" xmlns:ddl200="http://schemas.microsoft.com/analysisservices/2010/engine/200" xmlns:ddl200_200="http://schemas.microsoft.com/analysisservices/2010/engine/200/200" xmlns:ddl300="http://schemas.microsoft.com/analysisservices/2011/engine/300" xmlns:ddl300_300="http://schemas.microsoft.com/analysisservices/2011/engine/300/300" xmlns:ddl400="http://schemas.microsoft.com/analysisservices/2012/engine/400" xmlns:ddl400_400="http://schemas.microsoft.com/analysisservices/2012/engine/400/400">
      <Object>
        <DatabaseID>SSAS_Emergency_AAPH</DatabaseID>
      </Object>
      <Type>ProcessFull</Type>
      <WriteBackTableCreation>UseExisting</WriteBackTableCreation>
    </Process>
  </Parallel>
</Batch>', 
		@server=N'.\SQL2017', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Process_SSAS_Emergency', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20201020, 
		@active_end_date=99991231, 
		@active_start_time=230000, 
		@active_end_time=235959, 
		@schedule_uid=N'9639b4e4-1b14-4a2f-96bb-c5dc59b2473a'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


