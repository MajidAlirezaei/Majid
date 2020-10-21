Select Distinct-- dbo.GetRootParentOfAclNode(a.ID),
dbo.GetRootParentOfAclNodeDisplayName(a.ID)+' ' + a2.DisplayName --, * 
From ACLNode AS a
Inner Join ACLNode AS a2 On a.ID = a2.ParentNodeID
Where a.DisplayName <> ''
--And a.ID=47243921



Select * From ACLActor AS a
Inner Join ACLGroup AS a2 On a2.ID = a.ID

Select * From sys.objects AS o
Where Name Like '%ip%'


Select * From DBRegistryLog AS d
Where d.StringValue Like '%192.168%'


--And( a.NodeTypeIS = 1
--Or Not Exists (Select a3.ParentNodeID From ACLNode AS a3))