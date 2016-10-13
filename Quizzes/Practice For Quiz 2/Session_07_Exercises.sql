USE AdventureWorks2012

/*Question #1 */ 
SELECT soh.OrderDate, SUM(soh.TotalDue) as AmountToBeCollected
FROM Sales.SalesOrderHeader as soh
GROUP BY soh.OrderDate
ORDER BY soh.OrderDate ASC;

/*Question #2 */ 
SELECT sod.ProductID,SUM(sod.LineTotal) as TotalAmountCollected
FROM Sales.SalesOrderDetail as sod
WHERE sod.ProductID in (774,777)
GROUP BY sod.ProductID
ORDER BY sod.ProductID ASC;

/*Question #3 */ 
SELECT sp.BusinessEntityID, p.LastName, p.FirstName, st.Name as TerritoryName
FROM Sales.SalesPerson as sp
JOIN Sales.SalesTerritory as st
ON sp.TerritoryID = st.TerritoryID
JOIN Person.Person as p
ON p.BusinessEntityID = sp.BusinessEntityID
Order by sp.BusinessEntityID ASC;

/*Question #4 */ 
SELECT p.BusinessEntityID, p.FirstName, p.LastName, cc.CardType
FROM Sales.CreditCard as cc
JOIN Sales.PersonCreditCard as pcc
ON cc.CreditCardID = pcc.CreditCardID
JOIN Person.Person as p
ON p.BusinessEntityID = pcc.BusinessEntityID
Where cc.CardType = 'Vista';

/*Question #4 Extension */ 
SELECT cc.CardType, COUNT(pcc.BusinessEntityID)
FROM Sales.CreditCard as cc
JOIN Sales.PersonCreditCard as pcc
ON cc.CreditCardID = pcc.CreditCardID
GROUP BY cc.CardType;

/*Question #5 */ 
SELECT st.CountryRegionCode, st.TerritoryID
FROM Sales.SalesTerritory as st
left OUTER JOIN Person.CountryRegion as cr
ON  cr.CountryRegionCode = st.CountryRegionCode;

/*Question #6 */
SELECT AVG(TotalDue) as AverageTotalDue
FROM Sales.SalesOrderHeader;

/*Question #7 */ 
SELECT soh.SalesOrderID, soh.TotalDue
FROM Sales.SalesOrderHeader as soh
WHERE soh.Totaldue > (
SELECT AVG(TotalDue)
FROM Sales.SalesOrderHeader)
Order by soh.TotalDue DESC;
