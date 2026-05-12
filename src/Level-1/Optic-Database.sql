CREATE DATABASE optic;

USE optic;

CREATE TABLE Suppliers(
supplier_id INT AUTO_INCREMENT PRIMARY KEY,
supplier_name VARCHAR(100) NOT NULL,
street VARCHAR(100) NOT NULL,
street_number VARCHAR(10) NOT NULL,
floor_number VARCHAR(10) NOT NULL,
door VARCHAR(10) NOT NULL,
city VARCHAR(50) NOT NULL,
postal_code VARCHAR(10) NOT NULL,
country VARCHAR(55) NOT NULL,
phone_number VARCHAR(20) NOT NULL,
fax VARCHAR(20) NOT NULL,
nif VARCHAR(20) NOT NULL,

CONSTRAINT unique_nif_country UNIQUE (nif, country)
);

CREATE TABLE Brands(
brand_id INT AUTO_INCREMENT PRIMARY KEY,
brand_name VARCHAR(100) NOT NULL,
supplier_id INT NOT NULL,

CONSTRAINT fk_brands_supplier
FOREIGN KEY (supplier_id)
REFERENCES Suppliers(supplier_id)

ON UPDATE CASCADE
ON DELETE NO ACTION,

CONSTRAINT unique_brand_name UNIQUE (brand_name)
);

CREATE TABLE Glasses(
glasses_id INT AUTO_INCREMENT PRIMARY KEY,
left_eye_prescription DECIMAL(4,2) NOT NULL,
right_eye_prescription DECIMAL(4,2) NOT NULL,
frame_type ENUM('flotante','pasta','metalica') NOT NULL,
frame_color VARCHAR(20) NOT NULL,
left_lens_color VARCHAR(20) NOT NULL,
right_lens_color VARCHAR(20) NOT NULL,
price DECIMAL(10,2) UNSIGNED NOT NULL,
brand_id INT NOT NULL,

CONSTRAINT fk_brand_glasses
FOREIGN KEY (brand_id) 
REFERENCES Brands (brand_id)

ON UPDATE CASCADE
ON DELETE NO ACTION
);

CREATE TABLE Customers(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
customer_last_names VARCHAR(100) NOT NULL,
street VARCHAR(100) NOT NULL,
street_number VARCHAR(10) NOT NULL,
floor_number VARCHAR(10) NOT NULL,
door VARCHAR(10) NOT NULL,
city VARCHAR(50) NOT NULL,
postal_code VARCHAR(10) NOT NULL,
country  VARCHAR(55) NOT NULL,
phone_number VARCHAR(20) NOT NULL,
email VARCHAR(254) NOT NULL,
customer_record_date DATE NOT NULL DEFAULT(CURRENT_DATE),
referrer_customer_id INT NULL,



CONSTRAINT fk_referrer_customer
FOREIGN KEY (referrer_customer_id) 
REFERENCES Customers(customer_id)

ON UPDATE CASCADE
ON DELETE SET NULL
);

CREATE TABLE Employees(
employee_id INT AUTO_INCREMENT PRIMARY KEY,
employee_name VARCHAR(100) NOT NULL,
employee_last_names VARCHAR(100) NOT NULL
);

CREATE TABLE Sales(
sale_id INT AUTO_INCREMENT PRIMARY KEY,
employee_id INT NOT NULL,
customer_id INT NOT NULL,
total_price DECIMAL(10,2) UNSIGNED NOT NULL,
sale_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_seller_employee
FOREIGN KEY (employee_id) 
REFERENCES Employees(employee_id)

ON UPDATE CASCADE
ON DELETE NO ACTION,

CONSTRAINT fk_buyer_customer
FOREIGN KEY (customer_id) 
REFERENCES Customers(customer_id)

ON UPDATE CASCADE
ON DELETE NO ACTION
);

CREATE TABLE Sale_Details(
sale_id INT NOT NULL,
glasses_id INT NOT NULL,
quantity INT UNSIGNED NOT NULL,
unit_price DECIMAL(10,2) UNSIGNED NOT NULL,

CONSTRAINT pk_sale_details PRIMARY KEY (sale_id, glasses_id),

CONSTRAINT fk_sales
FOREIGN KEY (sale_id)
REFERENCES Sales(sale_id)

ON UPDATE CASCADE
ON DELETE NO ACTION,

CONSTRAINT fk_sold_glasses
FOREIGN KEY (glasses_id)
REFERENCES Glasses(glasses_id)

ON UPDATE CASCADE
ON DELETE NO ACTION
);

INSERT INTO Suppliers
(supplier_name, street, street_number, floor_number, door, city, postal_code, country, phone_number, fax, nif)
VALUES
('Marchon Eyewear', 'Gran Via', '25', '3', 'A', 'Barcelona', '08010', 'Spain', '934567890', '934567891', 'B12345678'),
('Essilor Luxottica', 'Calle Mayor', '10', '1', 'B', 'Madrid', '28013', 'Spain', '915678900', '915678901', 'B87654321'),
('Marcolin', 'Avenida Diagonal', '100', '5', 'C', 'Barcelona', '08018', 'Spain', '936001122', '936001123', 'B11223344');

INSERT INTO Brands
(brand_name, supplier_id)
VALUES
('RayBan', 1),
('Oakley', 1),
('Polaroid', 2),
('Carrera', 3);

INSERT INTO Glasses
(left_eye_prescription, right_eye_prescription, frame_type, frame_color, left_lens_color, right_lens_color, price, brand_id)
VALUES
(-1.25, -1.00, 'metalica', 'negro', 'transparente', 'transparente', 120.00, 1),
(-2.00, -2.25, 'pasta', 'azul', 'gris', 'gris', 95.50, 1),
(0.50, 0.75, 'flotante', 'plateado', 'transparente', 'transparente', 150.00, 2),
(-0.75, -0.50, 'pasta', 'rojo', 'marron', 'marron', 80.00, 3),
(-3.00, -2.75, 'metalica', 'dorado', 'verde', 'verde', 180.00, 4);

INSERT INTO Customers
(customer_name, customer_last_names, street, street_number, floor_number, door, city, postal_code, country, phone_number, email, customer_record_date, referrer_customer_id)
VALUES
('Ana', 'Garcia Lopez', 'Calle Sol', '5', '2', 'A', 'Barcelona', '08001', 'Spain', '600111222', 'ana@mail.com', '2025-01-10', NULL),
('Luis', 'Martinez Ruiz', 'Calle Luna', '8', '1', 'B', 'Barcelona', '08002', 'Spain', '600333444', 'luis@mail.com', '2025-02-15', 1),
('Marta', 'Sanchez Perez', 'Calle Mar', '12', '4', 'C', 'Madrid', '28001', 'Spain', '600555666', 'marta@mail.com', '2025-03-20', 1),
('Jorge', 'Ruiz Molina', 'Calle Norte', '3', '0', 'D', 'Valencia', '46001', 'Spain', '600777888', 'jorge@mail.com', '2025-04-05', 2);

INSERT INTO Employees
(employee_name, employee_last_names)
VALUES
('Carlos', 'Perez Gomez'),
('Laura', 'Navas Torres'),
('Sofia', 'Ramos Gil');

INSERT INTO Sales
(employee_id, customer_id, total_price, sale_date)
VALUES
(1, 1, 215.50, '2025-04-10 10:30:00'),
(1, 2, 150.00, '2025-06-15 12:00:00'),
(2, 3, 200.00, '2026-01-20 17:45:00'),
(3, 4, 180.00, '2025-09-03 11:15:00');

INSERT INTO Sale_Details
(sale_id, glasses_id, quantity, unit_price)
VALUES
(1, 1, 1, 120.00),
(1, 2, 1, 95.50),
(2, 3, 1, 150.00),
(3, 4, 2, 80.00),
(3, 1, 1, 40.00),
(4, 5, 1, 180.00);

SELECT
    Customers.customer_id,
    Customers.customer_name,
    Customers.customer_last_names,
	COUNT(Sales.sale_id) AS total_purchases,
    SUM(Sales.total_price) AS total_buys
FROM Customers
JOIN Sales ON Sales.customer_id = Customers.customer_id
WHERE Customers.customer_id = 1
GROUP BY
    Customers.customer_id,
    Customers.customer_name,
    Customers.customer_last_names;

SELECT DISTINCT
    Employees.employee_id,
    Employees.employee_name,
    Employees.employee_last_names,
    Glasses.glasses_id,
    Brands.brand_name,
    Glasses.price
FROM Employees 
JOIN Sales ON Sales.employee_id = Employees.employee_id   
JOIN Sale_Details ON Sale_Details.sale_id = Sales.sale_id
JOIN Glasses ON Sale_Details.glasses_id = Glasses.glasses_id
JOIN Brands ON Glasses.brand_id = Brands.brand_id
WHERE Employees.employee_id = 1
AND Sales.sale_date >= '2025-01-01'
AND Sales.sale_date < '2026-01-01';

SELECT DISTINCT 
    Suppliers.supplier_id,
    Suppliers.supplier_name
FROM Suppliers
JOIN Brands ON Brands.supplier_id = Suppliers.supplier_id
JOIN Glasses ON Glasses.brand_id = Brands.brand_id
JOIN Sale_Details ON Sale_Details.glasses_id = Glasses.glasses_id
