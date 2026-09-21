CREATE DATABASE IF NOT EXISTS baitap_join;

USE baitap_join;

CREATE TABLE Customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(20),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_id VARCHAR(20),
    customer_id VARCHAR(20),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(15,0),

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

DESCRIBE Customers;
DESCRIBE Orders;
DESCRIBE Order_Items;

INSERT INTO Customers
    (customer_id, customer_name)
VALUES
    ('C001', 'Nguyen Van An'),
    ('C002', 'Tran Thi Binh'),
    ('C003', 'Le Minh Chau');
    
INSERT INTO Orders
    (order_id, order_date, customer_id)
VALUES
    ('O001', '2026-09-01', 'C001'),
    ('O002', '2026-09-03', 'C002'),
    ('O003', '2026-09-05', 'C001'),
    ('O004', '2026-09-07', 'C003');
    
INSERT INTO Order_Items
    (order_id, customer_id, product_name, quantity, price)
VALUES
    ('O001', 'C001', 'Laptop', 1, 9000000),
    ('O001', 'C001', 'Mouse', 2, 500000),

    ('O002', 'C002', 'Smartphone', 1, 15000000),

    ('O003', 'C001', 'Keyboard', 1, 1200000),
    ('O003', 'C001', 'Monitor', 1, 3500000),

    ('O004', 'C003', 'Tablet', 1, 8000000),
    ('O004', 'C003', 'Headphones', 1, 2500000);
    
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
-- Mã đơn hàng + ngày đặt hàng + tên khách hàng
SELECT Orders.order_id,
       Orders.order_date,
       Customers.customer_name
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id;


-- Danh sách sản phẩm trong mỗi đơn hàng
SELECT Orders.order_id,
       Order_Items.product_name,
       Order_Items.quantity,
       Order_Items.price
FROM Orders
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id;


-- Tổng tiền của mỗi đơn hàng
SELECT order_id,
       SUM(quantity * price) AS total_amount
FROM Order_Items
GROUP BY order_id;


-- Đơn hàng có tổng tiền lớn hơn 10.000.000
SELECT order_id,
       SUM(quantity * price) AS total_amount
FROM Order_Items
GROUP BY order_id
HAVING SUM(quantity * price) > 10000000;

