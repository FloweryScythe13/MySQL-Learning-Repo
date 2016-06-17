SELECT SalesOrderID, CustomerAW.CompanyName FROM SalesOrderHeader 
JOIN CustomerAW ON (SalesOrderHeader.CustomerID = CustomerAW.CustomerID) 
WHERE CustomerAW.CompanyName = "Bike World" OR CustomerAW.CompanyName = "Good Toys";

