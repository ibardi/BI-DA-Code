USE AdventureWorks2012


SELECT
 p.ProductID,
  p.Name, 
  COUNT(pod.LineTotal) AS 'Number of Purchases',
   SUM(pod.OrderQty) AS 'Units Purchased' ,
    SUM(pod.LineTotal) AS'Total Purchased in $'
FROM Production.Product AS p
JOIN Purchasing.PurchaseOrderDetail AS pod
ON p.ProductID = pod.ProductID
GROUP BY p.ProductID, p.Name
ORDER BY Sum(pod.LineTotal) DESC;