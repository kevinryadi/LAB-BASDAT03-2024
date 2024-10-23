USE classicmodels;

-- Nomor1
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice > (SELECT AVG(buyPrice) FROM products);


-- Nomor2
SELECT o.orderNumber, o.orderDate
FROM orders o
WHERE o.customerNumber IN (
    SELECT c.customerNumber
    FROM customers c
    WHERE c.salesRepEmployeeNumber IN (
        SELECT e.employeeNumber
        FROM employees e
        WHERE e.officeCode IN (
            SELECT o.officeCode
            FROM offices o
            WHERE o.city = 'Tokyo'
        )
    )
	);
	

-- Nomor3	
SELECT 
    c.customerName,
    o.orderNumber,
    o.shippedDate,
    o.requiredDate,
    group_concat(p.productName ORDER BY p.productName) AS 'products',
    SUM(od.quantityOrdered) AS 'total_quantity_ordered',
    CONCAT(e.firstName, " ", e.lastName) AS 'employeeName'
FROM employees e
JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o 
USING (customerNumber)
JOIN orderdetails od 
USING (orderNumber)
JOIN products p 
USING (productCode)
WHERE 
     o.orderNumber IN (
        SELECT o2.orderNumber
        FROM orders o2
        WHERE o2.shippedDate > o2.requiredDate
    )
GROUP BY c.customerName;


-- Nomor4
SELECT 
    p.productName,
    p.productLine,
    SUM(od.quantityOrdered) AS total_quantity_ordered
FROM products p
JOIN orderdetails od
USING (productCode)
WHERE 
    p.productLine IN (
        SELECT productLine
        FROM (
            SELECT 
                p.productLine,
                SUM(od.quantityOrdered) AS total_quantity_ordered
            FROM products p
            JOIN orderdetails od
            USING (productCode)
            GROUP BY 
                p.productLine
            ORDER BY 
                total_quantity_ordered DESC
            LIMIT 3
        ) AS top_categories
    )
GROUP BY 
    p.productName, p.productLine
ORDER BY 
    total_quantity_ordered DESC;





