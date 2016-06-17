SELECT CityName, ProductCategory.Name FROM 
(SELECT City AS CityName, SUM(SalesOrderHeader.SalesOrderID) AS TotalOrders, SalesOrderDetail.ProductID FROM Address 
  JOIN SalesOrderHeader ON (Address.AddressID = SalesOrderHeader.ShipToAddressID) 
  JOIN SalesOrderDetail ON (SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID) 
  GROUP BY CityName ORDER BY TotalOrders DESC LIMIT 3) T1 
INNER JOIN ProductAW ON (T1.ProductID = ProductAW.ProductID) 
JOIN ProductCategory ON (ProductAW.ProductCategoryID = ProductCategory.ProductCategoryID);


