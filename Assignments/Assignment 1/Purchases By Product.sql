USE AdventureWorks2012

SELECT pod.PurchaseOrderID,
 p.ProductID,
  p.Name, 
  pod.OrderQty, 
  pod.LineTotal 
FROM Production.Product AS p
JOIN Purchasing.PurchaseOrderDetail AS pod
ON p.ProductID = pod.ProductID
ORDER BY LineTotal DESC;