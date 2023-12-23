--# [character]
	SELECT TOP 100 C.AccountID, C.Name, C.Class, C.ResetCount, C.Clevel, C.LevelUpPoint, C.Money, C.RuudMoney, C.PkLevel, C.PKcount
		, MT3.MasterLevel, MT3.MasterPoint, MT3.MasterSkill, MT4.EnhancePoint, MT4.EnhanceSkill, MT4.EnhanceSkillPassive
	FROM Character C WITH(NOLOCK)
		LEFT JOIN MasterSkillTree MT3 WITH(NOLOCK) ON MT3.Name = C.Name
		LEFT JOIN EnhanceSkillTree MT4 WITH(NOLOCK) ON MT4.Name = C.Name
	WHERE 1 = 1
		AND C.Name IN ('LouLx3', 'Nephthys')
	ORDER BY C.ResetCount DESC
	;
	SELECT TOP 1000 * FROM MEMB_STAT
	;

--# [account]
	SELECT memb___id, memb__pwd, * FROM MEMB_INFO WHERE memb___id = 'loukoala'
	;
	SELECT * FROM BanMacInfo WHERE HardwareId = ?
	;

--# [reset.history]
	SELECT TOP 100 H.*
	FROM np_reset_history H WITH(NOLOCK)
	WHERE H.character IN ('Kundunhehe')
	ORDER BY H.id DESC
	;
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
	ORDER BY H.total DESC, C.ResetCount DESC
	;
	EXEC [dbo].[WZ_GetResetInfo] @Account = '1111', @Name = 'LouLx3'
	;

--# [castle]
	SELECT TOP 10 * FROM MuCastle_DATA WITH(NOLOCK)
	;

--#
	SELECT @@VERSION AS version
	;
	USE MuOnline
	;
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME IN ('EnhanceSkillTree') AND COLUMN_NAME LIKE '%skill%'
	;
