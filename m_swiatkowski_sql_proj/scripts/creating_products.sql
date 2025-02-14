

CREATE TABLE stg.Products (
	productid INT NOT NULL UNIQUE,
    productname NVARCHAR(40),
    supplierid INT,
    categoryid INT,
    quantityperunit NVARCHAR(25),
    unitprice DECIMAL(10, 2),
    unitsinstock INT,
    unitsonorder INT,
    reorderlevel INT,
    discontinued BIT,
	CONSTRAINT PK_Products PRIMARY KEY (productid)
);


BULK INSERT stg.Products
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\m_swiatkowski_sql_proj\data\products.csv'
WITH (
  FIELDTERMINATOR = '|',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);
