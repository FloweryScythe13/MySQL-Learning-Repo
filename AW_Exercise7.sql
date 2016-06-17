SELECT ProductAW.Name, CustomerAW.CompanyName FROM ProductAW 
LEFT JOIN ProductModel ON (ProductAW.ProductModelID = ProductModel.ProductModelID) 
RIGHT JOIN SalesOrderDetail ON (ProductAW.ProductID = SalesOrderDetail.ProductID) 
RIGHT JOIN SalesOrderHeader ON (SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID) 
RIGHT JOIN CustomerAW ON (SalesOrderHeader.CustomerID = CustomerAW.CustomerID) 
WHERE ProductModel.Name = "Racing Socks";