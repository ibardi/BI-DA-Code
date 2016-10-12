USE AdventureWorks2012; /*Set current database*/


/*1, Display the total amount collected from the orders for each order date. */

SELECT pp.OrderDate, SUM(TotalDue) as DailyAmount, COUNT(pp.SalesOrderID) as NumberOfOrders
FROM Sales.SalesOrderHeader as pp 
GROUP BY pp.OrderDate
Order by SUM(TotalDue) DESC;

/*2, Display the total amount collected from selling the products, 774 and 777. */

SELECT ProductID,
Sum(LineTotal) as TotalAmount,
AVG(UnitPrice) as Avg_Unit_Price,
MAX(UnitPrice) as Max_Unit_Price,
MIN(UnitPrice) as Min_Unit_Price,
SUM(OrderQty) as Total_Number_of_Units
FROM Sales.SalesOrderDetail
WHERE ProductID in (774,777)
GROUP BY ProductID;

/*3, Write a query to display the sales person BusinessEntityID, last name and first name of all the sales persons and the name of the territory to which they belong.*/

SELECT p.BusinessEntityID, t.Name as Territory_Name, pp.LastName, pp.FirstName
FROM Sales.SalesPerson as p
JOIN Sales.SalesTerritory as t
ON p.TerritoryID = t.TerritoryID 
join Person.Person as pp
ON p.BusinessEntityID = pp.BusinessEntityID;

/*4,  Write a query to display the Business Entities of the customers that have the 'Vista' credit card.*/

SELECT pcc.BusinessEntityID, CardType, LastName, FirstName
FROM Sales.CreditCard as c
JOIN Sales.PersonCreditCard as pcc
ON c.CreditCardID = pcc.CreditCardID
JOIN Person.Person as p 
ON pcc.BusinessEntityID = p.BusinessEntityID
WHERE c.CardType like 'Vista';

/*Sho the number of customers for each type of Credit card*/

SELECT CardType, COUNT(BusinessEntityID) as Number_of_customers
FROM Sales.CreditCard
JOIN Sales.PersonCreditCard
ON Sales.Creditcard.CreditCardID = Sales.PersonCreditCard.CreditCardID
GROUP BY CardType;

/*5, Write a query to display ALL the country region codes along with their corresponding territory IDs*/

SELECT cr.CountryRegionCode, cr.Name, st.TerritoryID
FROM Person.CountryRegion as cr
full OUTER JOIN Sales.SalesTerritory as st
ON cr.CountryRegionCode = st.CountryRegionCode
WHERE st.TerritoryID is null;  /*To find out which countries do not have Territory IDs */ 

/*6, Find out the average of the total dues of all the orders.*/

SELECT AVG(TotalDue)as AverageOfAllOrders
FROM Sales.SalesOrderHeader;

/*7, Write a query to report the sales order ID of those orders where the total value is greater than the average of */

SELECT SalesOrderID, TotalDue
FROM Sales.SalesOrderHeader
WHERE TotalDue > 
(SELECT AVG(TotalDue)as AverageOfAllOrders
FROM Sales.SalesOrderHeader)
ORDER By TotalDue DESC; 