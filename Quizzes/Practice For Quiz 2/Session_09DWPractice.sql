USE AdventureWorksDW2012

SELECT *
FROM DimEmployee
WHERE month(BirthDate)=2;

SELECT *
FROM DimEmployee
WHERE month(BirthDate)=2
AND Title = 'Sales Representative';

SELECT rs.*, e.FirstName,e.LastName
FROM DimEmployee as e 
JOIN FactResellerSales as rs
ON e.EmployeeKey = rs.EmployeeKey
WHERE month(e.BirthDate) = 2
AND Title = 'Sales Representative';


SELECT e.FirstName,e.LastName, COUNT(rs.SalesOrderNumber) as NumberOfSales
FROM DimEmployee as e 
JOIN FactResellerSales as rs
ON e.EmployeeKey = rs.EmployeeKey
WHERE month(e.BirthDate) = 2
AND Title = 'Sales Representative'
GROUP BY e.FirstName,e.LastName
ORDER BY COUNT(rs.SalesOrderNumber) DESC;
