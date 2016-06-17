SELECT CompanyName, Address.AddressLine1, Address.City, Address.StateProvince, Address.PostalCode FROM CustomerAW 
JOIN CustomerAddress ON (CustomerAW.CustomerID = CustomerAddress.CustomerID) 
JOIN Address ON (CustomerAddress.AddressID = Address.AddressID) 
WHERE CompanyName LIKE "%ike%" OR CompanyName LIKE "%ycle%" 
ORDER BY CompanyName ASC;
