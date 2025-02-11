BULK INSERT dbo.Categories
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset\categories.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

BULK INSERT dbo.Customers
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset\customers.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

BULK INSERT dbo.Employees
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset\employees.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

BULK INSERT dbo.OrderDetails
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset\orders_details.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

BULK INSERT dbo.Orders
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset\orders.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

BULK INSERT dbo.Products
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset\products.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

BULK INSERT dbo.Shippers
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset\shippers.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

