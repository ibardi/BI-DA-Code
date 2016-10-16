USE AdventureWorksDW2012;


/*Question 1*/
SELECT SUM(OrderQuantity) as TotalOrderQuanitity, FullDateAlternateKey, p.EnglishProductName
FROM FactInternetSales as fis, DimDate as d, DimProduct as p
WHERE fis.OrderDateKey = d.datekey
AND fis.productkey = p.productkey and CalendarYear = 2006
GROUP BY FullDateAlternateKey, p.EnglishProductName
ORDER BY FullDateAlternateKey, p.EnglishProductName;

/*Question 2 - SLICE*/
SELECT SUM(OrderQuantity) as TotalOrderQuantity, FullDateAlternateKey, p.EnglishProductName
FROM FactInternetSales as fis, DimDate as d, DimProduct as p
WHERE d.datekey = fis.OrderDateKey
AND fis.ProductKey = p.ProductKey and CalendarYear = 2006
AND EnglishProductName = 'Road-150 Red, 62'
GROUP BY FullDateAlternateKey, p.EnglishProductName
ORDER BY FullDateAlternateKey, p.EnglishProductName;

/* Slicing is performed by selecting a single dimension of a cube which means that we set one dimension to a specific value, like "Road -150 Red, 62" and we so we rain a smaller subset of the select dimensions. */

/*Question 3 - ROLL-UP */ 
SELECT SUM(OrderQuantity) as TotalOrderQuantity, d.EnglishMonthName,
p.EnglishProductName
from FactInternetSales as fis, DimDate as d, DimProduct as p
WHERE fis.OrderDateKey = d.DateKey
and fis.ProductKey = p.ProductKey
AND CalendarYear = 2006
GROUP BY d.EnglishMonthName, p.EnglishProductName
ORDER BY d.EnglishMonthName, p.EnglishProductName;

/* Roll-up is when you aggregate one of the already used dimensions, like in the example above where instead of displaying OrderQuanitity per model per day, we display Orderquantity per model per MONTH (days all aggregated into one month).*/ 

/* I decided to write the query just like you showed us how you did it. My original roll-up query was also correct, where I went from specific model to model group (regardless of size or color) */ 

/*Question 4 - Optional Question */ 

SELECT SUM(fis.OrderQuantity) as TotalOrderQuantity, c.CommuteDistance
FROM FactInternetSales as fis
JOIN DimCustomer as c
ON fis.CustomerKey = c.CustomerKey
GROUP BY c.CommuteDistance
ORDER by SUM(fis.OrderQuantity) DESC;

/*The relationship we are trying to discover here is how do OrderQuantities change based on the commute distance of our customers*/