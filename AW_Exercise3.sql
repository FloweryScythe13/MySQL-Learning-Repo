SELECT ListPrice, SUM(SalesOrderDetail.OrderQty) FROM ProductAW 
JOIN SalesOrderDetail ON (ProductAW.ProductID = SalesOrderDetail.ProductID) 
WHERE ListPrice > 1000;