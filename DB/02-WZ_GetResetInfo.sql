ALTER Procedure [dbo].[WZ_GetResetInfo]
@Account varchar(10),
@Name varchar(10)
AS
BEGIN

SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @Reset int
DECLARE @ResetDay int = 0
DECLARE @ResetWek int = 0
DECLARE @ResetMon int = 0

SELECT @Reset=ResetCount FROM Character WHERE AccountID=@Account AND Name=@Name

DECLARE @prev_created DATETIME = NULL;
DECLARE @prev_elapsed INT = NULL;
SELECT TOP 1 @prev_created = H.created_at
FROM np_reset_history H WITH(NOLOCK)
WHERE H.account = @Account AND H.character = @Name
ORDER BY H.id DESC
;
SET @prev_elapsed = ISNULL(DATEDIFF(minute, @prev_created, GETDATE()), 1000);
SET @ResetWek = IIF(@prev_elapsed > 60, 0, 1000);

SELECT @Reset AS Reset,@ResetDay AS ResetDay,@ResetWek AS ResetWek,@ResetMon AS ResetMon

SET NOCOUNT OFF
SET XACT_ABORT OFF

END