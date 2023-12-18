--# [castle]
	-- origin: { siege-start-date: '2023-08-26 09:37:09.597', siege-end-date: '2023-09-02 09:37:09.597' }
	SELECT TOP 10 * FROM MuCastle_DATA WITH(NOLOCK);
	UPDATE MuCastle_DATA SET
		SIEGE_START_DATE = DATEADD(day, DATEDIFF(day, SIEGE_START_DATE, GETDATE()), SIEGE_START_DATE),
		SIEGE_END_DATE = DATEADD(day, DATEDIFF(day, SIEGE_END_DATE, DATEADD(day, 7, GETDATE())), SIEGE_END_DATE)
	;

--# [character]
	SELECT TOP 1000 C.AccountID, C.Name, C.Class, C.ResetCount, C.Clevel, C.LevelUpPoint, C.Money, C.RuudMoney, C.PkLevel, C.PKcount
	SELECT TOP 100 C.*
	FROM Character C WITH(NOLOCK)
	WHERE 1 = 1
		AND C.Name = 'Bing'
	ORDER BY C.ResetCount DESC;
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME LIKE '%online%';
	SELECT TOP 1000 * FROM MEMB_STAT
	UPDATE MEMB_STAT SET ConnectStat = 0 WHERE memb___id = 'atamd'

--# [account]
	SELECT memb___id, memb__pwd, * FROM MEMB_INFO WHERE memb___id = 'loukoala';
	SELECT * FROM BanMacInfo WHERE HardwareId = ?

--# [reset.history]
	SELECT TOP 100 H.*
	FROM np_reset_history H WITH(NOLOCK)
	WHERE H.character IN ('Kundunhehe')
	ORDER BY H.id DESC;

	;WITH cte AS (
		SELECT H.account, H.character
			, COUNT(1) total
			, MIN(H.created_at) AS created_min
			, MAX(H.created_at) AS created_max
		FROM np_reset_history H WITH(NOLOCK)
		WHERE CAST(H.created_at AS DATE) = '2023-12-16'
		GROUP BY H.account, H.character)
	SELECT H.*, C.ResetCount
	FROM cte H
		INNER JOIN Character C WITH(NOLOCK) ON C.AccountID = H.account AND C.Name = H.character
	ORDER BY H.total DESC, C.ResetCount DESC;

	EXEC [dbo].[WZ_GetResetInfo] @Account = '1111', @Name = 'LouLx3';

--#
	SELECT @@VERSION AS version;

--#
	USE MuOnline;
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME IN ('Character') AND COLUMN_NAME LIKE '%app%';
