BULK INSERT dbo.Categories
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset_pipe\categories.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

BULK INSERT dbo.Customers
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset_pipe\customers.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

BULK INSERT dbo.Employees
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset_pipe\employees.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

BULK INSERT dbo.OrderDetails
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset_pipe\orders_details.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

BULK INSERT dbo.Orders
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset_pipe\orders.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

BULK INSERT dbo.Products
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset_pipe\products.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

BULK INSERT dbo.Shippers
FROM 'C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset_pipe\shippers.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

