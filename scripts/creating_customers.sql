CREATE TABLE stg.Customers (
	customerid NVARCHAR(5) NOT NULL UNIQUE,
    companyname NVARCHAR(40),
    contactname NVARCHAR(30),
    contacttitle NVARCHAR(30),
    city NVARCHAR(50),
    region NVARCHAR(15) NULL,
    postalcode NVARCHAR(10),
    country NVARCHAR(15),
    phone NVARCHAR(24),
    fax NVARCHAR(24) NULL,
	CONSTRAINT PK_Customers PRIMARY KEY (customerid)
);

BULK INSERT stg.Customers
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset_pipe\customers.csv'
WITH (
  FIELDTERMINATOR = '|',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);





EXEC LoadToTableWithNullCheck
	'stg.Customers',     -- Tabela Ÿród³owa
    'trg.Customers',     -- Tabela docelowa (nie mo¿e istnieæ)
    'fax';
GO


SELECT COUNT(*) FROM stg.Customers
SELECT COUNT(*) FROM trg.Customers

SELECT * FROM stg.Customers
SELECT * FROM trg.Customers