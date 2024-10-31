USE classicmodels

-- Nomor1
SELECT customerNumber, customerName, country
FROM customers

WHERE (country = "USA" AND creditLimit > 50000 AND creditLimit < 100000) 
OR (country != "USA" AND creditLimit >= 100000 AND creditLimit <= 200000)
ORDER BY creditLimit DESC;

-- Nomor2
SELECT productCode, productName, quantityInStock, buyPrice
FROM products

WHERE (quantityInStock BETWEEN 1000 AND 2000) 
		AND (buyPrice < 50 OR buyPrice > 150)
		AND (productLine NOT LIKE "%vintage%");
		
-- Nomor3
SELECT productName, productCode, MSRP
FROM products

WHERE (productLine LIKE "%classic%")
		AND (buyPrice > 50);
		
		
-- Nomor4
SELECT orderNumber, orderDate, status, customerNumber
FROM orders

WHERE orderNumber > 10250 AND status NOT IN ("shipped", "cancelled") 
		AND orderDate BETWEEN "2004-01-01" AND "2005-12-31";
		

-- Nomor5
SELECT orderNumber, orderLineNumber, productCode, quantityOrdered, priceEach, (quantityOrdered * priceEach * 0.95) AS discountedTotalPrice
FROM orderdetails

WHERE (quantityOrdered > 50 AND priceEach >100)
AND productCode NOT LIKE "S18%"
ORDER BY discountedTotalPrice DESC;