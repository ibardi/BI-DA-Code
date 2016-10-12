USE AdventureWorks2012;

/*Find out info of all the customers*/

/* SELECT * From Sales.Customer; */

/*Find out info of all the sales orders*/

/* SELECT * From Sales.SalesOrderHeader; */

/*Find out sales info about productID 843*/

/* SELECT * From Sales.SalesOrderDetail where productID=843; */

/* Sales info of all the products of which unit price is between 100 and 200*/

/*Select * From Sales.SalesOrderDetail where UnitPrice >= 100 AND UnitPrice <= 200; */ 

/*All the store names*/

/* SELECT [Name] FROM Sales.Store; */ 

/*Find out store names that contain "Bike" */

/* SELECT [Name] FROM Sales.Store where [name] like '%Bike%'; */

/*info of all the credit cards*/

/* SELECT * From Sales.CreditCard */ 

/* A list of credit card types*/

/* SELECT DISTINCT CardType FROM Sales.CreditCard */ 