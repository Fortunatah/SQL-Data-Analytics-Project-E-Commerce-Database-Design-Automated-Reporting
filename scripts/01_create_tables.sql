-- 1. Create the Database (if it doesn't already exist)
CREATE DATABASE IF NOT EXISTS EcommerceProject;
USE EcommerceProject;

-- 2. Drop tables in reverse order of dependencies to ensure a clean slate
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- 3. Create the Customers table
CREATE TABLE Customers(
	customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
	email VARCHAR(50),
    join_date DATE
);

-- 4. creat the Products table 
CREATE TABLE Products(
	product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
	price DECIMAL(9 , 2),
    stock_quantity INT
);

-- 5. Create the Orders table
CREATE TABLE Orders(
	order_id INT PRIMARY KEY,
    order_date DATE,
    quantity INT,
    customer_id INT,
    product_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);