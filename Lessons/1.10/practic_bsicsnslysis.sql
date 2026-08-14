CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50),
    age INT
);
CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10, 2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name, country, age) VALUES
(1, 'Alice', 'KENYA', 30),
(2, 'Bob', 'UGANDA', 25),
(3, 'Charlie', 'KENYA', 35),
(4, 'David', 'TANZANIA', 28),
(5, 'Eva', 'KENYA', 22),
(6, 'Frank', 'UGANDA', 40),
(7, 'Grace', 'KENYA', 27),
(8, 'Hannah', 'TANZANIA', 32),
(9, 'Ian', 'KENYA', 29),
(10, 'Jack', 'UGANDA', 31);

INSERT INTO orders (order_id, customer_id, product, amount, status) VALUES
(101, 1, 'Laptop', 8500.00, 'Completed'),
(102, 2, 'Phone', 4500.00, 'Pending'),
(103, 3, 'Mouse', 2500.00, 'Completed'),
(104, 4, 'Keyboard', 2900.00, 'Cancelled'),
(105, 5, 'Monitor', 30000.00, 'Completed'),
(106, 6, 'Headphones', 3500.00, 'Pending'),
(107, 7, 'Webcam', 40000.00, 'Completed'),
(108, 8, 'Speaker', 4500.00, 'Cancelled'),
(109, 9, 'Tablet', 50000.00, 'Completed'),
(110, 10, 'Watch', 5500.00, 'Pending');

SELECT *
FROM customers;

SELECT 
   name,
   country
FROM customers;   

SELECT *
FROM customers
WHERE country = 'KENYA';

SELECT *
FROM customers
ORDER BY age;

SELECT 
   customer_id,
   name,
   age,
   country
FROM customers
LIMIT 3;

SELECT 
   customer_id,
   name,
   age,
   country
FROM customers
WHERE country = 'KENYA' AND age > 23;

SELECT *
FROM customers
WHERE country = 'KENYA' OR country = 'UGANDA';

SELECT *
FROM customers
WHERE country IN ('KENYA', 'UGANDA');

SELECT *
FROM customers
WHERE age BETWEEN 25 AND 35;

SELECT *
FROM customers
WHERE name LIKE 'A%';

SELECT 
   DISTINCT country
FROM customers;

SELECT *
FROM customers
WHERE phone IS NULL;

SELECT *
FROM customers
WHERE phone IS NOT NULL;

SELECT 
   COUNT(*)
FROM orders; 

SELECT 
   SUM(amount)
FROM orders; 

SELECT 
   AVG(amount)
FROM orders; 

SELECT 
   MIN(amount)
FROM orders; 

SELECT 
   MAX(amount)
FROM orders; 

SELECT 
   MIN(amount)
FROM orders; 

SELECT 
   product,
   SUM(amount) AS total_amount   
FROM orders
GROUP BY product;

ALTER TABLE orders
DROP COLUMN customer_id;

ALTER TABLE orders
ADD COLUMN customer_id INT;

CREATE OR REPLACE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
   product VARCHAR(50),
   amount DECIMAL(10, 2),
   status VARCHAR(20),
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, product, amount, status) VALUES
(101, 1, 'Laptop', 8500.00, 'Completed'),
(102, 1, 'Phone', 4500.00, 'Pending'),
(103, 3, 'Mouse', 2500.00, 'Completed'),
(104, 4, 'Keyboard', 2900.00, 'Cancelled'),
(105, 2, 'Monitor', 30000.00, 'Completed'),
(106, 2, 'Headphones', 3500.00, 'Pending'),
(107, 7, 'Webcam', 40000.00, 'Completed'),
(108, 8, 'Speaker', 4500.00, 'Cancelled'),
(109, 9, 'Tablet', 50000.00, 'Completed'),
(110, 10, 'Watch', 5500.00, 'Pending');

