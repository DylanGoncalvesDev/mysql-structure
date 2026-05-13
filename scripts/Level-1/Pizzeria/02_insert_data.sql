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
