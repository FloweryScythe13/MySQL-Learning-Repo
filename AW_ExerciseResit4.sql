SELECT SUM(SalesOrderHeader.SubTotal + SalesOrderHeader.TaxAmt + SalesOrderHeader.Freight) AS TotalOrderValue, CountyRegion FROM Address 
JOIN SalesOrderHeader ON (Address.AddressID = SalesOrderHeader.ShipToAddressID) 
JOIN SalesOrderDetail ON (SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID) 
GROUP BY CountyRegion ORDER BY TotalOrderValue DESC; --added Freight as a correction