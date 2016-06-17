SELECT SalesOrderID, SubTotal FROM SalesOrderHeader;

SELECT SalesOrderID, OrderQty * UnitPrice FROM SalesOrderDetail;

SELECT SalesOrderID, OrderQty * ProductAW.ListPrice FROM SalesOrderDetail JOIN ProductAW ON (SalesOrderDetail.ProductID = ProductAW.ProductID);