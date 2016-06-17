SELECT CompanyName, SUM(OrderQty) FROM ProductAW 
JOIN SalesOrderDetail ON (ProductAW.ProductID = SalesOrderDetail.ProductID) 
JOIN SalesOrderHeader ON (SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID) 
JOIN CustomerAW ON (SalesOrderHeader.CustomerID = CustomerAW.CustomerID) 
WHERE ProductAW.Name = "Racing Socks, L" AND CustomerAW.CompanyName = "Riding Cycles";