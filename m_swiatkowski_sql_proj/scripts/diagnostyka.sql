-- ## DIAGNOSTYKA

-- ###########################################################################################
-- ###########################################################################################
-- ###########################################################################################
-- LICZBA REKORD�W
CREATE VIEW NumOfRecords
AS
SELECT 
    'Orders' AS TableName,
    COUNT(*) AS RecordCount
FROM stg.Orders
UNION ALL
SELECT 
    'OrderDetails' AS TableName,
    COUNT(*) AS RecordCount
FROM stg.OrderDetails
UNION ALL
SELECT 
    'Products' AS TableName,
    COUNT(*) AS RecordCount
FROM stg.Products;
GO

SELECT * FROM NumOfRecords


-- ###########################################################################################
-- ###########################################################################################
-- ###########################################################################################
-- UNIKALNO�� REKORD�W

-- unikalno�� stg.Orders
IF EXISTS (
	SELECT 
		orderid,
		COUNT(*)
	FROM stg.Orders
	GROUP BY orderid
	HAVING COUNT(*) > 1
)
BEGIN
	SELECT 
		orderid,
		COUNT(*) AS 'Liczba nieunikalnych kluczy'
	FROM stg.Orders
	GROUP BY orderid
	HAVING COUNT(*) > 1
END
ELSE
BEGIN
    SELECT 'Wszystkie klucze s� unikalne' AS Message;
END
GO

-- unikalno�� stg.Products
IF EXISTS (
	SELECT 
		productid,
		COUNT(*)
	FROM stg.Products
	GROUP BY productid
	HAVING COUNT(*) > 1
)
BEGIN
SELECT 
		productid,
		COUNT(*) AS 'Liczba nieunikalnych kluczy'
	FROM stg.Products
	GROUP BY productid
	HAVING COUNT(*) > 1
END
ELSE
BEGIN
    SELECT 'Wszystkie klucze s� unikalne' AS Message;
END
GO


-- ###########################################################################################
-- ###########################################################################################
-- ###########################################################################################
-- DUPLIKATY

-- duplikaty w tabeli stg.Products
IF EXISTS (
    SELECT
        productid,
        COUNT(*) AS 'Liczba duplikat�w'
    FROM stg.Products
    GROUP BY productid
    HAVING COUNT(*) > 1
)
BEGIN
    SELECT 
        productid,
        COUNT(*) AS 'Liczba duplikat�w'
    FROM stg.Products
    GROUP BY productid
    HAVING COUNT(*) > 1;
END
ELSE
BEGIN
    SELECT 'Nie znaleziono duplikat�w w tabeli stg.Products' AS Message;
END
GO

-- duplikaty w tabeli stg.Orders
IF EXISTS (
    SELECT
		orderid,
        COUNT(*) AS 'Liczba duplikat�w'
    FROM stg.Orders
    GROUP BY orderid
    HAVING COUNT(*) > 1
)
BEGIN
    SELECT 
        orderid,
        COUNT(*) AS 'Liczba duplikat�w'
    FROM stg.Orders
    GROUP BY orderid
    HAVING COUNT(*) > 1;
END
ELSE
BEGIN
    SELECT 'Nie znaleziono duplikat�w w tabeli stg.Orders' AS Message;
END
GO

-- duplikaty w tabeli stg.OrderDetails
IF EXISTS (
    SELECT
		orderid,
        productid,
        COUNT(*) AS 'Liczba duplikat�w'
    FROM stg.OrderDetails
    GROUP BY orderid, productid
    HAVING COUNT(*) > 1
)
BEGIN
    SELECT 
        orderid,
        productid,
        COUNT(*) AS 'Liczba duplikat�w'
    FROM stg.OrderDetails
    GROUP BY orderid, productid
    HAVING COUNT(*) > 1;
END
ELSE
BEGIN
    SELECT 'Nie znaleziono duplikat�w w tabeli stg.OrderDetails' AS Message;
END
GO


-- ###########################################################################################
-- ###########################################################################################
-- ###########################################################################################
-- CI�G�O�� NUMERACJI

-- dla stg.Products
WITH IDGaps AS (
    SELECT 
        productid,
        LEAD(productid, 1) OVER (ORDER BY productid) - productid AS gap
    FROM stg.Products
)
SELECT 
    productid,
    gap
FROM IDGaps
WHERE gap > 1
GO

-- dla stg.Orders
WITH IDGaps AS (
    SELECT 
        orderid,
        LEAD(orderid, 1) OVER (ORDER BY orderid) - orderid AS gap
    FROM stg.Orders
)
SELECT 
    orderid,
    gap
FROM IDGaps
WHERE gap > 1
GO


-- ###########################################################################################
-- ###########################################################################################
-- ###########################################################################################
-- GRUPOWANIE
-- widok grupuje dane z trzech tabel trg i zwraca nazw� produktu oraz to ile sumarycznie pieni�dzy zarobiono sprzedaj�c go
CREATE VIEW ViewProductSalesSummary
AS
SELECT 
    p.productname,
    SUM(od.quantity * od.unitprice) AS 'Sprzeda� sumaryczna'
FROM trg.Orders AS o
JOIN trg.OrderDetails AS od ON o.orderid = od.orderid
JOIN trg.Products AS p ON od.productid = p.productid
GROUP BY p.productname;
GO


SELECT * FROM ViewProductSalesSummary