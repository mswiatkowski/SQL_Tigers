

CREATE TABLE stg.OrderDetails (
    orderid INT,
    productid INT,
    unitprice MONEY,
    quantity SMALLINT,
    discount REAL
);


BULK INSERT stg.OrderDetails
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\m_swiatkowski_sql_proj\data\order_details.csv'
WITH (
  FIELDTERMINATOR = '|',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);