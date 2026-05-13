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