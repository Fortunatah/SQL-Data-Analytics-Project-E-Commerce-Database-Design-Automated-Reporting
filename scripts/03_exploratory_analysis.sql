-- This will be for the Business intellgience side
-- We will get total revenue
-- Customer insights
-- Time based trends
-- And the master table


-- 1. Total revenue and revenue
SELECT 
	SUM(o.quantity * p.price) AS 'Total Revenue',
    AVG( o.quantity * p.price ) AS 'Average Cost'
FROM orders o
JOIN products p
	ON p.product_id = o.product_id;
    
-- 2. Which product sells the most
SELECT
    p.product_name AS 'Product Name',
	SUM(o.quantity * p.price) AS 'Total Revenue'
FROM products p
JOIN orders o
	ON p.product_id = o.product_id
GROUP BY p.product_name;

-- 3. Find dead stock
SELECT 	
	p.product_id,
    p.product_name,
    'Not in stock' AS 'Inventory Status'-- Not in orders table
FROM products p
LEFT JOIN orders o 
	ON p.product_id = o.product_id
WHERE o.product_id IS NULL;

-- 4. Find who is a "VIP", aka spent more than $100
SELECT 
	CONCAT(
    (c.first_name) , ' ' , (c.last_name)
    ) AS 'Name',
    'VIP' AS 'VIP'
FROM customers c
JOIN orders o
	ON o.customer_id = c.customer_id
JOIN products p
	ON o.product_id = p.product_id
GROUP BY c.customer_id
HAVING SUM(o.quantity * p.price ) > 100;


-- 5. Find the top 3 biggest spenders
SELECT 
	CONCAT(
    (c.first_name) , ' ' , (c.last_name)
    ) AS customerName, 
    SUM( o.quantity * p.price ) AS amountSpent
FROM customers c
JOIN orders o
	ON o.customer_id = c.customer_id
JOIN products p
	ON o.product_id = p.product_id
GROUP BY customerName
ORDER BY ( amountSpent ) DESC LIMIT 3;


-- 6. See how many orders were placed each month
SELECT 
	YEAR(o.order_date) AS salesYear,
    MONTH(o.order_date) AS salesMonth,
    COUNT(*) AS 'Total count'
FROM orders o
GROUP BY
	salesYear,
	salesMonth
ORDER BY
	salesYear,
    salesMonth;
    
-- 7. Master table
SELECT *
FROM customers c
JOIN orders o
	ON o.customer_id = c.customer_id
JOIN products p
	ON p.product_id = o.product_id

