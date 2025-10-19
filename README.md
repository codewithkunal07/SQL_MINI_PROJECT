# 🚀 SQL Mini Project: Customer Orders Analytics

![SQL Badge](https://img.shields.io/badge/SQL-MySQL-blue?style=flat-square)
![Status](https://img.shields.io/badge/Project-Complete-brightgreen?style=flat-square)
![Author](https://img.shields.io/badge/Author-Kunal-black?style=flat-square)

## 📌 Overview

This project demonstrates a well-structured SQL database for managing customer orders and analyzing purchasing behavior. It includes schema creation, data population, and advanced queries using joins and aggregations.

> 💡 Built to simulate real-world scenarios like missing customer references, multiple orders per customer, and city-based segmentation.

---

## 🧱 Database Schema

### 🧑‍💼 `customers`
Stores customer information.

| Column        | Type         | Description         |
|---------------|--------------|---------------------|
| `customer_id` | `INT`        | Unique customer ID  |
| `name`        | `VARCHAR(50)`| Customer name       |
| `city`        | `VARCHAR(50)`| City of residence   |

### 📦 `orders`
Stores order details.

| Column        | Type         | Description         |
|---------------|--------------|---------------------|
| `order_id`    | `INT`        | Unique order ID     |
| `customer_id` | `INT`        | Linked customer ID  |
| `amount`      | `INT`        | Order value (₹)     |

---

## 📊 Key SQL Queries

### 🔗 Customers and Their Orders
```sql
SELECT customers.name, orders.order_id, orders.amount
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
```

### 🔍 Orders and Their Customers
```sql
SELECT orders.order_id, orders.amount, COALESCE(customers.name, 'Unknown') AS customer_name
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id;
```

### 🔄 Simulated FULL OUTER JOIN
```sql
SELECT COALESCE(customers.name, 'Unknown') AS customer_name, orders.amount
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
UNION
SELECT COALESCE(customers.name, 'Unknown') AS customer_name, orders.amount
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id;
```

### 💰 Total Spend Per Customer
```sql
SELECT COALESCE(customers.name, 'Unknown') AS customer_name, SUM(orders.amount) AS total_spend
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.name
UNION
SELECT COALESCE(customers.name, 'Unknown') AS customer_name, SUM(orders.amount) AS total_spend
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.name;
```

### 📈 Number of Orders Per Customer
```sql
SELECT COALESCE(customers.name, 'Unknown') AS customer_name, COUNT(orders.order_id) AS order_count
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.name
UNION
SELECT COALESCE(customers.name, 'Unknown') AS customer_name, COUNT(orders.order_id) AS order_count
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.name;
```

---

## 🧠 Concepts Covered

- ✅ Relational schema design
- ✅ LEFT, RIGHT, and FULL OUTER JOIN simulation
- ✅ Aggregation with `SUM` and `COUNT`
- ✅ Handling missing foreign keys using `COALESCE`
- ✅ UNION operations for comprehensive data views

---

## 🛠️ Tech Stack

- **Database:** MySQL
- **Language:** SQL
- **Tools:** MySQL Workbench / phpMyAdmin / CLI

---

## 👨‍💻 Author

**Kunal** — Passionate about data, logic, and clean design.  
🔗 [LinkedIn Profile](https://www.linkedin.com/in/kunal-93a776349/)

