-- 04_advanced_features
-- Creating views, Stores procedures, and CASE logic

-- 1. Drop the view if exists and create it

DROP VIEW IF EXISTS master_table;
CREATE VIEW master_table AS
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_date,
    p.product_name,
    p.category,
    (o.quantity * p.price) AS total_item_price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON p.product_id = o.product_id;

-- 2. Drop the procedure if it exists and create it
-- Pass a parameter customerID to and get total amount spent by that customer
DROP PROCEDURE IF EXISTS getCustomerSpend;

DELIMITER $$
CREATE PROCEDURE getCustomerSpend(IN customerID INT)
BEGIN 
	SELECT
		c.customer_id,
        SUM( o.quantity * p.price) AS 'Amount'
	FROM customers c
	JOIN orders o
		ON o.customer_id = c.customer_id
	JOIN products p
		ON o.product_id = p.product_id
    WHERE c.customer_id = customerID
    GROUP BY c.customer_id;
END $$

-- How to use -> getCustomerSpend(requested customerID)

-- 3. Seeing amount in stock

SELECT 
	product_name,
    CASE
		WHEN stock_quantity >= 100 THEN 'Surplus of stock'
        WHEN stock_quantity < 100 and 
			 stock_quantity  >= 50 THEN 'In Stock'
        WHEN stock_quantity < 50 and 
			 stock_quantity  > 0 THEN 'Low Stock'
		ELSE 'No Stock'
	END AS stock_amount
FROM products;
	
	
