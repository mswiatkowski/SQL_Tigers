-- prosty widok pokazuj¹cy kraj dostawcy zamówienia
CREATE VIEW ViewShipCountry
AS
SELECT 
	ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS 'ID',
	shipname AS 'Dostawca', 
	shipcountry AS 'Kraj'
FROM trg.Orders;
GO

SELECT * FROM ViewShipCountry
ORDER BY Dostawca;

INSERT INTO trg.Orders 
(
	orderid, 
	customerid, 
	employeeid, 
	orderdate, 
	requireddate, 
	shippeddate, 
	shipvia, 
	freight, 
	shipname, 
	shipcity, 
	shipregion, 
	shippostalcode, 
	shipcountry
)
VALUES (1111, 'ALF', 4, '2025-02-14', '2025-02-24', '2025-02-20', 3, 44.44, 'Alonso Farbanelle', 'Rome', NULL, '123123', 'Italy');

-- widok pokazuje wynik z dodanym wierszem
SELECT * FROM ViewShipCountry
ORDER BY Dostawca;



-- widok z pivotem

-- podgl¹damy unikalne kraje
SELECT DISTINCT(Kraj) FROM ViewShipCountry;
GO

CREATE VIEW ViewShipnamePivot 
AS
SELECT * 
FROM (
		SELECT Kraj, Dostawca
		FROM ViewShipCountry
) AS SourceView
PIVOT (
    COUNT(Dostawca) 
    FOR Kraj IN (
		Finland,
		USA,
		Italy,
		Brazil,
		Germany,
		Switzerland,
		Mexico,
		Sweden,
		Argentina,
		Austria,
		UK,
		Poland,
		Canada,
		Ireland,
		Norway,
		France,
		Belgium,
		Spain,
		Venezuela,
		Denmark,
		Portugal)
) AS PivotTable;
GO

SELECT * FROM ViewShipnamePivot


