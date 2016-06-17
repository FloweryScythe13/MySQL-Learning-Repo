SELECT ListPrice FROM ProductAW WHERE ProductID = (SELECT pid FROM 
(SELECT pid, MAX(qtysum) FROM (SELECT ProductID AS pid, SUM(OrderQty) AS qtysum FROM SalesOrderDetail GROUP BY ProductID) A1) A2);