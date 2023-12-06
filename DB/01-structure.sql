-- #:
CREATE TABLE [MuOnline].[dbo].[np_reset_history] (
	id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	account VARCHAR(10) NULL,
	character VARCHAR(10) NULL,
	reset INT NULL,
	created_at DATETIME NULL DEFAULT GETDATE(),
	created_by INT NULL DEFAULT 0,
	updated_at DATETIME NULL,
	updated_by INT NULL,
);
-- #: