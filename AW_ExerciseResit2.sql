SELECT Name AS ProductName, SalesOrderDetail.OrderQty FROM ProductAW 
JOIN SalesOrderDetail ON (ProductAW.ProductID = SalesOrderDetail.ProductID) 
JOIN SalesOrderHeader ON (SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID) 
JOIN CustomerAW ON (SalesOrderHeader.CustomerID = CustomerAW.CustomerID) 
WHERE CustomerAW.CompanyName = "Futuristic Bikes";
