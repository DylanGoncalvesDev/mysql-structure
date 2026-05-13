-- Consulta 1:
-- Lista el total de compras de un cliente/a.

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

-- Consulta 2:
-- Lista las distintas gafas que ha vendido un empleado durante un año.

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

-- Consulta 3:
-- Lista a los diferentes proveedores que han suministrado gafas vendidas con éxito por la óptica.

SELECT DISTINCT 
    Suppliers.supplier_id,
    Suppliers.supplier_name
FROM Suppliers
JOIN Brands ON Brands.supplier_id = Suppliers.supplier_id
JOIN Glasses ON Glasses.brand_id = Brands.brand_id
JOIN Sale_Details ON Sale_Details.glasses_id = Glasses.glasses_id
