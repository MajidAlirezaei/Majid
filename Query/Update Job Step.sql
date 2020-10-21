UPDATE     [jbs]
SET        [jbs].[retry_attempts] = '2'  --retry 2 times
         , [jbs].[retry_interval] = '1' --every 10 minutes
FROM       [msdb].[dbo].[sysjobs] [jb]
INNER JOIN [msdb].[dbo].[sysjobsteps] [jbs]
    ON [jbs].[job_id] = [jb].[job_id]
WHERE     -- [jb].[name] LIKE '%Test%' --Job Name Filter
            [jbs].[step_name] = 'Process ADT'