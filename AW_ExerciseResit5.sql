SELECT CompanyName, Address.CountyRegion FROM CustomerAW AS CA 
JOIN CustomerAddress AS CAd ON (CA.CustomerID = CAd.CustomerID) 
JOIN Address ON (CAd.AddressID = Address.AddressID) 
JOIN SalesOrderHeader ON (CA.CustomerID = SalesOrderHeader.CustomerID) 
GROUP BY Address.CountyRegion;