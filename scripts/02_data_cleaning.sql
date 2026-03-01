-- THIS SQL SCRIPT WILL BE FOR CLEANING THE DATA

-- 1. CUSTOMERS TABLE

-- If customer did not enter in email update so it is null

UPDATE customers
	SET email = NULL
WHERE email = '';

-- Give proper name casing
    
UPDATE customers
	SET 
		first_name = CONCAT (
		UPPER(LEFT(first_name , 1)) ,
        LOWER(SUBSTRING(first_name , 2))
        ),
        last_name = CONCAT (
		UPPER(LEFT(last_name , 1)) ,
        LOWER(SUBSTRING(last_name , 2))
    );

-- Get rid of the test user
-- Since it is a foreign key remove it from orders first
DELETE FROM orders
	WHERE customer_id = 5; -- 5 is the test user ID
-- Now delete from customers
DELETE FROM customers
	WHERE customer_id = 5;
    
-- 2. Now update the products table

-- First find out if a product is entered in as $0
UPDATE products
SET price = CASE
	WHEN product_name = 'Wireless Mouse' THEN 25.99
    WHEN product_name = 'Mechanical Keyboard' THEN 89.99
    WHEN product_name = 'Office Chair' THEN 125.00
    WHEN product_name = 'Desk Lamp' THEN 35.50
    WHEN product_name = 'USB-C Cable' THEN 12.00
    ELSE NULL
END
WHERE price = 0.00;

-- Update products so that if the stock_quantity is <0 we make it zero
UPDATE products
	SET stock_quantity = 0
WHERE stock_quantity < 0;

-- 3. Orders Table

-- Orphaned records/check if there are any orders for a customer_id
-- That does not exist
DELETE FROM orders
	WHERE NOT EXISTS(
		SELECT 1 FROM Customers
        WHERE Customers.customer_id = orders.customer_id
    );
    
-- Check if the quantity is less than 0
UPDATE orders
	SET quantity = 0
WHERE quantity < 0;

    