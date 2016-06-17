SELECT CompanyName FROM CustomerAW 
JOIN SalesOrderHeader ON (CustomerAW.CustomerID = SalesOrderHeader.CustomerID) 
WHERE (SalesOrderHeader.SubTotal + SalesOrderHeader.TaxAmt + SalesOrderHeader.Freight) > 100000;