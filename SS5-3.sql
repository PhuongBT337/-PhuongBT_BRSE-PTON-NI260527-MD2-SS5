CREATE DATABASE IF NOT EXISTS baitap_subquery;

USE baitap_subquery;

CREATE TABLE products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(15,0)
);

DESCRIBE products;

INSERT INTO products
    (product_id, product_name, category, price)
VALUES
    ('P001', 'Laptop Pro', 'Electronics', 30000000),
    ('P002', 'Smartphone', 'Electronics', 18000000),
    ('P003', 'Tablet', 'Electronics', 12000000),

    ('P004', 'Sofa', 'Furniture', 15000000),
    ('P005', 'Desk', 'Furniture', 8000000),

    ('P006', 'Refrigerator', 'Appliance', 22000000),
    ('P007', 'Washing Machine', 'Appliance', 14000000),
    ('P008', 'Microwave', 'Appliance', 5000000);
    
SELECT * FROM products;

-- Sản phẩm có giá cao hơn giá trung bình
SELECT *
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

-- Sản phẩm có giá cao nhất trong từng loại
SELECT *
FROM products p1
WHERE price = (
    SELECT MAX(price)
    FROM products p2
    WHERE p2.category = p1.category
);

-- Sản phẩm thuộc loại có ít nhất một sản phẩm giá trên 20.000.000
SELECT *
FROM products
WHERE category IN (
    SELECT category
    FROM products
    WHERE price > 20000000
);