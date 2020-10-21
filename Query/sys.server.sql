SELECT * FROM [shyft.hisz.iums.ac.ir].ADT.dbo.Encounter 



JOIN DatabaseB.dbo.OtherTable
ON [IT3\SQL2019].ADT.dbo.SomeTable.Id = DatabaseB.dbo.OtherTable.Id


Select * From sys.servers

EXEC sp_addlinkedserver @server='fahm.hisz.iums.ac.ir',@
EXEC sp_addlinkedsrvlogin 'fahm.hisz.iums.ac.ir', 'false', NULL, 'olapuser', 'Iran991'

EXEC sp_addlinkedserver @server='shyft.hisz.iums.ac.ir'
EXEC sp_addlinkedsrvlogin 'shyft.hisz.iums.ac.ir', 'false', NULL, 'olapuser', 'Iran99'

Update sys.servers Set [catalog] = 'ADT', 
