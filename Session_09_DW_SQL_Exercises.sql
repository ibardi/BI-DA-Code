use AdventureWorksDW2012;


/*Employees whose birthday is in Feburary*/

SELECT *
FROM DimEmployee
WHERE month(BirthDate) = 2
AND Title = 'Sales Representative';


/*who are the Sales Representatives whose birthday is in Feburary?*/




/*List all the sales processed by these Sales Representatives */

SELECT s.*, e.FirstName, e.LastName
FROM FactResellerSales as s, DimEmployee as e
WHERE s.EmployeeKey = e.EmployeeKey					/* <----- This is important because with this we are linking the two tables and making sure rows are not repeated */ 
AND month(BirthDate) = 2
AND e.Title = 'Sales Representative';

/*who is a better sales representative that was born in Feburary?*/

SELECT sum(s.SalesAmount) as 'Total Sales Amount', e.FirstName, e.LastName
FROM FactResellerSales as s, DimEmployee as e
WHERE s.EmployeeKey = e.EmployeeKey					/* <----- This is important because with this we are linking the two tables and making sure rows are not repeated */ 
AND month(BirthDate) = 2
AND e.Title = 'Sales Representative'
GROUP BY e.FirstName, e.LastName
ORDER BY sum(s.SalesAmount) DESC;


/*total Amount of off-line sales in Massachusetts*/


/*Sales Amount of Internet Sales in 1st quarter each year in each country*/
