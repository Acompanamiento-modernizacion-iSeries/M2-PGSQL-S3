-- Enunciado: Selecciona todos los clientes junto con los detalles de sus cuentas.

SELECT * FROM Clientes C
INNER JOIN Cuentas R ON C.cliente_id = R.cliente_id

--Enunciado: Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal.

SELECT * FROM Empleados E
LEFT JOIN Sucursales S ON E.sucursal_id = S.sucursal_id

--Enunciado: Selecciona todos los clientes y sus transacciones, incluyendo aquellas transacciones que no tienen clientes asignados.

SELECT * FROM Clientes C
RIGHT JOIN Transacciones T ON C.cliente_id = T.cliente_id    

--Enunciado: Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados.

SELECT * FROM Empleados E
FULL JOIN Sucursales S ON E.sucursal_id = S.sucursal_id

--Enunciado: Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.

SELECT * FROM Clientes C
INNER JOIN Cuentas X ON C.cliente_id = X.cliente_id
WHERE Saldo >5000

--Enunciado: Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal, pero solo si la sucursal está en "New York".

SELECT * FROM Empleados E
LEFT JOIN Sucursales S ON E.sucursal_id = S.sucursal_id
WHERE S.direccion = 'New York'

--  Enunciado: Selecciona todas las transacciones y los clientes asociados, incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100.

SELECT * FROM Transacciones T
LEFT JOIN Clientes C ON T.cliente_id = C.cliente_id
WHERE monto < 100

-- Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados, pero solo si el departamento está en "HR".

SELECT * FROM Empleados E
FULL JOIN Sucursales S ON E.sucursal_id = S.sucursal_id
WHERE S.direccion = 'HR'

--Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta.

SELECT * FROM Cuentas C
INNER JOIN Clientes X ON C.cliente_id = X.cliente_id
INNER JOIN Transacciones T ON C.cuenta_id = T.cuenta_id

-- Selecciona todas las transacciones, los clientes y las cuentas, incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.

SELECT * FROM Transacciones T
LEFT JOIN Clientes C ON T.cliente_id = C.cliente_id
LEFT JOIN Cuentas X ON T.cuenta_id = X.cuenta_id