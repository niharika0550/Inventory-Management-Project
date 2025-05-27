CREATE TABLE inventory (
    sku VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(255),
    stock_status VARCHAR(50),
    last_activity_date DATE
);

CREATE TABLE sales (
    sales_id INT PRIMARY KEY,
    sku VARCHAR(50),
    qty_sold INT,
    date DATE,
    status VARCHAR(50),
    FOREIGN KEY (sku) REFERENCES inventory(sku)
);

CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    sku VARCHAR(50),
    date DATE,
    qty_purchased INT,
    status VARCHAR(50),
    FOREIGN KEY (sku) REFERENCES inventory(sku)
);

INSERT INTO inventory (sku, product_name, stock_status, last_activity_date) VALUES
('CLTH-1001', 'Classic White T-Shirt', 'In Stock', '2025-04-01'),
('CLTH-1002', 'Slim Fit Jeans', 'In Stock', '2025-04-02'),
('CLTH-1003', 'Hooded Sweatshirt', 'Low Stock', '2025-04-03'),
('CLTH-1004', 'Denim Jacket', 'In Stock', '2025-03-30'),
('CLTH-1005', 'Cotton Shorts', 'Out of Stock', '2025-03-28'),
('CLTH-1006', 'Polo Shirt', 'In Stock', '2025-04-01'),
('CLTH-1007', 'Chino Pants', 'In Stock', '2025-04-04'),
('CLTH-1008', 'Athletic Joggers', 'Low Stock', '2025-04-02'),
('CLTH-1009', 'Casual Blazer', 'In Stock', '2025-04-03'),
('CLTH-1010', 'Graphic Tee', 'In Stock', '2025-04-05');


INSERT INTO sales (sales_id, sku, qty_sold, date, status) VALUES
(201, 'CLTH-1001', 50, '2025-04-01', 'Completed'),
(202, 'CLTH-1002', 40, '2025-04-02', 'Completed'),
(203, 'CLTH-1003', 25, '2025-04-02', 'Pending'),
(204, 'CLTH-1004', 60, '2025-04-03', 'Completed'),
(205, 'CLTH-1005', 80, '2025-04-03', 'Cancelled'),
(206, 'CLTH-1006', 90, '2025-04-04', 'Completed'),
(207, 'CLTH-1007', 70, '2025-04-04', 'Completed'),
(208, 'CLTH-1008', 55, '2025-04-05', 'Pending'),
(209, 'CLTH-1009', 65, '2025-04-05', 'Completed'),
(210, 'CLTH-1010', 100, '2025-04-06', 'Completed');

INSERT INTO purchases (purchase_id, sku, date, qty_purchased, status) VALUES
(301, 'CLTH-1001', '2025-03-25', 150, 'Received'),
(302, 'CLTH-1002', '2025-03-26', 100, 'Received'),
(303, 'CLTH-1003', '2025-03-27', 80, 'Pending'),
(304, 'CLTH-1004', '2025-03-28', 120, 'Received'),
(305, 'CLTH-1005', '2025-03-28', 90, 'Cancelled'),
(306, 'CLTH-1006', '2025-03-29', 130, 'Received'),
(307, 'CLTH-1007', '2025-03-30', 110, 'Pending'),
(308, 'CLTH-1008', '2025-03-31', 95, 'Received'),
(309, 'CLTH-1009', '2025-04-01', 85, 'Received'),
(310, 'CLTH-1010', '2025-04-02', 160, 'Received');