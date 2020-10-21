select 
 j.name as 'JobName',
  h.step_name,

  run_duration,
 msdb.dbo.agent_datetime(run_date, run_time) as 'RunDateTime',


 ((run_duration/10000*3600 + (run_duration/100)%100*60 + run_duration%100 + 31 ) / 60) 
          as 'RunDurationMinutes'
		  ,case when h.run_status = 1 then 'ÇäÌÇã ÔÏå' else 'ÎØÇ' end [Status]
		--  ,h.*
		,h.[message]
From msdb.dbo.sysjobs j 
INNER JOIN msdb.dbo.sysjobhistory h 
 ON j.job_id = h.job_id 
where j.enabled = 1  --Only Enabled Jobs
--and h.step_name like 'proce%'
And j.name like '%_mhbr%'
and  msdb.dbo.agent_datetime(run_date, run_time)  > getdate() -1
--and h.step_name like 'prepare%'
--and h.run_status = 0
--and run_duration > 200
--and h.[message] like '%connectio%'
order by JobName, RunDateTime desc


