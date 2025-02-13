
-- procedura kopiuj¹ca dane z jednej tabeli do drugiej, ale usuwaj¹ca wiersze null z konkretnej kolumny
CREATE PROCEDURE LoadToTableWithNullCheck
    @SourceTable NVARCHAR(255),  -- Tabela Ÿród³owa
    @TargetTable NVARCHAR(255),  -- Tabela docelowa
    @ColumnToCheck NVARCHAR(255) -- Kolumna do sprawdzenia
AS
BEGIN

    DECLARE @SQL NVARCHAR(MAX); -- to jest zmienna która trzyma nasze zapytanie

    -- Tworzenie dynamicznego zapytania SQL
    SET @SQL = 
        N'SELECT * INTO ' + @TargetTable + N' 
        FROM ' + @SourceTable + N' 
        WHERE ' + @ColumnToCheck + N' IS NOT NULL;'
    -- Wykonanie dynamicznego SQL
    EXEC sp_executesql @SQL;
END;
GO
-- œci¹gawka do u¿ycia
EXEC LoadToTableWithNullCheck
	'stg.Products',     -- Tabela Ÿród³owa
    'trg.Products',     -- Tabela docelowa
    'UnitPrice';
GO






-- procedura usuwaj¹ca kolumnê region z stg.Customers, poniewa¿ ta kolumna jest pe³na nulli
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
-- œci¹gawka do u¿ycia
EXEC RemoveRegion;
GO

SELECT * FROM trg.CustomersNoRegion;