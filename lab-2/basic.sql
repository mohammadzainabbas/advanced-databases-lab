use Lab_2

SELECT name
from sys.tables

/*
--------------------------------------------------
To show all data in all tables in a database
--------------------------------------------------
*/

DECLARE @sqlText VARCHAR(MAX)
SET @sqlText = ''
SELECT @sqlText = @sqlText + 'select '''+QUOTENAME(name)+'''; SELECT * FROM ' + QUOTENAME(name) + CHAR(13) FROM sys.tables
EXEC(@sqlText)
