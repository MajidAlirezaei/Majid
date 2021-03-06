Alter FUNCTION [dbo].[GetRootParentOfAclNodeDisplayName]
(
	-- Add the parameters for the function here
	@ID INT
)
RETURNS Varchar(Max)
AS
BEGIN
	IF IsNull(@ID,0) = 0
		RETURN -1
	
	DECLARE @Result Varchar(Max)
	DECLARE @DN Varchar(Max)
	DECLARE @DNS Varchar(Max)
	DECLARE @Level INT
	SET @Level = 0
	
	WHILE 1=1
	
	BEGIN
		DECLARE @ParentNodeID Varchar(Max) 

		If Not Exists (Select IsNull(ParentNodeID,0) FROM ACLNode where ID = @ID)
			Return ''
					
		Select @ParentNodeID = IsNull(ParentNodeID,0)
			,@DN = DisplayName FROM ACLNode where ID = @ID
		
		Set @DNS = Isnull(@DN,'') + '/' + Isnull(@DNS,'')
		
		IF @ParentNodeID is NULL
			RETURN ''
			
		IF @ParentNodeID = 0 
		BEGIN
			IF @Level = 0
				RETURN @DN
				
			RETURN @DNS
				
		END
		ELSE
			SET @ID = @ParentNodeID
		
		SET @Level = @Level + 1
		
		
	END
	
	RETURN @Result

END
