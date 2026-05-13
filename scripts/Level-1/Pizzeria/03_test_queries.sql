
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
