USE master;
GO

CREATE DATABASE Northwind;
GO

USE Northwind;
GO



CREATE TABLE Customers (
	customerid NCHAR(5) NOT NULL UNIQUE,
	companyname NVARCHAR(40),
	contactname NVARCHAR(30),
	contacttitle NVARCHAR(30),
	City NVARCHAR(15),
	region NVARCHAR(15),
	postalcode NVARCHAR(10),
	country NVARCHAR(15),
	phone NVARCHAR(24),
	fax NVARCHAR(24),
	CONSTRAINT PK_Customers PRIMARY KEY (customerid)
);

CREATE TABLE Orders (
    orderid NCHAR(5) NOT NULL UNIQUE,
    customerid NCHAR(5) NOT NULL,
    employeeid NCHAR(5) NOT NULL,
    orderdate DATE,
    requireddate DATE,
    shippeddate DATE,
    shipvia NCHAR(5),
    freight REAL,
    shipname NVARCHAR(40),
    shipcity NVARCHAR(15),
    shipregion NVARCHAR(15),
    shippostalcode NVARCHAR(10),
    shipcountry NVARCHAR(15),
	CONSTRAINT PK_Orders PRIMARY KEY (orderid)
);


CREATE TABLE Employees (
    employeeid NCHAR(5) NOT NULL UNIQUE,
    lastname NVARCHAR(20),
    firstname NVARCHAR(10),
    title NVARCHAR(30),
    titleofcourtesy NVARCHAR(25),
    birthdate DATE,
    hiredate DATE,
    address NVARCHAR(70),
    city NVARCHAR(15),
    region NVARCHAR(15),
    postalcode NVARCHAR(10),
    country NVARCHAR(15),
    homephone NVARCHAR(24),
    extension NVARCHAR(4),
    photo VARBINARY(MAX),
    notes NVARCHAR(MAX),
    reportsto INT,
    photopath NVARCHAR(255),
	CONSTRAINT PK_Employees PRIMARY KEY (employeeid)
);


CREATE TABLE OrderDetails (
    orderid NCHAR(5) NOT NULL,
    productid NCHAR(5) NOT NULL,
    unitprice MONEY,
    quantity SMALLINT,
    discount REAL
);


CREATE TABLE Products (
    productid NCHAR(5) NOT NULL UNIQUE,
    productname NVARCHAR(50) NOT NULL,
    supplierid NCHAR(5) NOT NULL,
    categoryid NCHAR(5) NOT NULL,
    quantityperunit NVARCHAR(20),
    unitprice MONEY,
    unitsinstock INT,
    unitsonorder INT,
    reorderlevel INT,
    discontinued BIT,
	CONSTRAINT PK_Products PRIMARY KEY (productid)
);

CREATE TABLE Shippers (
	shipperid NCHAR(5) NOT NULL UNIQUE,
	companyname NVARCHAR(40),
	phone NVARCHAR (24),
	CONSTRAINT PK_Shippers PRIMARY KEY (shipperid)
);

CREATE TABLE Categories (
	categoryid NCHAR(5) NOT NULL UNIQUE,
	categoryname NVARCHAR(50),
	description NTEXT,
	picture NVARCHAR(255),
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