--# [castle]
	-- origin: { siege-start-date: '2023-08-26 09:37:09.597', siege-end-date: '2023-09-02 09:37:09.597' }
	SELECT TOP 10 * FROM MuCastle_DATA WITH(NOLOCK);
	UPDATE MuCastle_DATA SET
		SIEGE_START_DATE = DATEADD(day, DATEDIFF(day, SIEGE_START_DATE, GETDATE()), SIEGE_START_DATE),
		SIEGE_END_DATE = DATEADD(day, DATEDIFF(day, SIEGE_END_DATE, DATEADD(day, 7, GETDATE())), SIEGE_END_DATE)
	;

--# [character]
	SELECT Name, Clevel, Money, LevelUpPoint, Class, PkLevel,PKcount FROM Character WHERE Name = 'LouLx';

--# [account]
	SELECT memb___id, memb__pwd, * FROM MEMB_INFO WHERE memb___id = 'loukoala';
	SELECT * FROM BanMacInfo WHERE HardwareId = ?
