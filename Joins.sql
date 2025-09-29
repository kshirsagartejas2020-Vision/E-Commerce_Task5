USE EcommerceDB;
GO

------------------------------------------------------------
-- 1. INNER JOIN
------------------------------------------------------------
-- Get all orders with customer details
SELECT o.order_id, c.first_name, c.last_name, o.status, o.total_amount
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

-- Get ordered products with order details
SELECT oi.order_id, p.product_name, oi.quantity, oi.price
FROM OrderItems oi
INNER JOIN Products p ON oi.product_id = p.product_id;

------------------------------------------------------------
-- 2. LEFT JOIN
------------------------------------------------------------
-- Get all customers and their orders (including those who never ordered)
SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.status
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- Get all products with reviews (include products with no reviews)
SELECT p.product_name, r.rating, r.review_text
FROM Products p
LEFT JOIN Reviews r ON p.product_id = r.product_id;

------------------------------------------------------------
-- 3. RIGHT JOIN
------------------------------------------------------------
-- Get all orders and their customers (include orders without customer info, if any)
SELECT o.order_id, o.status, c.first_name, c.last_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;

------------------------------------------------------------
-- 4. FULL OUTER JOIN
------------------------------------------------------------
-- Combine customers and orders (include customers without orders and orders without customers)
SELECT c.first_name, c.last_name, o.order_id, o.status
FROM Customers c
FULL OUTER JOIN Orders o ON c.customer_id = o.customer_id;

------------------------------------------------------------
-- 5. MULTIPLE JOINS
------------------------------------------------------------
-- Get full order details: customer name, product name, quantity, price
SELECT o.order_id, c.first_name + ' ' + c.last_name AS CustomerName,
       p.product_name, oi.quantity, oi.price, o.status
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN OrderItems oi ON o.order_id = oi.order_id
INNER JOIN Products p ON oi.product_id = p.product_id;
