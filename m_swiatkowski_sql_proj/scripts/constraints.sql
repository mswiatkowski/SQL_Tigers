-- ### CONSTRAINTS


-- konstrainty na klucze obce
ALTER TABLE stg.OrderDetails
	ADD CONSTRAINT FK_OrderDetails_TO_Orders
		FOREIGN KEY (orderid)
		REFERENCES stg.Orders (orderid)
GO

ALTER TABLE stg.OrderDetails
	ADD CONSTRAINT FK_OrderDetails_TO_Products
		FOREIGN KEY (productid)
		REFERENCES stg.Products (productid)
GO


-- konstrainty na klucze g³ówne
ALTER TABLE trg.Products
	ADD CONSTRAINT PK_Products_trg
		PRIMARY KEY (productid)
GO

ALTER TABLE trg.Orders
	ADD CONSTRAINT PK_Orders_trg
		PRIMARY KEY (orderid)
GO

ALTER TABLE trg.OrdersNoShipregion
	ADD CONSTRAINT PK_OrdersNoShipregion_trg
		PRIMARY KEY (orderid)
GO

ALTER TABLE trg.OrderDetails
	ADD CONSTRAINT FK_OrderDetails_TO_Orders
		FOREIGN KEY (orderid)
		REFERENCES trg.Orders (orderid)
GO

ALTER TABLE trg.OrderDetails
	ADD CONSTRAINT FK_OrderDetails_TO_OrdersNoShipRegion
		FOREIGN KEY (orderid)
		REFERENCES trg.OrdersNoShipregion (orderid)
GO

ALTER TABLE trg.OrderDetails
	ADD CONSTRAINT FK_OrderDetails_TO_Products
		FOREIGN KEY (productid)
		REFERENCES trg.Products (productid)
GO

