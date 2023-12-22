--# [disconnect], error: "The character <name> is online"
	EXEC [dbo].[WZ_DISCONNECT_MEMB] @memb___id = 'atamd', @ServerName = NULL, @IP = NULL, @HarwareID = NULL
	;

--# [castle.schedule]
	UPDATE MuCastle_DATA SET
		SIEGE_START_DATE = DATEADD(day, DATEDIFF(day, SIEGE_START_DATE, GETDATE()), SIEGE_START_DATE),
		SIEGE_END_DATE = DATEADD(day, DATEDIFF(day, SIEGE_END_DATE, DATEADD(day, 7, GETDATE())), SIEGE_END_DATE)
	;

--# [reset.increase]
	DECLARE @account VARCHAR(10), @character VARCHAR(10), @reset INT, @point INT
	DECLARE cursor1 CURSOR FOR
		SELECT TOP 100 C.AccountID, C.Name, C.ResetCount, C.LevelUpPoint
		FROM Character C WITH(NOLOCK)
		WHERE C.Name IN ('LouLx3', '(z)Galleon', '(z)Bing', '(z)Darkrai')
	OPEN cursor1
	FETCH NEXT FROM cursor1 INTO @account, @character, @reset, @point
	WHILE @@FETCH_STATUS = 0 BEGIN
		PRINT CONCAT('-- account = ', @account, ', character = ', @character, ', resets = ', @reset, ', points = ', @point)
		DECLARE @r_increase INT = 0
		IF @character = 'Galleon' BEGIN
			SET @r_increase = 4
		END
		IF @character IN ('LouLx3', 'Bing', 'Darkrai') BEGIN
			SET @r_increase = 1
		END
		SET @reset = @reset + @r_increase
		SET @point = @point + (@r_increase * 500)
		PRINT CONCAT('   > [ new ] resets = ', @reset, ', points = ', @point)

		UPDATE TOP(1) Character SET
		ResetCount = @reset, LevelUpPoint = @point
		WHERE AccountID = @account AND Name = @character

		FETCH NEXT FROM cursor1 INTO @account, @character, @reset, @point
	END
	CLOSE cursor1
	DEALLOCATE cursor1
	;
