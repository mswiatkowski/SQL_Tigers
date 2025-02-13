
-- procedura kopiuj�ca dane z jednej tabeli do drugiej, ale usuwaj�ca wiersze null z konkretnej kolumny
CREATE PROCEDURE LoadToTableWithNullCheck
    @SourceTable NVARCHAR(255),  -- Tabela �r�d�owa
    @TargetTable NVARCHAR(255),  -- Tabela docelowa
    @ColumnToCheck NVARCHAR(255) -- Kolumna do sprawdzenia
AS
BEGIN

    DECLARE @SQL NVARCHAR(MAX); -- to jest zmienna kt�ra trzyma nasze zapytanie

    -- Tworzenie dynamicznego zapytania SQL
    SET @SQL = 
        N'SELECT * INTO ' + @TargetTable + N' 
        FROM ' + @SourceTable + N' 
        WHERE ' + @ColumnToCheck + N' IS NOT NULL;'
    -- Wykonanie dynamicznego SQL
    EXEC sp_executesql @SQL;
END;
GO
-- �ci�gawka do u�ycia
EXEC LoadToTableWithNullCheck
	'stg.Products',     -- Tabela �r�d�owa
    'trg.Products',     -- Tabela docelowa
    'UnitPrice';
GO






-- procedura usuwaj�ca kolumn� region z stg.Customers, poniewa� ta kolumna jest pe�na nulli
CREATE PROCEDURE RemoveRegion
AS
BEGIN
	SELECT
		customerid,
		companyname,
		contacttitle,
		city,
		postalcode,
		country,
		phone,
		fax
	INTO trg.CustomersNoRegion
	FROM stg.Customers;
END;
-- �ci�gawka do u�ycia
EXEC RemoveRegion;
GO

SELECT * FROM trg.CustomersNoRegion;