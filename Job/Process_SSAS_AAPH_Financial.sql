USE [msdb]
GO

/****** Object:  Job [Process_SSAS_AAPH_Financial]    Script Date: 10/21/2020 11:48:43 AM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 10/21/2020 11:48:43 AM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Process_SSAS_AAPH_Financial', 
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
/****** Object:  Step [Prepare Data To Process Financial]    Script Date: 10/21/2020 11:48:43 AM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Prepare Data To Process Financial', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=2, 
		@retry_interval=1, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.MasterService'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.MasterService; 
Select * Into ADT_SSAS_AAPH.dbo.MasterService From [alias.hisz.iums.ac.ir].Adt.dbo.MasterService With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.ServiceEvent'', ''U'') IS NOT NULL 
Drop Table ADT_SSAS_AAPH.dbo.ServiceEvent; 
Select * Into ADT_SSAS_AAPH.dbo.ServiceEvent 
From [alias.hisz.iums.ac.ir].Adt.dbo.ServiceEvent With(Nolock)
Where (CAST(CONVERT(Varchar, DateOf, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))
And statusix<>3
   
Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.DocPrac2'', ''U'') IS NOT NULL 
Drop Table ADT_SSAS_AAPH.dbo.DocPrac2; 
Select * Into ADT_SSAS_AAPH.dbo.DocPrac2 
From [alias.hisz.iums.ac.ir].Adt.dbo.DocPrac2 With(Nolock)
Where (CAST(CONVERT(Varchar, DateOf, 111) AS Date) >= CAST
                             ((SELECT        HISString
                                 FROM             [alias.hisz.iums.ac.ir].[ADT].[dbo].HISMapping
                                 WHERE        (ID = 1008)) AS Date))        

Go 

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.Practitioner'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.Practitioner; 
Select * Into ADT_SSAS_AAPH.dbo.Practitioner From [alias.hisz.iums.ac.ir].Adt.dbo.Practitioner With(Nolock)

Go                                 

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.PractitionerPerson'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.PractitionerPerson; 
Select * Into ADT_SSAS_AAPH.dbo.PractitionerPerson From [alias.hisz.iums.ac.ir].Adt.dbo.PractitionerPerson With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.SRGFinance'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.SRGFinance; 
Select * Into ADT_SSAS_AAPH.dbo.SRGFinance From [alias.hisz.iums.ac.ir].Adt.dbo.SRGFinance With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.RVU_Formula_History'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.RVU_Formula_History; 
Select * Into ADT_SSAS_AAPH.dbo.RVU_Formula_History From [alias.hisz.iums.ac.ir].Adt.dbo.RVU_Formula_History With(Nolock)

Go
    
IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.RVU_MasterService_Version3_1399'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.RVU_MasterService_Version3_1399; 
Select * Into ADT_SSAS_AAPH.dbo.RVU_MasterService_Version3_1399 From [alias.hisz.iums.ac.ir].Adt.dbo.RVU_MasterService_Version3_1399 With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.RVU_MasterService_version3'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.RVU_MasterService_version3; 
Select * Into ADT_SSAS_AAPH.dbo.RVU_MasterService_version3 From [alias.hisz.iums.ac.ir].Adt.dbo.RVU_MasterService_version3 With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.RVU_MasterService_version2'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.RVU_MasterService_version2; 
Select * Into ADT_SSAS_AAPH.dbo.RVU_MasterService_version2 From [alias.hisz.iums.ac.ir].Adt.dbo.RVU_MasterService_version2 With(Nolock)

Go

IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.RVU_MasterService'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.RVU_MasterService; 
Select * Into ADT_SSAS_AAPH.dbo.RVU_MasterService From [alias.hisz.iums.ac.ir].Adt.dbo.RVU_MasterService With(Nolock)

Go
 
IF OBJECT_ID(''ADT_SSAS_AAPH.dbo.DiscountInfo'', ''U'') IS NOT NULL 
DROP TABLE ADT_SSAS_AAPH.dbo.DiscountInfo; 
Select * Into ADT_SSAS_AAPH.dbo.DiscountInfo From [alias.hisz.iums.ac.ir].Adt.dbo.DiscountInfo With(Nolock)

Go 

', 
		@database_name=N'ADT_SSAS_AAPH', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Process Financial]    Script Date: 10/21/2020 11:48:43 AM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Process Financial', 
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
        <DatabaseID>SSAS_Financial_AAPH</DatabaseID>
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
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Process_SSAS_Financial', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20201020, 
		@active_end_date=99991231, 
		@active_start_time=40000, 
		@active_end_time=235959, 
		@schedule_uid=N'd82e2d29-20b9-4ebe-b120-3c81980e01ba'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


