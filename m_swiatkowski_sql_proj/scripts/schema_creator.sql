USE Northwind;
GO

CREATE SCHEMA stg;
GO
CREATE SCHEMA trg;
GO

SELECT name AS SchemaName
FROM sys.schemas;

