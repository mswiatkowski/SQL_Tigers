DOKUMENTACJA

CEL PROJEKTU:
Celem projektu jest przetworzenie danych na temat produtków i zamówień na podstawie bazy danych Northwind.

PLIKI:
Projekt zawiera następujące pliki (w folderze scripts/):
- constraints.sql - zawiera zdefiniowane konstrainty, przede wszystkim klucze główne dla tabel trg oraz klucze obce (WAŻNE! Należy uruchamiać konstrainty z kluczami obcymi DOPIERO PO utworzeniu wszystkich tabel)
- creating_order_details.sql - tworzy tabelę stg.OrderDetails i wypełnia ją danymi (bulk load)
- creating_products.sql - tworzy tabelę stg.Products i wypełnia ją danymi (bulk load)
- creating_orders.sql - tworzy tabelę stg.Orders i wypełnia ją danymi (bulk load)
- diagnostyka.sql - zawiera widoki i zapytania diagnostyczne wymienione na slajdzie z wymaganiami projektowymi
- procedures.sql - zawiera zdefiniowane procedury, które pozwalają utworzyć tabele trg
- schema_creator.sql - tworzy schematy stg i trg
- drop_n_create.sql - resetuje bazę i tworzy ją od początku
- views.sql - zawiera zdefiniowane widoki (niektóre widoki są w diagnostyce)

DIAGRAM:
plik diagram.png zawiera schemat tabel stg i trg.


