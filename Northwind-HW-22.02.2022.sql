--1.'Ürün Adý','Ürün Fiyatý','Ortalama Satýþ Fiyatý'
SELECT  p.ProductName AS 'Ürün Adý',p.UnitPrice AS 'Ürün Fiyatý',AVG(od.UnitPrice*od.Quantity*(1-od.Discount)) AS 'Ortalama Satýþ Fiyatý'
FROM Products p 
INNER JOIN [Order Details] od ON od.ProductID =p.ProductID
GROUP BY p.ProductName,p.UnitPrice,p.ProductID 
ORDER BY p.ProductName 
--2.Çalýþanlar ne kadar satýþ yapmýþ?Gelir bazýnda 'Çalýþanýn Adý' ve 'Toplam Satýþ Tutarý'
SELECT e.FirstName+' '+e.LastName AS 'Çalýþanýn Adý',SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) AS 'Toplam Satýþ Tutarý'
FROM Orders o 
INNER JOIN Employees e ON o.EmployeeID=e.EmployeeID 
INNER JOIN [Order Details] od ON od.OrderID=o.OrderID 
GROUP BY e.FirstName,e.LastName 
--3.Ürünlere göre satýþ miktarý nedir? Ürün-Adet-Gelir Raporu 'Ürün Adý','Ürün Adedi','Toplam Tutar'
SELECT p.ProductName AS 'Ürün Adý',
SUM(od.Quantity) AS 'Ürün Sayýsý',
SUM((od.UnitPrice*od.Quantity*(1-od.Discount))-(p.UnitsInStock*p.UnitPrice)) AS 'Toplam Tutar'
FROM Products p 
INNER JOIN [Order Details] od ON od.ProductID =p.ProductID
GROUP BY p.ProductName 
--4. 1997 yýlýnda en çok satýþ yapýlan çalýþanýn ID, 'Ad Soyad','Toplan Satýþ Tutarý'
SELECT e.FirstName+' '+e.LastName AS 'Çalýþanýn Adý' ,SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) AS 'Toplam Satýþ Tutarý'
FROM Orders o 
INNER JOIN Employees e ON o.EmployeeID=e.EmployeeID 
INNER JOIN [Order Details] od ON od.OrderID=o.OrderID 
WHERE DATEPART(Year,o.OrderDate)='1997'
GROUP BY e.FirstName,e.LastName
