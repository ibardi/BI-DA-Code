USE AdventureWorks2012
/* Question 3a. */
SELECT p.Name,
p.ProductNumber,
p.ListPrice
FROM Production.Product AS p 
WHERE p.ListPrice > 500
ORDER BY p.ListPrice ASC;

/* Question 3b. */

SELECT st.Name,
SUM(soh.TotalDue) AS 'Total Sales'
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesTerritory as st
ON soh.TerritoryID = st.TerritoryID
WHERE year(soh.OrderDate) = 2007 and month(soh.OrderDate) = 8
GROUP BY st.Name
ORDER BY st.Name ASC;

/* Question3c. */

SELECT v.Name,
COUNT(pv.ProductID) AS 'Number of Products Supplied'
FROM Purchasing.Vendor AS v
JOIN Purchasing.ProductVendor AS pv 
ON v.BusinessEntityID = pv.BusinessEntityID
GROUP BY v.Name
HAVING COUNT(pv.ProductID) > 3 
ORDER BY COUNT(pv.ProductID) DESC; 