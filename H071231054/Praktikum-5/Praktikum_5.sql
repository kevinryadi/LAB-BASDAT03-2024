USE classicmodels

-- Nomor1
SELECT DISTINCT  c.customerName AS 'namaKostumer',
		 			  p.productName AS 'namaProduk',
		 			  p.productDescription AS 'texDescription'
FROM customers c
JOIN orders o
ON o.customerNumber = c.customerNumber
JOIN orderdetails od
ON o.orderNumber = od.orderNumber
JOIN products p
ON od.productCode = p.productCode
WHERE p.productName LIKE '%Titanic%'; 

-- Nomor2
SELECT c.customerName, p.productName, o.status, o.shippedDate
FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderdetails od
ON od.orderNumber = o.orderNumber
JOIN products p
ON od.productCode = p.productCode
WHERE p.productName LIKE '%Ferrari%'AND 
		o.status = 'Shipped'AND 
		o.shippedDate >= '2003-10-01' AND o.shippedDate <'2004-10-01'
ORDER BY o.shippedDate DESC;

-- Nomor 3
SELECT e.firstName AS 'Supervisor', e1.firstName AS 'Karyawan'
FROM employees e
JOIN employees e1
ON e.employeeNumber = e1.reportsTo
WHERE e.firstName LIKE '%Gerard%'
ORDER BY e1.firstName ASC;

-- Nomor 4
-- a.
SELECT c.customerName, p.paymentDate, e.firstName AS 'employeeName', p.amount
FROM customers c
JOIN payments p
ON c.customerNumber = p.customerNumber
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '%-11-%';

-- b.
SELECT c.customerName, p.paymentDate, e.firstName AS 'employeeName', p.amount
FROM customers c
JOIN payments p
ON c.customerNumber = p.customerNumber
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '%-11-%'
ORDER BY p.amount DESC LIMIT 1;

-- c.
SELECT c.customerName, p.productName
FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN payments p1
ON c.customerNumber = p1.customerNumber
JOIN orderdetails od
ON od.orderNumber = o.orderNumber
JOIN products p
ON od.productCode = p.productCode
WHERE (c.customerName LIKE 'Corporate Gift%') 
		AND (p1.paymentDate LIKE '%-11-%');
