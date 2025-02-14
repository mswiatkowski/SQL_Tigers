

CREATE TABLE stg.Orders (
	orderid INT NOT NULL UNIQUE,
    customerid NVARCHAR(5),
    employeeid INT,
    orderdate DATE,
    requireddate DATE,
    shippeddate DATE,
    shipvia INT,
    freight DECIMAL(10, 2),
    shipname NVARCHAR(40),
    shipcity NVARCHAR(50),
    shipregion NVARCHAR(15) NULL,
    shippostalcode NVARCHAR(10),
    shipcountry NVARCHAR(15),
	CONSTRAINT PK_Orders PRIMARY KEY (orderid)
);


BULK INSERT stg.Orders
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\m_swiatkowski_sql_proj\data\orders.csv'
WITH (
  FIELDTERMINATOR = '|',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);
