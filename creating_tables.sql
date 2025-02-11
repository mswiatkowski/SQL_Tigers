USE master;
GO

CREATE DATABASE Northwind;
GO

USE Northwind;
GO



CREATE TABLE Customers (
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

CREATE TABLE Orders (
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


CREATE TABLE Employees (
	employeeid INT NOT NULL UNIQUE,
    lastname NVARCHAR(20),
    firstname NVARCHAR(10),
    title NVARCHAR(30),
    titleofcourtesy NVARCHAR(25),
    birthdate NVARCHAR(20) NULL, -- by³ b³¹d przy imporcie jako date - nie potrafiê powiedzieæ dlaczego
    hiredate DATE,
    address NVARCHAR(70),
    city NVARCHAR(50),
    region NVARCHAR(15),
    postalcode NVARCHAR(10),
    country NVARCHAR(15),
    homephone NVARCHAR(24),
    notes NVARCHAR(MAX),
	CONSTRAINT PK_Employees PRIMARY KEY (employeeid)
);


CREATE TABLE OrderDetails (
    orderid INT,
    productid INT,
    unitprice MONEY,
    quantity SMALLINT,
    discount REAL
);


CREATE TABLE Products (
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

CREATE TABLE Shippers (
	shipperid INT NOT NULL UNIQUE,
    companyname NVARCHAR(40),
    phone NVARCHAR(24),
	CONSTRAINT PK_Shippers PRIMARY KEY (shipperid)
);

CREATE TABLE Categories (
	categoryid INT NOT NULL UNIQUE,
    categoryname NVARCHAR(15),
    description NVARCHAR(255),
	CONSTRAINT PK_Categories PRIMARY KEY (categoryid)
);







ALTER TABLE Orders
	ADD CONSTRAINT FK_Orders_TO_Employees
		FOREIGN KEY (employeeid)
		REFERENCES Employees (employeeid)
GO

ALTER TABLE Orders
	ADD CONSTRAINT FK_Orders_TO_Customers
		FOREIGN KEY (customerid)
		REFERENCES Customers (customerid)
GO

ALTER TABLE Products
	ADD CONSTRAINT FK_Products_TO_Categories
		FOREIGN KEY (categoryid)
		REFERENCES Categories (categoryid)
GO

ALTER TABLE OrderDetails
	ADD CONSTRAINT FK_OrderDetails_TO_Orders
		FOREIGN KEY (orderid)
		REFERENCES Orders (orderid)
GO

ALTER TABLE OrderDetails
	ADD CONSTRAINT FK_OrderDetails_TO_Products
		FOREIGN KEY (productid)
		REFERENCES Products (productid)
GO

ALTER TABLE Orders
	ADD CONSTRAINT FK_Orders_TO_Shippers
		FOREIGN KEY (shipvia)
		REFERENCES Shippers (shipperid)
GO