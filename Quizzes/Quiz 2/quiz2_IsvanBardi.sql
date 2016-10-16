USE AdventureWorksDW2012

/*Quesiton #1*/
SELECT fis.OrderDate, p.EnglishProductName, SUM(fis.OrderQuantity) as TotalOnlineQuantity
FROM FactInternetSales as fis
JOIN DimProduct as p
ON fis.ProductKey = p.ProductKey
Where YEAR(fis.OrderDate) = 2006
GROUP BY fis.OrderDate,p.EnglishProductName
ORDER BY fis.OrderDate ASC;

/*Question 2*/
/* Slicing is when you choose a single value for one of the dimensions. In this example I removed the data operator, so that we see total quanity sold instead of just those sold in 2006. I like to think of it as making a 3D cube into a 2D flat table*/
SELECT p.EnglishProductName, SUM(fis.OrderQuantity) as TotalOnlineQuantity
FROM FactInternetSales as fis
JOIN DimProduct as p
ON fis.ProductKey = p.ProductKey
GROUP BY fis.OrderDate,p.EnglishProductName
ORDER BY fis.OrderDate ASC;

/*Quesiton 3*/
/* Rollup is where you combine the hierarchical compponents of a dimension. For example here. Here I changed the englishname to model name and the group by as well so that There data is not displayed per model per size, but simply per model.   */
SELECT fis.OrderDate, p.ModelName, SUM(fis.OrderQuantity) as TotalOnlineQuantity
FROM FactInternetSales as fis
JOIN DimProduct as p
ON fis.ProductKey = p.ProductKey
Where YEAR(fis.OrderDate) = 2006
GROUP BY fis.OrderDate,p.ModelName
ORDER BY fis.OrderDate ASC;

/*Question #4 - To answer this question I would use a pivot table, to reference the amount of cars to the quantity of orders purchased. I would want to find a relationship that is negative in nature, as in the less cars, the more bicycle purchaes. This would be rather simple pivot table, which would have columns with 0,1,2,3... car per customer and the Total number of orders placed */