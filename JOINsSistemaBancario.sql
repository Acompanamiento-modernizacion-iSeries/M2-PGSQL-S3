--Consultas Avanzadas con JOINs para el Sistema Bancario

--1. Enunciado: Selecciona todos los clientes junto con los detalles de sus cuentas.
SELECT C.cliente_id, C.nombre, C.apellido, B.* 
FROM clientes C
JOIN cuentas_bancarias B ON B.cliente_id = C.cliente_id; 

--2. Enunciado: Selecciona todos los empleados y las sucursales donde trabajan, 
--incluyendo aquellos empleados que no están asignados a ninguna sucursal.
SELECT E.empleado_id, E.nombre, E.apellido, E.sucursal_id, S.nombre
FROM empleados E
LEFT JOIN sucursales S ON S.sucursal_id = E.sucursal_id;

--3. Enunciado: Selecciona todos los clientes y sus transacciones, 
--incluyendo aquellas transacciones que no tienen clientes asignados.
SELECT C.cliente_id, C.nombre, C.apellido, B.cuenta_id, T.*  
FROM clientes C
JOIN cuentas_bancarias B ON  B.cliente_id = C.cliente_id
RIGHT JOIN transacciones T ON T.cuenta_id = B.cuenta_id;

--4. Enunciado: Selecciona todos los empleados y los departamentos, 
--incluyendo aquellos empleados que no están asignados a un departamento y 
--aquellos departamentos sin empleados.
SELECT E.empleado_id, E.nombre,E.apellido, S.nombre
FROM empleados E
FULL JOIN sucursales S ON E.sucursal_id = S.sucursal_id;

--5. Enunciado: Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.
SELECT C.cliente_id,C.nombre, C.apellido, B.cuenta_id, B.saldo  
FROM clientes C
JOIN cuentas_bancarias B ON  B.cliente_id = C.cliente_id
WHERE B.saldo > '5000';

--6. Enunciado: Selecciona todos los empleados y las sucursales donde trabajan, 
--incluyendo aquellos empleados que no están asignados a ninguna sucursal, 
--pero solo si la sucursal está en "New York".
SELECT E.empleado_id, E.nombre, E.apellido, S.sucursal_id, S.nombre
FROM empleados E 
LEFT JOIN sucursales S ON S.sucursal_id = E.sucursal_id
WHERE S.nombre LIKE '%New York%'; 

SELECT * FROM sucursales;

--7. Enunciado: Selecciona todas las transacciones y los clientes asociados, 
--incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100.
SELECT T.transaccion_id , T.tipo_transaccion, C.cliente_id, C.nombre, C.apellido, T.monto
FROM transacciones T
JOIN cuentas_bancarias B ON B.cuenta_id = T.cuenta_id
LEFT JOIN clientes C ON C.cliente_id = B.cliente_id
WHERE T.monto < '100';

SELECT * FROM transacciones;

--8. Enunciado: Selecciona todos los empleados y los departamentos,
--incluyendo aquellos empleados que no están asignados a un departamento y 
--aquellos departamentos sin empleados, pero solo si el departamento está en "HR".
SELECT E.empleado_id, E.nombre, E.apellido, S.nombre
FROM empleados E
FULL JOIN sucursales S ON E.sucursal_id = S.sucursal_id
WHERE UPPER(S.nombre) LIKE '%HR%';

--9. Enunciado: Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta.
SELECT * 
FROM cuentas_bancarias B
JOIN clientes C ON C.cliente_id = B.cliente_id
JOIN transacciones T ON T.cuenta_id = B.cuenta_id ;

--10. Enunciado: Selecciona todas las transacciones, los clientes y las cuentas, 
--incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.
SELECT * 
FROM transacciones T
LEFT JOIN cuentas_bancarias B ON B.cuenta_id = T.cuenta_id
LEFT JOIN clientes C ON B.cliente_id = C.cliente_id;

