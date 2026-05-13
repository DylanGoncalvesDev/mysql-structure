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
