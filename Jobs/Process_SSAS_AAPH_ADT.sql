USE [msdb]
GO

/****** Object:  Job [Process_SSAS_AAPH_ADT]    Script Date: 10/21/2020 11:48:12 AM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 10/21/2020 11:48:12 AM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Process_SSAS_AAPH_ADT', 
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
/****** Object:  Step [Prepare Data To Process ADT]    Script Date: 10/21/2020 11:48:13 AM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Prepare Data To Process ADT', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=2, 
		@retry_interval=1, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Encounter'', ''U'') IS NOT NULL 
Drop Table ADT_SSAS_AAPH.dbo.Encounter; 
Select * Into ADT_SSAS_AAPH.dbo.Encounter 
From [alias.hisz.iums.ac.ir].Adt.dbo.Encounter With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
                                 
Go 

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.EncounterLocation'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.EncounterLocation; 
Select * Into ADT_SSAS_AAPH.dbo.EncounterLocation 
From [alias.hisz.iums.ac.ir].Adt.dbo.EncounterLocation With(Nolock)
Where (CAST(CONVERT(Varchar, StartDate, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
                                 
Go                                  
 
/* 
IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.ServiceEvent'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.ServiceEvent; 
Select * --Into ServiceEvent 
From [alias.hisz.iums.ac.ir].Adt.dbo.ServiceEvent With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
Go                                 

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.FinancialTransaction'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.FinancialTransaction; 
Select * --Into FinancialTransaction 
From [alias.hisz.iums.ac.ir].Adt.dbo.FinancialTransaction With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
                                 */
Go      
      
IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Location'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Location; 
Select * Into ADT_SSAS_AAPH.dbo.Location From [alias.hisz.iums.ac.ir].Adt.dbo.Location With(Nolock)    

Go      

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.LocationLog'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.LocationLog; 
Select * Into ADT_SSAS_AAPH.dbo.LocationLog From [alias.hisz.iums.ac.ir].Adt.dbo.LocationLog With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))        
Go                                 
                                 
IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Arrival'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Arrival; 
Select * Into ADT_SSAS_AAPH.dbo.Arrival 
From [alias.hisz.iums.ac.ir].Adt.dbo.Arrival With(Nolock)  
                                 
Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Departure'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Departure; 
Select * Into ADT_SSAS_AAPH.dbo.Departure From [alias.hisz.iums.ac.ir].Adt.dbo.Departure With(Nolock)
 
Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.SSASDate'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.SSASDate; 
Select * Into ADT_SSAS_AAPH.dbo.SSASDate From [alias.hisz.iums.ac.ir].Adt.dbo.SSASDate With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Triage'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Triage; 
Select * Into ADT_SSAS_AAPH.dbo.Triage 
From [alias.hisz.iums.ac.ir].Adt.dbo.Triage With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.PatientDeath'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.PatientDeath; 
Select * Into ADT_SSAS_AAPH.dbo.PatientDeath From [alias.hisz.iums.ac.ir].Adt.dbo.PatientDeath With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.CPR'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.CPR; 
Select * Into ADT_SSAS_AAPH.dbo.CPR From [alias.hisz.iums.ac.ir].Adt.dbo.CPR With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.HISMapping'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.HISMapping; 
Select * Into ADT_SSAS_AAPH.dbo.HISMapping From [alias.hisz.iums.ac.ir].Adt.dbo.HISMapping With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.IXRecord'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.IXRecord; 
Select * Into ADT_SSAS_AAPH.dbo.IXRecord From [alias.hisz.iums.ac.ir].Adt.dbo.IXRecord With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.IXSubset'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.IXSubset; 
Select * Into ADT_SSAS_AAPH.dbo.IXSubset From [alias.hisz.iums.ac.ir].Adt.dbo.IXSubset With(Nolock)

Go', 
		@database_name=N'ADT_SSAS_AAPH', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Process ADT]    Script Date: 10/21/2020 11:48:13 AM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Process ADT', 
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
        <DatabaseID>SSAS_ADT_AAPH</DatabaseID>
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
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Process_SSAS_ADT', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20201010, 
		@active_end_date=99991231, 
		@active_start_time=170000, 
		@active_end_time=235959, 
		@schedule_uid=N'c6426d21-7e24-4fea-97df-5048887ed562'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


