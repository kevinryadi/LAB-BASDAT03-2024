-- nomor1.
SELECT productCode, productName, quantityInStock
FROM products

WHERE quantityInStock >5000 AND quantityInStock <6000
ORDER BY quantityInStock ASC;

-- nomor2.
SELECT orderNumber, orderDate, STATUS, customerNumber
FROM orders
WHERE STATUS != 'shipped';

-- nomor3.
SELECT employeeNumber, firstName, lastName, email, jobTitle
FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY firstName ASC
LIMIT 10;

-- nomor4.
SELECT productCode, productLine, buyPrice
FROM products
ORDER BY buyPrice DESC
LIMIT 10 OFFSET 5;

-- nomor5.
SELECT distinct country, city
FROM customers
ORDER BY country ASC, city ASC;

