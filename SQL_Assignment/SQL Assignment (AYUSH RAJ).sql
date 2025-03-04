create database e_commerce;
use e_commerce;

-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    mobile VARCHAR(15),
    age INT
);

-- Create Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(200),
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50)
);

-- 1. Add NOT NULL constraint on name and email in the Customers table
ALTER TABLE Customers 
MODIFY name VARCHAR(50) NOT NULL, 
MODIFY email VARCHAR(50) NOT NULL;

-- 2. Add UNIQUE key on email in the Customers table
ALTER TABLE Customers 
ADD CONSTRAINT unique_email UNIQUE (email);

-- 3. Add column age in the Customers table
ALTER TABLE Customers 
ADD COLUMN age INT;

-- 4. Change column name from id to product_id in the Products table
ALTER TABLE Products 
CHANGE COLUMN id product_id INT;

-- 5. Add PRIMARY KEY and AUTO_INCREMENT on product_id in the Products table
ALTER TABLE Products 
MODIFY product_id INT AUTO_INCREMENT PRIMARY KEY;

-- 6. Change datatype of description from VARCHAR to TEXT in the Products table
ALTER TABLE Products 
MODIFY description TEXT;

-- Create Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    status ENUM('Pending', 'Success', 'Cancel') DEFAULT 'Pending',
    payment_method ENUM('Credit', 'Debit', 'UPI', 'COD'),
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 1. Change table name from Order to Orders
ALTER TABLE `Order` RENAME TO Orders;

-- 2. Set default value 'Pending' in status column
ALTER TABLE Orders 
MODIFY status ENUM('Pending', 'Success', 'Cancel') DEFAULT 'Pending';

-- 3. Modify payment_method ENUM to add one more value: 'COD'
ALTER TABLE Orders 
MODIFY payment_method ENUM('Credit', 'Debit', 'UPI', 'COD');

-- 4. Make product_id a foreign key
ALTER TABLE Orders 
ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES Products(product_id);

-- Insert sample data for Customers
INSERT INTO Customers (name, email, mobile, age) VALUES 
('Virat Kohli', 'virat@eg.com', '9876543210', 35),
('MS Dhoni', 'dhoni@eg.com', '8765432109', 42),
('Sachin Tendulkar', 'sachin@eg.com', '7654321098', 50),
('Rohit Sharma', 'rohit@eg.com', '6543210987', 36),
('Smriti Mandhana', 'smriti@eg.com', '5432109876', 27),
('Harmanpreet Kaur', 'harman@eg.com', '4321098765', 34),
('Deepika Padukone', 'deepika@eg.com', '3210987654', 38),
('Priyanka Chopra', 'priyanka@eg.com', '2109876543', 41),
('Katrina Kaif', 'katrina@eg.com', '1098765432', 40),
('Anushka Sharma', 'anushka@eg.com', '1987654321', 35),
('Yuvraj Singh', 'yuvraj@eg.com', '2876543210', 42),
('Suresh Raina', 'raina@eg.com', '3765432109', 37),
('Shubman Gill', 'gill@eg.com', '4654321098', 24),
('Rashmika Mandanna', 'rashmika@eg.com', '5543210987', 28),
('Tamannaah Bhatia', 'tamannaah@eg.com', '6432109876', 34),
('Vicky Kaushal', 'vicky@eg.com', '7321098765', 35),
('Alia Bhatt', 'alia@eg.com', '8210987654', 31),
('Rishabh Pant', 'pant@eg.com', '9109876543', 26),
('Shreyas Iyer', 'iyer@eg.com', '9998765432', 29),
('Jasprit Bumrah', 'bumrah@eg.com', '8887654321', 30),
('Ravi Ashwin', 'rashwin@eg.com','9921234302', 39);


-- Insert sample data for Products
INSERT INTO Products (name, description, price, category) VALUES 
('Smartphone', 'High-end smartphone', 25000, 'Electronics'),
('Laptop', 'Gaming laptop', 80000, 'Electronics'),
('Tablet', '10-inch tablet', 16000, 'Electronics'),
('Headphones', 'Noise-canceling headphones', 6000, 'Electronics'),
('Smartwatch', 'Fitness tracking smartwatch', 11000, 'Electronics'),
('Bluetooth Speaker', 'Portable speaker', 3500, 'Electronics'),
('Monitor', '27-inch 4K monitor', 30000, 'Electronics'),
('Keyboard', 'Mechanical keyboard', 5000, 'Electronics'),
('Mouse', 'Wireless mouse', 2000, 'Electronics'),
('Printer', 'Laser printer', 13000, 'Electronics'),
('Desk Chair', 'Ergonomic office chair', 10000, 'Furniture'),
('Sofa', '3-seater sofa', 25000, 'Furniture'),
('Dining Table', '6-person dining table', 20000, 'Furniture'),
('Bookshelf', 'Wooden bookshelf', 8000, 'Furniture'),
('Bed Frame', 'King-size bed frame', 30000, 'Furniture'),
('Shoes', 'Running shoes', 4000, 'Apparel'),
('T-Shirt', 'Cotton t-shirt', 800, 'Apparel'),
('Jeans', 'Denim jeans', 2500, 'Apparel'),
('Jacket', 'Winter jacket', 6000, 'Apparel'),
('Backpack', 'Travel backpack', 3500, 'Accessories'),
('Sofa', 'Mid-Century', 20000, 'Furniture');

-- Insert sample data for Orders
INSERT INTO Orders (customer_id, product_id, quantity, order_date, status, payment_method, total_amount) VALUES 
(1, 1, 2, '2024-02-01', 'Success', 'Credit', 50000),
(2, 2, 1, '2024-02-02', 'Pending', 'UPI', 80000),
(3, 3, 1, '2024-02-03', 'Success', 'Debit', 16000),
(4, 4, 2, '2024-02-04', 'Cancel', 'Credit', 12000),
(5, 5, 1, '2024-02-05', 'Pending', 'COD', 11000),
(6, 6, 3, '2024-02-06', 'Success', 'UPI', 10500),
(7, 7, 1, '2024-02-07', 'Success', 'Credit', 30000),
(8, 8, 2, '2024-02-08', 'Pending', 'Debit', 10000),
(9, 9, 1, '2024-02-09', 'Success', 'COD', 2000),
(10, 10, 1, '2024-02-10', 'Cancel', 'UPI', 13000),
(11, 11, 1, '2024-02-11', 'Pending', 'Credit', 10000),
(12, 12, 2, '2024-02-12', 'Success', 'Debit', 50000),
(13, 13, 1, '2024-02-13', 'Pending', 'COD', 20000),
(14, 14, 1, '2024-02-14', 'Success', 'UPI', 8000),
(15, 15, 2, '2024-02-15', 'Cancel', 'Credit', 60000),
(16, 16, 1, '2024-02-16', 'Pending', 'Debit', 4000),
(17, 17, 2, '2024-02-17', 'Success', 'COD', 1600),
(18, 18, 1, '2024-02-18', 'Pending', 'UPI', 2500),
(19, 19, 1, '2024-02-19', 'Success', 'Credit', 6000),
(20, 20, 2, '2024-02-20', 'Cancel', 'Debit', 7000);

-- 1. Count the number of products as product_count in each category.
SELECT category, COUNT(*) AS product_count
FROM Products
GROUP BY category;

-- 2. Retrieve all products that belong to the 'Electronics' category, have a price between 5000 and 50000 INR, 
-- and whose name contains the letter 'a'.
SELECT * FROM Products
WHERE category = 'Electronics'
AND price BETWEEN 5000 AND 50000
AND name LIKE '%a%';

-- 3. Get the top 5 most expensive products in the 'Electronics' category, skipping the first 2.
SELECT * FROM Products
WHERE category = 'Electronics'
ORDER BY price DESC
LIMIT 5 OFFSET 2;

-- 4. Retrieve customers who have not placed any orders.
SELECT * FROM Customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders);

-- 5. Find the average total amount spent by each customer.
SELECT c.customer_id, c.name, COALESCE(AVG(o.total_amount), 0) AS avg_spent
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- 6. Get the products that have a price less than the average price of all products.
SELECT * FROM Products
WHERE price < (SELECT AVG(price) FROM Products);

-- 7. Calculate the total quantity of products ordered by each customer.
SELECT c.customer_id, c.name, COALESCE(SUM(o.quantity), 0) AS total_quantity
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- 8. List all orders along with customer name and product name.
SELECT o.order_id, c.name AS customer_name, p.name AS product_name, o.quantity, o.order_date,
o.status, o.payment_method, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id;

-- 9. Find products that have never been ordered.
SELECT * FROM Products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Orders);

