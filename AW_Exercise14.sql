SELECT "0-99" AS DollaRange, COUNT(SalesOrderID) AS Num_Orders, SUM(SubTotal) AS TotalValue FROM SalesOrderHeader WHERE SubTotal > 0 AND SubTotal < 100
UNION
SELECT "100-999" AS DollaRange, COUNT(SalesOrderID) AS Num_Orders, SUM(SubTotal) AS TotalValue FROM SalesOrderHeader WHERE SubTotal >= 100 AND SubTotal < 1000
UNION
SELECT "1000-9999" AS DollaRange, COUNT(SalesOrderID) AS Num_Orders, SUM(SubTotal) AS TotalValue FROM SalesOrderHeader WHERE SubTotal >= 1000 AND SubTotal < 10000
UNION
SELECT "100-999" AS DollaRange, COUNT(SalesOrderID) AS Num_Orders, SUM(SubTotal) AS TotalValue FROM SalesOrderHeader WHERE SubTotal >= 10000;




