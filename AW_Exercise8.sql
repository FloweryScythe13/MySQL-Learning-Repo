SELECT Description FROM ProductDescription 
JOIN ProductModelProductDescription ON (ProductDescription.ProductDescriptionID = ProductModelProductDescription.ProductDescriptionID) 
JOIN ProductAW ON (ProductModelProductDescription.ProductModelID = ProductAW.ProductModelID) 
WHERE Culture = "fr" AND ProductID = "736";