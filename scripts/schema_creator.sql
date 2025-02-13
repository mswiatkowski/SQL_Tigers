USE Northwind;
GO

CREATE SCHEMA stg;
GO
CREATE SCHEMA trg;
GO
CREATE SCHEMA v;
GO

SELECT name AS SchemaName
FROM sys.schemas;

