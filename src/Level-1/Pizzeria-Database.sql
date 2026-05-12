CREATE DATABASE pizzeria;

USE pizzeria;

CREATE TABLE Customer (
    id_customer INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_last_names VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE Store (
    id_store INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(200) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    id_employee INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    employee_last_names VARCHAR(100) NOT NULL,
    nif VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    employee_type ENUM('cook', 'delivery_driver') NOT NULL,
    id_store INT NOT NULL,

    CONSTRAINT unique_employee_nif UNIQUE (nif),

    CONSTRAINT fk_employee_store
    FOREIGN KEY (id_store)
    REFERENCES Store(id_store)
    
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

CREATE TABLE Categories (
    id_category INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Products (
    id_product INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_type ENUM('pizza', 'hamburger', 'drink') NOT NULL,
    product_description TEXT NOT NULL,
    image VARCHAR(255) NOT NULL,
    product_price DECIMAL(10,2) UNSIGNED NOT NULL
);

CREATE TABLE Pizzas (
    id_product INT PRIMARY KEY,
    id_category INT NOT NULL,

    CONSTRAINT fk_pizza_product
    FOREIGN KEY (id_product)
    REFERENCES Products(id_product)
    
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    CONSTRAINT fk_pizza_category
    FOREIGN KEY (id_category)
    REFERENCES Categories(id_category)
    
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

CREATE TABLE Orders (
    id_order INT AUTO_INCREMENT PRIMARY KEY,
    delivery_type ENUM('delivery', 'pickup') NOT NULL,
    total_price DECIMAL(10,2) UNSIGNED NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_store INT NOT NULL,
    id_customer INT NOT NULL,

    CONSTRAINT fk_orders_store
    FOREIGN KEY (id_store)
    REFERENCES Store(id_store)
    
    ON UPDATE CASCADE
    ON DELETE NO ACTION,

    CONSTRAINT fk_orders_customer
    FOREIGN KEY (id_customer)
    REFERENCES Customer(id_customer)
    
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

CREATE TABLE Order_Details (
    id_order INT NOT NULL,
    id_product INT NOT NULL,
    cantidad_productos INT UNSIGNED NOT NULL,
    unit_price DECIMAL(10,2) UNSIGNED NOT NULL,

    CONSTRAINT pk_order_details PRIMARY KEY (id_order, id_product),

    CONSTRAINT fk_order_details_order
    FOREIGN KEY (id_order)
    REFERENCES Orders(id_order)
    
    ON UPDATE CASCADE
    ON DELETE NO ACTION,

    CONSTRAINT fk_order_details_product
    FOREIGN KEY (id_product)
    REFERENCES Products(id_product)
    
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

CREATE TABLE Deliveries (
    id_order INT PRIMARY KEY,
    id_employee INT NOT NULL,
    delivery_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_delivery_order
    FOREIGN KEY (id_order)
    REFERENCES Orders(id_order)
    
    ON UPDATE CASCADE
    ON DELETE NO ACTION,

    CONSTRAINT fk_delivery_employee
    FOREIGN KEY (id_employee)
    REFERENCES Employees(id_employee)
    
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

INSERT INTO Customer
(customer_name, customer_last_names, address, postal_code, city, province, phone_number)
VALUES
('Ana', 'Garcia Lopez', 'Calle Sol 5', '08001', 'Barcelona', 'Barcelona', '600111222'),
('Luis', 'Martinez Ruiz', 'Calle Luna 8', '08002', 'Barcelona', 'Barcelona', '600333444'),
('Marta', 'Sanchez Perez', 'Calle Mayor 10', '28013', 'Madrid', 'Madrid', '600555666'),
('Jorge', 'Ruiz Molina', 'Avenida Norte 3', '46001', 'Valencia', 'Valencia', '600777888');

INSERT INTO Store
(address, postal_code, city, province)
VALUES
('Gran Via 100', '08010', 'Barcelona', 'Barcelona'),
('Calle Alcala 50', '28014', 'Madrid', 'Madrid');

INSERT INTO Employees
(employee_name, employee_last_names, nif, phone_number, employee_type, id_store)
VALUES
('Carlos', 'Perez Gomez', '12345678A', '611111111', 'cook', 1),
('Laura', 'Navas Torres', '87654321B', '622222222', 'delivery_driver', 1),
('Sofia', 'Ramos Gil', '11223344C', '633333333', 'delivery_driver', 2),
('Mario', 'Lopez Cano', '44332211D', '644444444', 'cook', 2);

INSERT INTO Categories
(category_name)
VALUES
('Clasicas'),
('Especiales'),
('Vegetarianas');

INSERT INTO Products
(product_name, product_type, product_description, image, product_price)
VALUES
('Pizza Margarita', 'pizza', 'Pizza con tomate, mozzarella y albahaca', 'pizza_margarita.jpg', 8.50),
('Pizza Barbacoa', 'pizza', 'Pizza con salsa barbacoa, carne y queso', 'pizza_barbacoa.jpg', 10.50),
('Pizza Vegetal', 'pizza', 'Pizza con verduras variadas', 'pizza_vegetal.jpg', 9.50),
('Hamburguesa Clasica', 'hamburger', 'Hamburguesa con queso, lechuga y tomate', 'hamburguesa_clasica.jpg', 7.00),
('Coca Cola', 'drink', 'Refresco de cola 33cl', 'coca_cola.jpg', 2.00),
('Agua Mineral', 'drink', 'Botella de agua 50cl', 'agua.jpg', 1.50),
('Cerveza', 'drink', 'Cerveza 33cl', 'cerveza.jpg', 2.50);

INSERT INTO Pizzas
(id_product, id_category)
VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Orders
(delivery_type, total_price, order_date, id_store, id_customer)
VALUES
('delivery', 23.00, '2025-04-10 13:30:00', 1, 1),
('pickup', 12.50, '2025-04-11 20:15:00', 1, 2),
('delivery', 17.50, '2025-04-12 21:00:00', 2, 3),
('delivery', 11.00, '2025-04-13 14:45:00', 1, 4);

INSERT INTO Order_Details
(id_order, id_product, cantidad_productos, unit_price)
VALUES
(1, 1, 2, 8.50),
(1, 5, 3, 2.00),
(2, 2, 1, 10.50),
(2, 6, 1, 1.50),
(3, 4, 2, 7.00),
(3, 7, 1, 2.50),
(3, 6, 1, 1.50),
(4, 3, 1, 9.50),
(4, 6, 1, 1.50);

INSERT INTO Deliveries
(id_order, id_employee, delivery_date)
VALUES
(1, 2, '2025-04-10 14:05:00'),
(3, 3, '2025-04-12 21:35:00'),
(4, 2, '2025-04-13 15:20:00');

-- Consulta 1:
-- Lista cuántos productos de tipo "Bebidas" se han vendido en una determinada localidad.

SELECT
    Store.city,
    SUM(Order_Details.cantidad_productos) AS total_drinks_sold
FROM Store
JOIN Orders ON Orders.id_store = Store.id_store
JOIN Order_Details ON Order_Details.id_order = Orders.id_order
JOIN Products ON Products.id_product = Order_Details.id_product
WHERE Products.product_type = 'drink'
  AND Store.city = 'Barcelona'
GROUP BY Store.city;

-- Consulta 2:
-- Lista cuántos pedidos ha efectuado un determinado empleado/a.

SELECT
    Employees.id_employee,
    Employees.employee_name,
    Employees.employee_last_names,
    COUNT(Deliveries.id_order) AS total_orders_delivered
FROM Employees
JOIN Deliveries ON Deliveries.id_employee = Employees.id_employee
WHERE Employees.id_employee = 2
GROUP BY
    Employees.id_employee,
    Employees.employee_name,
    Employees.employee_last_names;
