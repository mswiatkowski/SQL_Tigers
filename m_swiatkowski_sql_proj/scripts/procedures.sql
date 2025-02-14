
-- procedura kopiuj¹ca dane z jednej tabeli do drugiej i przy tym usuwaj¹ca nulle z danej tabeli
CREATE PROCEDURE CopyTable
    @SourceTable NVARCHAR(255),  -- Tabela Ÿród³owa
    @TargetTable NVARCHAR(255),  -- Tabela docelowa
	@ColumnToClean NVARCHAR(255) -- Kolumna z której usuwamy nulle
AS
BEGIN

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL = 
        N'SELECT * INTO ' + @TargetTable + N' 
        FROM ' + @SourceTable + N'
		WHERE ' + @ColumnToClean + ' IS NOT NULL'
    EXEC sp_executesql @SQL;
END;
GO

-- œci¹gawka do u¿ycia
EXEC CopyTable
	'stg.Products',
    'trg.Products',
	'stg.Products.productid';
GO

EXEC CopyTable
	'stg.Orders',
    'trg.Orders',
	'stg.Orders.orderid';
GO

EXEC CopyTable
	'stg.OrderDetails',
    'trg.OrderDetails',
	'stg.OrderDetails.orderid';
GO






-- procedura usuwaj¹ca kolumnê shipregion z stg.Orders, poniewa¿ ta kolumna jest pe³na nulli
CREATE PROCEDURE RemoveShipregion
AS
BEGIN
	SELECT
		orderid,
		customerid,
		employeeid,
		requireddate,
		shippeddate,
		shipvia,
		freight,
		shipname,
		shipcity,
		shippostalcode,
		shipcountry
	INTO trg.OrdersNoShipregion
	FROM stg.Orders;
END;

-- œci¹gawka do u¿ycia
EXEC RemoveShipregion;
GO

SELECT * FROM trg.OrdersNoShipregion;