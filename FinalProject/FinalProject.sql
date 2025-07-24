-- 1. Create the Database
CREATE DATABASE IF NOT EXISTS InventoryDB;
USE InventoryDB;

-- 2. Create Tables

-- Suppliers Table
CREATE TABLE Supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100)
);

-- Products Table
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2),
    reorder_level INT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

-- Warehouses Table
CREATE TABLE Warehouse (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    location VARCHAR(150)
);

-- Stock Table (Product per Warehouse)
CREATE TABLE Stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    quantity INT,
    UNIQUE (product_id, warehouse_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id)
);

-- 3. Insert Sample Data

-- Suppliers
INSERT INTO Supplier (supplier_name, contact_email) VALUES
('TechSource', 'tech@source.com'),
('MegaParts', 'sales@megaparts.com');

-- Products
INSERT INTO Product (product_name, unit_price, reorder_level, supplier_id) VALUES
('Laptop', 65000, 5, 1),
('Mouse', 450, 20, 1),
('Keyboard', 900, 10, 2);

-- Warehouses
INSERT INTO Warehouse (warehouse_name, location) VALUES
('Central Warehouse', 'Hyderabad'),
('Regional Depot', 'Bangalore');

-- Stock Records
INSERT INTO Stock (product_id, warehouse_id, quantity) VALUES
(1, 1, 10),  -- Laptop at Central
(2, 1, 15),  -- Mouse at Central
(3, 1, 5),   -- Keyboard at Central
(1, 2, 2),   -- Laptop at Regional (low stock)
(2, 2, 25);  -- Mouse at Regional

-- 4. View: Inventory Summary
CREATE VIEW inventory_status AS
SELECT
    p.product_name,
    w.warehouse_name,
    s.quantity,
    p.reorder_level
FROM Stock s
JOIN Product p ON s.product_id = p.product_id
JOIN Warehouse w ON s.warehouse_id = w.warehouse_id;

-- 5. Trigger: Low Stock Alert
DELIMITER $$
CREATE TRIGGER low_stock_alert
AFTER INSERT ON Stock
FOR EACH ROW
BEGIN
    DECLARE reorder_threshold INT;
    SELECT reorder_level INTO reorder_threshold
    FROM Product WHERE product_id = NEW.product_id;

    IF NEW.quantity < reorder_threshold THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = CONCAT('⚠️ LOW STOCK ALERT: ', NEW.quantity, ' units is below reorder level for Product ID ', NEW.product_id);
    END IF;
END$$
DELIMITER ;

-- 6. Stored Procedure: Transfer Stock Between Warehouses

DELIMITER $$
CREATE PROCEDURE transfer_stock (
    IN prod_id INT,
    IN from_wh INT,
    IN to_wh INT,
    IN qty INT
)
BEGIN
    -- Subtract from source
    UPDATE Stock
    SET quantity = quantity - qty
    WHERE product_id = prod_id AND warehouse_id = from_wh;

    -- Add to destination
    INSERT INTO Stock (product_id, warehouse_id, quantity)
    VALUES (prod_id, to_wh, qty)
    ON DUPLICATE KEY UPDATE quantity = quantity + qty;
END$$
DELIMITER ;

-- 7. Sample Queries

-- a) Show inventory levels per product and warehouse
SELECT * FROM inventory_status;

-- b) Products below reorder level
SELECT 
    p.product_name, 
    s.quantity, 
    p.reorder_level 
FROM Stock s
JOIN Product p ON s.product_id = p.product_id
WHERE s.quantity < p.reorder_level;

-- c) Total stock per product
SELECT 
    p.product_name, 
    SUM(s.quantity) AS total_quantity 
FROM Stock s
JOIN Product p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- d) Transfer example: Move 2 laptops from warehouse 1 to warehouse 2
CALL transfer_stock(1, 1, 2, 2);
