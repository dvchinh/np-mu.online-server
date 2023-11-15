--# [SS18.2.2] sta
	> origin: {
		source: https://loukoala.blogspot.com/2023/08/client-mu-online-ss1822viet.html
		install: https://www.youtube.com/watch?v=2rJBxqDVDYo
		download.client: https://uongbihighschool-my.sharepoint.com/:u:/g/personal/loulxgame_ubhs_edu_vn/EQ0dLPek71JLmYIFnDiQZ5QBguIedMPCtgU2p9U7lNCJqg?download=1
		download.update: https://uongbihighschool-my.sharepoint.com/personal/loulxgame_ubhs_edu_vn/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Floulxgame%5Fubhs%5Fedu%5Fvn%2FDocuments%2FGame%2FGame%20Client%2F%21Mu%20Online%2FMu%20SS18%2E2%2E2%2FMUDevs%5FS18%2E2%2D2%5FUpdate%5F1%2Erar&parent=%2Fpersonal%2Floulxgame%5Fubhs%5Fedu%5Fvn%2FDocuments%2FGame%2FGame%20Client%2F%21Mu%20Online%2FMu%20SS18%2E2%2E2&ga=1
		unzip.password: loulxgame
	}
	> publish: {
		ip: ['muss1.hopto.org', '27.70.237.186', '192.168.1.234']
		ports: [
			44405 | [port.forwarding: TCP], [2] Connect
			55901 | [port.forwarding: TCP, UDP]
			55960 | [3] Data
			55981 | [4] ExData
			55970, 55557, 55906, 55533 | [5] Join
		]
		ports-v1: [44406(-), 55901(+), 55903(-), 55962(-), 55960(+), 55998(-), 55906(-), 55970(+), 55557(+), 55999(-), 55919(+), 55905(-), 60220(-)]
		ports-v2: [55919, 55901, 55980(n), 55906, 55960, 55970, 44405(n), 55557, 55981(n) ]
	}
	> accounts: [
		{ username: 'loukoala', password: '123456' }
	]
	> files.mod: [
		{1} $server\ChatServer\ChatServer.ini | 55980, 55906, 55960, 55970
		{2} $server\ConnectServer\ConnectServer.ini | 55919, 55901, 44405, 55557 (UDP), 55970
		{3} $server\DataServer\DataServer.ini | 55960
		{4} $server\EXDataServer\EXDataServer.ini | 55981
		{5} $server\JoinServer\JoinServer.ini | 55970, 55557
		{6} $server\GameServer\
		{7} $server\GameServerCS\
		$server\ConnectServer\ServerList.dat | ip
		$server\[Tool] Mu Editor\MuEditor.ini | ip
	]
	> translate: [
		$client\Data\Lang.mpr
			$lang\Eng\CharacterInfoSetup.txt
			$lang\Eng\Text(kor).txt
		$client\Data\Local\Eng\item.bmd
		$client\Data\Local\Eng\ItemToolTip.bmd
		$client\Data\Local\Eng\itemtooltiptext.bmd
		{?} $client\Data\Local\serverlist.bmd
	]
	> errors: [
		{translate} character > Cơ bản > Bang hội: "Chưa gia nhập"
	]
	> commands: [
		{cmd} ping muss1.hopto.org
		{cmd} New-Object System.Net.Sockets.TcpClient("muss1.hopto.org", 55901)
	]
--# [SS18.2.2] end

--# [SS2.v1.02h] sta
	> origin: {
		source: https://www.youtube.com/watch?v=FrtZheJPZxc
		download: https://drive.google.com/drive/folders/1FdJOrAqko6sIjKDukMN4HapC6VDx6pBB
		author.phone: 0918.678.799
		author.website: giadinhmu.forumvi.com
		author.client: http://www.mediafire.com/folder/qr5x6pndl78ww/tong_hop_muoffline
	}
	> publish: {
		ip: '192.168.1.87'
		ports: [ 80*, 44405*, 55557, 55901*, 55960 ]
	}
	> accounts: [
		{ username: '19910804', password: '123456789' }
		{ username: '0362357249', password: '123456' }
		{ username: '123456', password: '123456' }
	]
	-. [customization]
		> [client] https://drive.google.com/drive/folders/1tTOLC3f58AgWo_jPlOnmsdk79cOoEHz5

	> cons: map -> Dungeon (404)
	> cons: map -> Arena (level 230)
	-. $server\ConnectServer\Data\BoR_ServerList.dat | port: 55901, ip: '192.168.1.87'
	-. $server\ConnectServer\Data\BoR_Config.ini | port: 44405, 55557
	-. $server\Data\MapServerInfo.dat | port: 55901
	-. $server\Data\DataServer.ini | port: 55960
	-. $client\Data\Local\NPCName(Vie).txt | translate
	-. $web\index.php | [entry]
	-. $web\includes\character_manager.php | [character]
	-. $web\includes\links_list.php | [download]
	-. $web\includes\quangcaophu.txt | [donate]
--# [SS2.v1.02h] end

--# [SS1.v0.97] sta
	> origin: {
		source: https://www.youtube.com/watch?v=e6xXGnMquhs
		download: https://drive.google.com/drive/folders/18maIXQG0DixIPPRER_oCnDyU8xw_m1Dl
		unzip.password: pgaming
	}

	> cons: {uncheck} System Properties > Advanced > Performance > Visual Effects > "Smooth edges of screen fonts"
	> cons: "main.exe" is often broken.
--# [SS1.v0.97] end
