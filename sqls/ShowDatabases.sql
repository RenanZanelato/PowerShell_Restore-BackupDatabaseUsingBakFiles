USE master;
SELECT 
		[name]
	FROM sys.databases 
	where 
		[name] not in('master','tempdb','model','msdb')