IF DB_ID('AdventureWorks') IS NULL
BEGIN
    RESTORE DATABASE AdventureWorks
    FROM DISK = '/backups/AdventureWorks2022.bak'
    WITH
        MOVE 'AdventureWorks2022'
            TO '/var/opt/mssql/data/AdventureWorks.mdf',
        MOVE 'AdventureWorks2022_log'
            TO '/var/opt/mssql/data/AdventureWorks_log.ldf',
        REPLACE;
END
GO
