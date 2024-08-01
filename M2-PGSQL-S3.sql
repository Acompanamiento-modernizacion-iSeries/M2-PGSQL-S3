-- 1. 
-- Selecciona todos los clientes junto con los detalles de sus cuentas.
SELECT Clientes.*, Cuentas_Bancarias.*
FROM Clientes
JOIN Cuentas_Bancarias ON Clientes.cliente_id = Cuentas_Bancarias.cliente_id;

-- 2. 
-- Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal.
SELECT Empleados.*, Sucursales.*
FROM Empleados
LEFT JOIN Sucursales ON Empleados.sucursal_id = Sucursales.sucursal_id;

-- 3. 
-- Selecciona todos los clientes y sus transacciones, incluyendo aquellas transacciones que no tienen clientes asignados.
SELECT Clientes.*, Transacciones.*
FROM Clientes
RIGHT JOIN Transacciones ON Clientes.cliente_id = Transacciones.cuenta_id;

-- 4. 
-- Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados.
SELECT Empleados.*, Sucursales.*
FROM Empleados
FULL OUTER JOIN Sucursales ON Empleados.sucursal_id = Sucursales.sucursal_id;

-- 5. 
-- Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.
SELECT Clientes.*
FROM Clientes
JOIN Cuentas_Bancarias ON Clientes.cliente_id = Cuentas_Bancarias.cliente_id
WHERE Cuentas_Bancarias.saldo > 5000;

-- 6. 
-- Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal, pero solo si la sucursal está en "New York".
SELECT Empleados.*, Sucursales.*
FROM Empleados
LEFT JOIN Sucursales ON Empleados.sucursal_id = Sucursales.sucursal_id
WHERE Sucursales.direccion = 'New York' OR Sucursales.direccion IS NULL;

-- 7. 
-- Selecciona todas las transacciones y los clientes asociados, incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100.
SELECT Transacciones.*, Clientes.*
FROM Transacciones
LEFT JOIN Clientes ON Transacciones.cuenta_id = Clientes.cliente_id
WHERE Transacciones.monto < 100;

-- 8. 
-- Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados, pero solo si el departamento está en "HR".
SELECT Empleados.*, Sucursales.*
FROM Empleados
FULL OUTER JOIN Sucursales ON Empleados.sucursal_id = Sucursales.sucursal_id
WHERE Sucursales.nombre = 'HR' OR Sucursales.nombre IS NULL;

-- 9. 
-- Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta.
SELECT Cuentas_Bancarias.*, Clientes.*, Transacciones.*
FROM Cuentas_Bancarias
JOIN Clientes ON Cuentas_Bancarias.cliente_id = Clientes.cliente_id
JOIN Transacciones ON Cuentas_Bancarias.cuenta_id = Transacciones.cuenta_id;

-- 10. 
-- Selecciona todas las transacciones, los clientes y las cuentas, incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.
SELECT Transacciones.*, Clientes.*, Cuentas_Bancarias.*
FROM Transacciones
LEFT JOIN Clientes ON Transacciones.cuenta_id = Clientes.cliente_id
LEFT JOIN Cuentas_Bancarias ON Transacciones.cuenta_id = Cuentas_Bancarias.cuenta_id;