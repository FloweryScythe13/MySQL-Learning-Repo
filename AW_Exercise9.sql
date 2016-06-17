/* Shows a single result with null SubTotal and CompanyName values - not seeing the bug */

SELECT SalesOrderHeader.SubTotal, CustomerAW.CompanyName, SalesOrderDetail.OrderQty * ProductAW.Weight FROM        
             SalesOrderHeader
LEFT JOIN CustomerAW ON (SalesOrderHeader.CustomerID = CustomerAW.CustomerID) 
RIGHT JOIN SalesOrderDetail ON (SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID) 
RIGHT JOIN ProductAW ON (SalesOrderDetail.ProductID = ProductAW.ProductID) 
ORDER BY SubTotal DESC;