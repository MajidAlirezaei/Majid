USE [tempdb]
GO
DBCC SHRINKDATABASE(N'tempdb' )
GO


use master

go

Alter database tempdb modify file (name = tempdev, filename = 'f:\DB-File\tempdb\tempdb.mdf')

go

Alter database tempdb modify file (name = templog, filename = 'f:\DB-File\tempdb\templog.ldf')

go