-- prosty widok
CREATE VIEW ViewCompanyCountry
AS
SELECT 
	ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS 'ID',
	companyname AS 'Firma', 
	country AS 'Kraj'
FROM trg.CustomersNoRegion;
GO

SELECT * FROM ViewCompanyCountry
ORDER BY Firma;

INSERT INTO trg.CustomersNoRegion (customerid, companyname, contacttitle, city, postalcode, country, phone, fax)
VALUES ('ALFF', 'Alfonso Z.O.O', 'Owner', '£om¿a', '18-400', 'Podlasie', '0-700', 'blablabla-007');

-- widok z pivotem

-- podgl¹damy unikalne kraje
SELECT DISTINCT(Kraj) FROM ViewCompanyCountry;
GO

CREATE VIEW ViewCompanyPivot 
AS
SELECT * 
FROM (
		SELECT Kraj, Firma
		FROM ViewCompanyCountry
) AS SourceView
PIVOT (
    COUNT(Firma) 
    FOR Kraj IN (
		Argentina,
		Austria,
		Belgium,
		Brazil,
		Canada,
		Denmark,
		Finland,
		France,
		Germany,
		Ireland,
		Italy,
		Mexico,
		Norway,
		Podlasie,
		Poland,
		Portugal,
		Spain,
		Sweden,
		Switzerland,
		UK,
		USA,
		Venezuela)
) AS PivotTable;
GO

SELECT * FROM ViewCompanyPivot

-- widok z joinem
-- TODO
