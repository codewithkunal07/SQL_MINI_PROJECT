CREATE DATABASE sql_mini_project;

USE sql_mini_project;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  city VARCHAR(50)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  amount INT
);

INSERT INTO customers (customer_id, name, city) VALUES
(1, 'Aditi', 'Delhi'),
(2, 'Rohan', 'Mumbai'),
(3, 'Meena', 'Pune'),
(4, 'Kabir', 'Jaipur'),
(5, 'Neha', 'Chennai'),
(6, 'Tanya', 'Bangalore'),
(7, 'Aman', 'Hyderabad'),
(8, 'Simran', 'Kolkata'),
(9, 'Vikram', 'Lucknow'),
(10, 'Priya', 'Indore'),
(11, 'Harsh', 'Delhi'),
(12, 'Sneha', 'Mumbai'),
(13, 'Raj', 'Pune'),
(14, 'Isha', 'Jaipur'),
(15, 'Karan', 'Chennai'),
(16, 'Divya', 'Bangalore'),
(17, 'Nikhil', 'Hyderabad'),
(18, 'Anjali', 'Kolkata'),
(19, 'Yash', 'Lucknow'),
(20, 'Pooja', 'Indore'),
(21, 'Manish', 'Delhi'),
(22, 'Ritika', 'Mumbai'),
(23, 'Sahil', 'Pune'),
(24, 'Bhavna', 'Jaipur'),
(25, 'Deepak', 'Chennai'),
(26, 'Komal', 'Bangalore'),
(27, 'Abhishek', 'Hyderabad'),
(28, 'Shruti', 'Kolkata'),
(29, 'Tarun', 'Lucknow'),
(30, 'Naina', 'Indore'),
(31, 'Gaurav', 'Delhi'),
(32, 'Rashi', 'Mumbai'),
(33, 'Mohit', 'Pune'),
(34, 'Payal', 'Jaipur'),
(35, 'Suresh', 'Chennai'),
(36, 'Kavita', 'Bangalore'),
(37, 'Ravi', 'Hyderabad'),
(38, 'Tina', 'Kolkata'),
(39, 'Arjun', 'Lucknow'),
(40, 'Preeti', 'Indore'),
(41, 'Varun', 'Delhi'),
(42, 'Mansi', 'Mumbai'),
(43, 'Dev', 'Pune'),
(44, 'Reena', 'Jaipur'),
(45, 'Ashish', 'Chennai'),
(46, 'Juhi', 'Bangalore'),
(47, 'Nitin', 'Hyderabad'),
(48, 'Ayesha', 'Kolkata'),
(49, 'Sunny', 'Lucknow'),
(50, 'Kritika', 'Indore');


INSERT INTO orders (order_id, customer_id, amount) VALUES
(101, 1, 5000),
(102, 2, 7000),
(103, 1, 3000),
(104, 5, 6000),
(105, 51, 4500),
(106, 52, 3200),
(107, 3, 2500),
(108, 4, 8000),
(109, 6, 1500),
(110, 7, 9000),
(111, 8, 1000),
(112, 9, 4000),
(113, 10, 3500),
(114, 11, 2700),
(115, 12, 2200),
(116, 13, 3300),
(117, 14, 2900),
(118, 15, 4100),
(119, 16, 3700),
(120, 17, 6200),
(121, 18, 5400),
(122, 19, 4600),
(123, 20, 5800),
(124, 21, 6100),
(125, 22, 4300),
(126, 23, 3900),
(127, 24, 5100),
(128, 25, 4700),
(129, 26, 4900),
(130, 27, 5200),
(131, 28, 4400),
(132, 29, 3600),
(133, 30, 3400),
(134, 31, 3000),
(135, 32, 2800),
(136, 33, 2600),
(137, 34, 2400),
(138, 35, 2200),
(139, 36, 2000),
(140, 37, 1800),
(141, 38, 1600),
(142, 39, 1400),
(143, 40, 1200),
(144, 41, 1000),
(145, 42, 900),
(146, 43, 800),
(147, 44, 700),
(148, 45, 600),
(149, 46, 500),
(150, 47, 400),
(151, 48, 300),
(152, 49, 200),
(153, 50, 100),
(154, 1, 5500),
(155, 2, 6500),
(156, 3, 7500),
(157, 4, 8500),
(158, 5, 9500),
(159, 51, 10500),
(160, 52, 11500),
(161, 53, 12500),
(162, 54, 13500),
(163, 55, 14500),
(164, 56, 15500),
(165, 57, 16500),
(166, 58, 17500),
(167, 59, 18500),
(168, 60, 19500);

SHOW TABLES;

SELECT * FROM customers;

SELECT * FROM orders;

# Query 1: Show all customers and their orders 

SELECT customers.name, orders.order_id, orders.amount
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;

# Query 2: Show all orders and their customers 

SELECT orders.order_id, orders.amount, COALESCE(customers.name, 'Unknown') AS customer_name
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id;

#Query 3: Simulate FULL OUTER JOIN 

SELECT COALESCE(customers.name, 'Unknown') AS customer_name, orders.amount
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id

UNION

SELECT COALESCE(customers.name, 'Unknown') AS customer_name, orders.amount
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id;

#Query 4: Total spend per customer

SELECT COALESCE(customers.name, 'Unknown') AS customer_name, SUM(orders.amount) AS total_spend
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.name

UNION

SELECT COALESCE(customers.name, 'Unknown') AS customer_name, SUM(orders.amount) AS total_spend
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.name;

# Query 5: Number of orders per customer

SELECT COALESCE(customers.name, 'Unknown') AS customer_name, COUNT(orders.order_id) AS order_count
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.name

UNION

SELECT COALESCE(customers.name, 'Unknown') AS customer_name, COUNT(orders.order_id) AS order_count
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.name;



