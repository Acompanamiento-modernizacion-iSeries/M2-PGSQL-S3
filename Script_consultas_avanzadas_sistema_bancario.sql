-----------------------------------------------------------------------
--TALLER 3
--SCRIPT CREADO POR: JUAN PABLO VALDERRAMA PELÁEZ
--CONSULTAS AVANZADAS SOBRE BASE DE DATOS SISTEMA BANCARIO 
------------------------------------------------------------------------
--1.Selecciona todos los clientes junto con los detalles de sus cuentas.
------------------------------------------------------------------------

SELECT *
FROM Clientes C
JOIN Cuentas_Bancarias CB ON C.CLIENTE_ID = CB.CLIENTE_ID;

------------------------------------------------------------------------
--2.Selecciona todos los empleados y las sucursales donde trabajan, 
--incluyendo aquellos empleados que no están asignados a ninguna sucursal.
------------------------------------------------------------------------

SELECT *
FROM Empleados E
LEFT JOIN Sucursales S ON E.SUCURSAL_ID = S.SUCURSAL_ID;

------------------------------------------------------------------------
--3.Selecciona todos los clientes y sus transacciones, incluyendo 
--aquellas transacciones que no tienen clientes asignados.
------------------------------------------------------------------------

SELECT *
FROM Clientes C
RIGHT JOIN Cuentas_Bancarias CB ON C.CLIENTE_ID = CB.CLIENTE_ID
RIGHT JOIN Transacciones T ON CB.CUENTA_ID = T.CUENTA_ID;

------------------------------------------------------------------------
--4.Selecciona todos los empleados y los departamentos, incluyendo 
--aquellos empleados que no están asignados a un departamento y aquellos 
--departamentos sin empleados.
------------------------------------------------------------------------

SELECT *
FROM Empleados E
FULL JOIN Posiciones P ON E.POSICION = P.POSICION_ID;

------------------------------------------------------------------------
--5.Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.
------------------------------------------------------------------------

SELECT *
FROM Clientes C
JOIN Cuentas_Bancarias CB ON C.CLIENTE_ID = CB.CLIENTE_ID
WHERE CB.SALDO > 5000;

------------------------------------------------------------------------
--6.Selecciona todos los empleados y las sucursales donde trabajan, 
--incluyendo aquellos empleados que no están asignados a ninguna sucursal, 
--pero solo si la sucursal está en "New York".
------------------------------------------------------------------------

SELECT *
FROM Empleados E
LEFT JOIN Sucursales S ON E.SUCURSAL_ID = S.SUCURSAL_ID
WHERE S.NOMBRE = 'New York' OR S.SUCURSAL_ID IS NULL;

------------------------------------------------------------------------
--7.Selecciona todas las transacciones y los clientes asociados, 
--incluyendo aquellas transacciones sin clientes, pero solo si el monto 
--de la transacción es menor a 100.
------------------------------------------------------------------------

SELECT *
FROM Transacciones T
LEFT JOIN Cuentas_Bancarias CB ON T.CUENTA_ID = CB.CUENTA_ID
LEFT JOIN Clientes C ON CB.CLIENTE_ID = C.CLIENTE_ID
WHERE T.MONTO < 100;

------------------------------------------------------------------------
--8.Selecciona todos los empleados y los departamentos, incluyendo 
--aquellos empleados que no están asignados a un departamento y aquellos 
--departamentos sin empleados, pero solo si el departamento está en "HR".
------------------------------------------------------------------------

SELECT *
FROM Empleados E
FULL JOIN Posiciones P ON E.POSICION = P.POSICION_ID
WHERE P.NOMBRE = 'HR' OR P.POSICION_ID IS NULL;

------------------------------------------------------------------------
--9.Selecciona las cuentas, los clientes y las transacciones asociadas 
--a cada cuenta.
------------------------------------------------------------------------

SELECT *
FROM Cuentas_Bancarias CB
JOIN Clientes C ON CB.CLIENTE_ID = C.CLIENTE_ID
JOIN Transacciones T ON CB.CUENTA_ID = T.CUENTA_ID;

------------------------------------------------------------------------
--10.Selecciona todas las transacciones, los clientes y las cuentas, 
--incluyendo aquellas transacciones que no están asignadas a ningún 
--cliente o cuenta..
------------------------------------------------------------------------

SELECT *
FROM Transacciones T
LEFT JOIN Cuentas_Bancarias CB ON T.CUENTA_ID = CB.CUENTA_ID
LEFT JOIN Clientes C ON CB.CLIENTE_ID = C.CLIENTE_ID;