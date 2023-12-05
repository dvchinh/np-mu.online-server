CREATE Procedure [dbo].[WZ_GetResetInfo]
@Account varchar(10),
@Name varchar(10)
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @Reset int
DECLARE @ResetDay int
DECLARE @ResetWek int
DECLARE @ResetMon int

SELECT @Reset=ResetCount,@ResetDay=0,@ResetWek=0,@ResetMon=0 FROM Character WHERE AccountID=@Account AND Name=@Name

SELECT @Reset AS Reset,@ResetDay AS ResetDay,@ResetWek AS ResetWek,@ResetMon AS ResetMon

SET NOCOUNT OFF
SET XACT_ABORT OFF

END