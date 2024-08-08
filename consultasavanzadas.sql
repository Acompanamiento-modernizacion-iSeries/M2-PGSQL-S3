-- Taller nro 3 consultas avanzadas, CAMILO ANDRES GARCIA CRUZ
-- 1. Selecciona todos los clientes junto con los detalles de sus cuentas.
SELECT 
    Clientes.*, 
    CuentasBancarias.* 
FROM 
    Clientes 
JOIN 
    CuentasBancarias 
ON 
    Clientes.cliente_id = CuentasBancarias.cliente_id;

-- 2. Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal.
SELECT 
    Empleados.*, 
    Sucursales.* 
FROM 
    Empleados 
LEFT JOIN 
    Sucursales 
ON 
    Empleados.sucursal_id = Sucursales.sucursal_id;

-- 3. Selecciona todos los clientes y sus transacciones, incluyendo aquellas transacciones que no tienen clientes asignados.
SELECT 
    Clientes.*, 
    Transacciones.* 
FROM 
    Clientes 
RIGHT JOIN 
    CuentasBancarias 
ON 
    Clientes.cliente_id = CuentasBancarias.cliente_id 
RIGHT JOIN 
    Transacciones 
ON 
    CuentasBancarias.cuenta_id = Transacciones.cuenta_id;

-- 4. Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados.
SELECT
    Empleados.*,
    Sucursales.*
FROM
    Empleados
FULL OUTER JOIN
    Sucursales
ON
    Empleados.sucursal_id = Sucursales.sucursal_id;

-- 5. Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.
SELECT 
    Clientes.* 
FROM 
    Clientes 
JOIN 
    CuentasBancarias 
ON 
    Clientes.cliente_id = CuentasBancarias.cliente_id 
WHERE 
    CuentasBancarias.saldo > 5000;

-- 6. Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal, pero solo si la sucursal está en "New York".
SELECT 
    Empleados.*, 
    Sucursales.* 
FROM 
    Empleados 
LEFT JOIN 
    Sucursales 
ON 
    Empleados.sucursal_id = Sucursales.sucursal_id 
WHERE 
    Sucursales.direccion LIKE '%New York%';	
	
-- 7. Selecciona todas las transacciones y los clientes asociados, incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100.
SELECT
    Transacciones.*,
    Clientes.*
FROM
    Transacciones
LEFT JOIN
    CuentasBancarias ON Transacciones.cuenta_id = CuentasBancarias.cuenta_id
LEFT JOIN
    Clientes ON CuentasBancarias.cliente_id = Clientes.cliente_id
WHERE
    Transacciones.monto < 100;
	
-- 9. Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta.
SELECT
    CuentasBancarias.*,
    Clientes.*,
    Transacciones.*
FROM
    CuentasBancarias
LEFT JOIN
    Clientes ON CuentasBancarias.cliente_id = Clientes.cliente_id
LEFT JOIN
    Transacciones ON CuentasBancarias.cuenta_id = Transacciones.cuenta_id;
	
-- 10.Selecciona todas las transacciones, los clientes y las cuentas, incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.
SELECT
    Transacciones.*,
    Clientes.*,
    CuentasBancarias.*
FROM
    Transacciones
LEFT JOIN
    CuentasBancarias ON Transacciones.cuenta_id = CuentasBancarias.cuenta_id
LEFT JOIN
    Clientes ON CuentasBancarias.cliente_id = Clientes.cliente_id;	