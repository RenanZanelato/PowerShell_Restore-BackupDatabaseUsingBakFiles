IF EXISTS 
   (
     SELECT name FROM master.dbo.sysdatabases 
    WHERE name = N'{0}'
    )
BEGIN
    USE master;
	ALTER DATABASE {0} SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE {0} ;
END