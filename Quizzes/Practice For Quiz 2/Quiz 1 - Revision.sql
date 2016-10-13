USE AdventureWorks2012

/*Question A */
SELECT p.FirstName, p.LastName
FROM HumanResources.Employee as e
JOIN Person.Person as p
ON e.BusinessEntityID = p.BusinessEntityID
WHERE e.JobTitle = 'Sales Representative'
ORDER BY e.BirthDate ASC;

/*Question B */
SELECT p.ProductID, p.Name, SUM(sod.LineTotal) as Total_Sales
FROM Sales.SalesOrderDetail as sod
JOIN Production.Product as p
ON p.ProductID = sod.ProductID
GROUP BY p.ProductID, p.Name
HAVING SUM(sod.LineTotal) >= 5000;

/*Question C */ 
SELECT sp.BusinessEntityID, st.Name, sp.SalesYTD
FROM Sales.SalesPerson as sp
LEFT OUTER JOIN Sales.SalesTerritory as st
ON sp.TerritoryID = st.TerritoryID
WHERE sp.SalesYTD > 500000; 

/*Question D */ 
SELECT  soh.SalesOrderID, soh.TotalDue
FROM Sales.SalesOrderHeader as soh
WHERE year(OrderDate)=2008
and soh.TotalDue > 
(SELECT AVG(TotalDue)
FROM Sales.SalesOrderHeader 
WHERE year(OrderDate)=2008);

