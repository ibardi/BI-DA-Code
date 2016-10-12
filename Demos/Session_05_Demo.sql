/* 
SELECT TOP 1000 [SalesOrderID]
	,[OrderDate] as o_date
	,[DueDate]
	,[ShipDate]
	,[Status]
	,[OnlineOrderFlag]
FROM [AdventureWorks2012].[Sales].[SalesOrderHeader]
where OnlineOrderFlag = 1; 

*/

/*
use AdventureWorks2012;

Select FirstName, LastName, Title
from Person.Person
where FirstName Like 'M%' 

The percentage sign syas anything can be after that point. 
for help go to www.github.com/lzblack/mis3545
*/