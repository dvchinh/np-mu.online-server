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

	DECLARE @reset_max INT = 250
	DECLARE @reset_thresh INT = 25
	DECLARE @reset_thresh_time INT = 60
	DECLARE @reset_exceed_week INT = 1000
	DECLARE @reset_exceed_month INT = 10000
	;
	DECLARE @prev_created DATETIME = NULL
	DECLARE @prev_elapsed INT = NULL
	SELECT TOP 1 @prev_created = H.created_at FROM np_reset_history H WITH(NOLOCK) WHERE H.account = @Account AND H.character = @Name ORDER BY H.id DESC
	SET @prev_elapsed = ISNULL(DATEDIFF(minute, @prev_created, GETDATE()), 1000)
	;
	DECLARE @reset_day INT = 0
	DECLARE @reset_next INT = @Reset + 1
	SELECT @reset_day = COUNT(1) FROM np_reset_history H WITH(NOLOCK) WHERE H.account = @Account AND H.character = @Name AND CAST(H.created_at AS DATE) = CAST(GETDATE() AS DATE)
	DECLARE @reset_day_limit INT = CEILING((@reset_max - @reset_next) / CAST(@reset_thresh AS FLOAT)) + 1
	SET @reset_day_limit = IIF(@reset_day_limit < 1, 1, @reset_day_limit)
	;
	IF @prev_elapsed < @reset_thresh_time BEGIN
		SET @ResetWek = @reset_exceed_week
	END ELSE IF @reset_day >= @reset_day_limit BEGIN
		SET @ResetMon = @reset_exceed_month
	END ELSE BEGIN
		SET @ResetDay = @reset_day
	END
	;

	PRINT CONCAT('== prev-elapsed : ', @prev_elapsed, ', reset-day : ', @reset_day, ', reset-day-limit : ', @reset_day_limit)
	PRINT CONCAT('== reset-current : ', @Reset, ', reset-day : ', @ResetDay, ', reset-week : ', @ResetWek, ', reset-month : ', @ResetMon)
	SELECT @Reset AS Reset, @ResetDay AS ResetDay, @ResetWek AS ResetWek, @ResetMon AS ResetMon

	SET NOCOUNT OFF
	SET XACT_ABORT OFF
END