USE AdventureWorks2012; 

/* 
SELECT JobTitle, COUNT(BusinessEntityID) AS 'Number' 
FROM  HumanResources.Employee 
WHERE CurrentFlag = 1 
GROUP BY JobTitle 
*/

/* We have to count by Unique ID (the Primary key). We should also name the aggregate column 
something by using the AS function. We also add a WHERE CurrentFlag = 1 before the 
GROUP BY JobTitle, so that we only see current active employees. */



/* SELECT TerritoryID, OrderDate, Count(SalesOrderID) as Number, Sum(TotalDue) as Amt_due
From sales.SalesOrderheader Where OrderDate < '2007-01-01'
Group By territoryID, OrderDate
having Sum (TotalDue) > 5000
Order by Sum (TotalDue) DESC;  */


/* Activity #2. Modified Query that looks for Job Titles that have more than one person working with that title */ 

/*
SELECT JobTitle, COUNT(BusinessEntityID) AS 'Number' 
FROM  HumanResources.Employee 
WHERE CurrentFlag = 1 
GROUP BY JobTitle 
HAVING count(BusinessEntityID) > 1 
Order by count(BusinessEntityId) DESC ;
*/ 


/* IN PPT */ 
/*
SELECT s.SalesOrderID, 
s.OrderQty, 
s.UnitPrice,
s.LineTotal,
p.name
From sales.SalesOrderDetail as s, production.product as p
ON s.ProductID = p.ProductID ; */

/* Inner Join 
SELECT s.SalesOrderID, 
s.OrderQty,
s.UnitPrice,
s.LineTotal,
p.Name
From sales.SalesOrderDetail as s Inner Join production.product as p
on s.ProductID = p.ProductID ; 
*/


/* Activity #3 */ 
/*
SELECT pp.ProductID, pp. Name as Product_Name, PL.Name as Location, i.Quantity
FROM Production.Product as pp
JOIN Production.ProductInventory as i 
ON pp.productID = i.ProductID
JOIN Production.Location as PL
ON PL.LocationID = i.LocationID
*/

SELECT ppm.ProductModelID, pp.name
FROM Production.ProductModel as ppm
full outer join  Production.Product as pp
ON pp.Name = ppm.Name
Where pp.ProductID = NULL

/* THIS LAST ONE IS NOT WORKING AND I CAN'T FIGURE OUT WHY? */