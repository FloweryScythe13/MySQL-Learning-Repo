SELECT CompanyName FROM CustomerAW 
JOIN CustomerAddress ON (CustomerAW.CustomerID = CustomerAddress.CustomerID) 
JOIN Address ON (Address.AddressID = CustomerAddress.AddressID) 
WHERE Address.City = "Dallas";