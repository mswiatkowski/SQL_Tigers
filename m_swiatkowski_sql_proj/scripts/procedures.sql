
-- procedura kopiuj�ca dane z jednej tabeli do drugiej i przy tym usuwaj�ca nulle z danej tabeli
CREATE PROCEDURE CopyTable
    @SourceTable NVARCHAR(255),  -- Tabela �r�d�owa
    @TargetTable NVARCHAR(255),  -- Tabela docelowa
	@ColumnToClean NVARCHAR(255) -- Kolumna z kt�rej usuwamy nulle
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

-- �ci�gawka do u�ycia
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






-- procedura usuwaj�ca kolumn� shipregion z stg.Orders, poniewa� ta kolumna jest pe�na nulli
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

-- �ci�gawka do u�ycia
EXEC RemoveShipregion;
GO

SELECT * FROM trg.OrdersNoShipregion;