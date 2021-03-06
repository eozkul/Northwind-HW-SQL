--1.'?r?n Ad?','?r?n Fiyat?','Ortalama Sat?? Fiyat?'
SELECT  p.ProductName AS '?r?n Ad?',p.UnitPrice AS '?r?n Fiyat?',AVG(od.UnitPrice*od.Quantity*(1-od.Discount)) AS 'Ortalama Sat?? Fiyat?'
FROM Products p 
INNER JOIN [Order Details] od ON od.ProductID =p.ProductID
GROUP BY p.ProductName,p.UnitPrice,p.ProductID 
ORDER BY p.ProductName 
--2.?al??anlar ne kadar sat?? yapm???Gelir baz?nda '?al??an?n Ad?' ve 'Toplam Sat?? Tutar?'
SELECT e.FirstName+' '+e.LastName AS '?al??an?n Ad?',SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) AS 'Toplam Sat?? Tutar?'
FROM Orders o 
INNER JOIN Employees e ON o.EmployeeID=e.EmployeeID 
INNER JOIN [Order Details] od ON od.OrderID=o.OrderID 
GROUP BY e.FirstName,e.LastName 
--3.?r?nlere g?re sat?? miktar? nedir? ?r?n-Adet-Gelir Raporu '?r?n Ad?','?r?n Adedi','Toplam Tutar'
SELECT p.ProductName AS '?r?n Ad?',
SUM(od.Quantity) AS '?r?n Say?s?',
SUM((od.UnitPrice*od.Quantity*(1-od.Discount))-(p.UnitsInStock*p.UnitPrice)) AS 'Toplam Tutar'
FROM Products p 
INNER JOIN [Order Details] od ON od.ProductID =p.ProductID
GROUP BY p.ProductName 
--4. 1997 y?l?nda en ?ok sat?? yap?lan ?al??an?n ID, 'Ad Soyad','Toplan Sat?? Tutar?'
SELECT e.FirstName+' '+e.LastName AS '?al??an?n Ad?' ,SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) AS 'Toplam Sat?? Tutar?'
FROM Orders o 
INNER JOIN Employees e ON o.EmployeeID=e.EmployeeID 
INNER JOIN [Order Details] od ON od.OrderID=o.OrderID 
WHERE DATEPART(Year,o.OrderDate)='1997'
GROUP BY e.FirstName,e.LastName
