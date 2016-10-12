/* Question 1 */

SELECT 
p.FirstName,
 p.LastName
FROM HumanResources.Employee as e
JOIN Person.Person as p 
ON e.BusinessEntityID = p.BusinessEntityID
WHERE e.JobTitle like 'sales representative'
ORDER BY e.BirthDate ASC;

/*Question 2. NOTE: I added an order to the question! */

SELECT p.ProductID,
p.Name,
SUM(sod.LineTotal) as 'Total of LineTotal'
FROM Sales.SalesOrderDetail as sod
JOIN Production.Product as p 
ON p.ProductID = sod.ProductID
GROUP BY p.ProductID, p.Name
HAVING SUM(sod.LineTotal) > 5000
ORDER BY SUM(sod.LineTotal) DESC;

/*Question 3 */

SELECT sp.BusinessEntityID,
st.Name,
SUM(st.SalesYTD)
FROM Sales.SalesPerson as sp
left outer join sales.SalesTerritory as st
ON sp.TerritoryID = st.TerritoryID
GROUP BY sp.BusinessEntityID, st.name
HAVING SUM(st.salesYTD) > 500000;

/*Question 4 - There is an error with the HAVING function */ 

SELECT soh.SalesOrderID,
soh.TotalDue
FROM Sales.SalesOrderHeader as soh
WHERE Year(soh.OrderDate) = 2008
HAVING AVG(soh.TotalDue) < soh.TotalDue;




