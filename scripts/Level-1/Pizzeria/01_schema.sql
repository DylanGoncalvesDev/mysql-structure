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
