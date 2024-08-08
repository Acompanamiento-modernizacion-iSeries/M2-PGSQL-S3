--1. Selecciona todos los clientes junto con los detalles de sus cuentas.
SELECT clientes.*, cuentas_bancarias.*
FROM clientes
JOIN cuentas_bancarias ON clientes.cliente_id = cuentas_bancarias.cliente_id;

--2. Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal.
SELECT empleados.*, sucursales.*
FROM empleados
LEFT JOIN sucursales ON empleados.sucursal_id = sucursales.sucursal_id;

--3. Selecciona todos los clientes y sus transacciones, incluyendo aquellas transacciones que no tienen clientes asignados.
SELECT clientes.*, transacciones.*
FROM clientes
RIGHT JOIN transacciones ON clientes.cliente_id = transacciones.cuenta_id;

--4. Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados.
SELECT empleados.*, sucursales.*
FROM empleados
FULL OUTER JOIN sucursales ON empleados.sucursal_id = sucursales.sucursal_id;

--5. Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.
SELECT clientes.*
FROM clientes
JOIN cuentas_bancarias ON clientes.cliente_id = cuentas_bancarias.cliente_id
WHERE cuentas_bancarias.saldo > 5000;

--6. Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal, pero solo si la sucursal está en "New York".
SELECT empleados.*, sucursales.*
FROM empleados
LEFT JOIN sucursales ON empleados.sucursal_id = sucursales.sucursal_id
WHERE sucursales.direccion = 'New York' OR sucursales.direccion IS NULL;

--7. Selecciona todas las transacciones y los clientes asociados, incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100.
SELECT transacciones.*, clientes.*
FROM transacciones
LEFT JOIN clientes ON transacciones.cuenta_id = clientes.cliente_id
WHERE transacciones.monto < 100;

--8. Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados, pero solo si el departamento está en "HR".
SELECT empleados.*, sucursales.*
FROM empleados
FULL OUTER JOIN sucursales ON empleados.sucursal_id = sucursales.sucursal_id
WHERE sucursales.nombre = 'HR' OR sucursales.nombre IS NULL;

--9. Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta.
SELECT cuentas_bancarias.*, clientes.*, transacciones.*
FROM cuentas_bancarias
JOIN clientes ON cuentas_bancarias.cliente_id = clientes.cliente_id
JOIN transacciones ON cuentas_bancarias.cuenta_id = transacciones.cuenta_id;
 
--10. Selecciona todas las transacciones, los clientes y las cuentas, incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.
SELECT transacciones.*, clientes.*, cuentas_bancarias.*
FROM transacciones
LEFT JOIN clientes ON transacciones.cuenta_id = clientes.cliente_id
LEFT JOIN cuentas_bancarias ON transacciones.cuenta_id = cuentas_bancarias.cuenta_id;