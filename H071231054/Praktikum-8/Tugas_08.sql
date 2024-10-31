USE classicmodels;

-- nomor 1
(SELECT p.productName,
		 SUM(od.priceEach * od.quantityOrdered) AS "TotalRevenue",
		 'Pendapatan Tinggi' AS "Pendapatan"
FROM products p
JOIN orderdetails od
USING (productCode) 
JOIN orders o
USING (orderNumber)
WHERE o.orderDate LIKE '%-09-%'
GROUP BY productCode
ORDER BY TotalRevenue DESC
LIMIT 5)

UNION ALL

(SELECT p.productName,
		 SUM(od.priceEach * od.quantityOrdered) AS "TotalRevenue",
		 'Pendapatan pendek (kayak kamu)' AS "Pendapatan"
FROM products p
JOIN orderdetails od
USING (productCode) 
JOIN orders o
USING (orderNumber)
WHERE o.orderDate LIKE '%-09-%'
GROUP BY productCode
ORDER BY TotalRevenue ASC
LIMIT 5);

-- nomor2
SELECT productName
FROM products
WHERE productCode NOT IN (
    SELECT productCode
    FROM orderdetails
    JOIN orders
    USING(orderNumber)
    WHERE customerNumber IN (
        SELECT customerNumber
        FROM orders
        GROUP BY customerNumber
        HAVING COUNT(*) > 10

INTERSECT

SELECT o.customerNumber
FROM orders AS o
JOIN orderdetails AS od
USING(orderNumber)
JOIN products AS p
USING(productCode)
WHERE p.buyPrice > (
	   SELECT AVG(buyPrice)
	   FROM products
	   )
   )
);

-- nomor3
SELECT 
    c.customerName
FROM customers AS c
JOIN payments AS p
USING(customerNumber)
GROUP BY c.customerNumber, c.customerName
HAVING SUM(p.amount) > 2 * (
    SELECT AVG(totalPayments)
    FROM (
        SELECT customerNumber, SUM(amount) AS totalPayments
        FROM payments
        GROUP BY customerNumber
    ) AS avgPayments
)

INTERSECT

SELECT 
    c.customerName
FROM customers AS c
JOIN orders AS o
USING(customerNumber)
JOIN orderdetails AS od
USING(orderNumber)
JOIN products AS p
USING(productCode)
WHERE p.productLine IN ('Planes', 'Trains')
GROUP BY c.customerNumber, c.customerName
HAVING SUM(od.quantityOrdered * od.priceEach) > 20000;

-- nomor4
SELECT DISTINCT 
    o.orderDate AS tanggal,
    c.customerNumber,
    c.customerName, 
    'Memesan Barang' AS keterangan
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber 
LEFT JOIN payments p ON o.orderDate = p.paymentDate
WHERE MONTH(o.orderDate) = 9 
    AND YEAR(o.orderDate) = 2003 
    AND p.paymentDate IS NULL

UNION ALL

SELECT DISTINCT 
    p.paymentDate AS tanggal,
    c.customerNumber,
    c.customerName,  
    'Membayar Pesanan' AS keterangan
FROM customers c
LEFT JOIN payments p ON c.customerNumber = p.customerNumber 
LEFT JOIN orders o ON p.paymentDate = o.orderDate
WHERE MONTH(p.paymentDate) = 9 
   AND YEAR(p.paymentDate) = 2003 
   AND o.orderDate IS NULL

UNION ALL

SELECT DISTINCT 
   o.orderDate AS tanggal,  
   c.customerNumber,
   c.customerName, 
   'Memesan dan Membayar' AS keterangan
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber 
JOIN payments p ON o.orderDate = p.paymentDate 
WHERE MONTH(o.orderDate) = 9 
   AND YEAR(o.orderDate) = 2003

ORDER BY tanggal;



-- nomor5
SELECT DISTINCT productCode
FROM products
JOIN orderdetails
USING(productCode)
WHERE buyPrice > (
    SELECT AVG(buyPrice) FROM products 
    join orderdetails 
	 USING(productCode) 
    join orders 
	 USING(orderNumber)
    where orderDate BETWEEN '2001-01-01' and '2004-03-31'
)
AND quantityOrdered > 48
AND LEFT(productVendor, 1) IN ('a', 'i', 'u','e','o')
EXCEPT
SELECT DISTINCT productCode 
FROM products
JOIN orderdetails 
USING(productCode)
    JOIN orders 
	 USING(orderNumber)
    JOIN customers 
	 USING(customerNumber)
WHERE country IN ("Japan", "Germany", "Italy");
