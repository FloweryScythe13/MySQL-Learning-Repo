
SELECT MainO.MainAddress AS 'Main Address', 
       IFNULL(ShipO.ShippingAddress,' ') AS 'Shipping Address'
FROM (SELECT CA.CustomerID AS CustomerID, A.AddressLine1 AS MainAddress
      FROM CustomerAddress CA
      INNER JOIN Address A 
          ON A.AddressID = CA.AddressID
      WHERE CA.AddressType = 'Main Office' 
          AND A.City = 'Dallas') MainO
LEFT JOIN (SELECT CA.CustomerID AS CustomerID, 
                  A.AddressLine1 AS ShippingAddress
           FROM CustomerAddress CA 
           INNER JOIN Address A
               ON A.AddressID = CA.AddressID
           WHERE CA.AddressType = 'Shipping'
               ) ShipO 
ON MainO.CustomerID = ShipO.CustomerID;