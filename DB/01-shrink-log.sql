-- [ error ] The transaction log for database is full due to 'LOG_BACKUP'

USE MuOnline;
GO
-- Truncate the log by changing the database recovery model to SIMPLE.
ALTER DATABASE MuOnline
SET RECOVERY SIMPLE;
GO
-- Shrink the truncated log file to 1 MB.
DBCC SHRINKFILE (MuOnline_log, 1);
GO
-- Reset the database recovery model.
ALTER DATABASE MuOnline
SET RECOVERY FULL;
GO