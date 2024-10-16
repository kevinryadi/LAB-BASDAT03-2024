USE classicmodels;

-- nomor1
SELECT  c.customerName, 
		  CONCAT(e.firstName, ' ',e.lastName) AS salesRep,
		  (c.creditLimit- SUM(p.amount)) AS remainingCredit
FROM customers c
JOIN employees e
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p
USING (customerNumber)
GROUP BY c.customerName
HAVING remainingCredit > 0;

-- nomor2
SELECT p.productName AS "Nama Produk", 
		 GROUP_CONCAT(DISTINCT c.customerName) AS "Nama Customer",
		 COUNT(DISTINCT c.customerName) AS "Jumlah Customer",
		 SUM(od.quantityOrdered) AS "Total Quantitas"
FROM products p
JOIN orderdetails od
USING (productCode)
JOIN orders o
USING (orderNumber)
JOIN customers c
USING (customerNumber)
GROUP BY p.productName;

-- nomor3
SELECT CONCAT(e.firstName, ' ', e.lastName) AS employeeName,
		 COUNT(c.customerName) AS totalCustomers
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY employeeName
ORDER BY `totalCustomers` DESC;

-- nomor4
SELECT CONCAT(e.firstName, ' ', e.lastName) AS "Nama Karyawan",
		 p.productName AS "Nama Produk",
		 SUM(od.quantityOrdered) AS "Jumlah Pesanan"
FROM products p
JOIN orderdetails od
USING (productCode)
JOIN orders o
USING (orderNumber)
JOIN customers c
USING (customerNumber)
RIGHT JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices OF
USING (officeCode)
WHERE OF.country = 'Australia'
GROUP BY employeeNumber, productName
ORDER BY `Jumlah Pesanan` DESC;
		 
-- nomor5
SELECT c.customerName AS "Nama Pelanggan",
		 GROUP_CONCAT(DISTINCT p.productName) AS "Nama Produk",
		 COUNT(p.productLine) AS "Banyak Jenis Produk"
FROM customers c
JOIN orders o
USING (customerNumber) 
JOIN orderdetails od
USING (orderNumber)
JOIN products p
USING (productCode)
WHERE o.shippedDate IS NULL
GROUP BY c.customerName;
		  

