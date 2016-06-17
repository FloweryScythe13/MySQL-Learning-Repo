SELECT SUM(OrderQty) FROM SalesOrderDetail 
LEFT JOIN SalesOrderHeader ON (SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID) 
LEFT JOIN Address ON (SalesOrderHeader.ShipToAddressID = Address.AddressID) 
RIGHT JOIN ProductAW ON (SalesOrderDetail.ProductID = ProductAW.ProductID) 
RIGHT JOIN ProductCategory ON (ProductAW.ProductCategoryID = ProductCategory.ProductCategoryID) 
WHERE ProductCategory.Name = "Cranksets" AND Address.City = "London";