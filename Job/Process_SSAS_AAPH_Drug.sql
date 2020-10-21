USE [msdb]
GO

/****** Object:  Job [Process_SSAS_AAPH_Drug]    Script Date: 10/21/2020 11:48:27 AM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 10/21/2020 11:48:27 AM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Process_SSAS_AAPH_Drug', 
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
/****** Object:  Step [Prepare Data To Process Drug]    Script Date: 10/21/2020 11:48:27 AM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Prepare Data To Process Drug', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=2, 
		@retry_interval=1, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Prescription'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Prescription; 
Select * Into ADT_SSAS_AAPH.dbo.Prescription From [alias.hisz.iums.ac.ir].Adt.dbo.Prescription With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))  
                                 
Go  

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.PrescriptionItem'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.PrescriptionItem; 
Select * Into ADT_SSAS_AAPH.dbo.PrescriptionItem From [alias.hisz.iums.ac.ir].Adt.dbo.PrescriptionItem With(Nolock)
Where PrescriptionID >= (Select Top 1 p.ID From [alias.hisz.iums.ac.ir].Adt.dbo.Prescription AS p With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))  
Order By p.DateOf)
                                  
Go                                 

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.DrugstoreDoc'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.DrugstoreDoc; 
Select * Into ADT_SSAS_AAPH.dbo.DrugstoreDoc From [alias.hisz.iums.ac.ir].Adt.dbo.DrugstoreDoc With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))  
                                 
Go  

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.DrugStoreDocItem'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.DrugStoreDocItem; 
Select * Into ADT_SSAS_AAPH.dbo.DrugStoreDocItem From [alias.hisz.iums.ac.ir].Adt.dbo.DrugStoreDocItem With(Nolock)
Where DrugStoreDocID >= (Select Top 1 p.ID From [alias.hisz.iums.ac.ir].Adt.dbo.DrugStoreDoc AS p With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))  
Order By p.DateOf)
                                  
Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Storage'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Storage; 
Select * Into ADT_SSAS_AAPH.dbo.Storage From [alias.hisz.iums.ac.ir].Adt.dbo.Storage With(Nolock)
Where (CAST(CONVERT(Varchar, Dateof, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))  
                                 
Go  

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Salable'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Salable; 
Select * Into ADT_SSAS_AAPH.dbo.Salable 
From [alias.hisz.iums.ac.ir].Adt.dbo.Salable With(Nolock)  

Go 

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Dept'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Dept; 
Select * Into ADT_SSAS_AAPH.dbo.Dept 
From [alias.hisz.iums.ac.ir].Adt.dbo.Dept With(Nolock)  

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Threshold'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Threshold; 
Select * Into ADT_SSAS_AAPH.dbo.Threshold 
From [alias.hisz.iums.ac.ir].Adt.dbo.Threshold With(Nolock)  

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Packaging'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Packaging; 
Select * Into ADT_SSAS_AAPH.dbo.Packaging 
From [alias.hisz.iums.ac.ir].Adt.dbo.Packaging With(Nolock)  

', 
		@database_name=N'ADT_SSAS_AAPH', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Process Drug]    Script Date: 10/21/2020 11:48:27 AM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Process Drug', 
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
        <DatabaseID>SSAS_Drug_AAPH</DatabaseID>
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
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Process_SSAS_Drug', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20201020, 
		@active_end_date=99991231, 
		@active_start_time=210000, 
		@active_end_time=235959, 
		@schedule_uid=N'32fd581e-0e01-41e4-b40f-09a81ac55dee'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


