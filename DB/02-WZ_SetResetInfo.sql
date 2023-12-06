ALTER Procedure [dbo].[WZ_SetResetInfo] 
@Account varchar(10),
@Name varchar(10),
@Reset int,
@ResetDay int,
@ResetWek int,
@ResetMon int
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

UPDATE Character SET ResetCount=@Reset WHERE AccountID=@Account AND Name=@Name
INSERT INTO [dbo].[np_reset_history] (account, character, reset) VALUES (@Account, @Name, @Reset)
SET NOCOUNT OFF
SET XACT_ABORT OFF

END
