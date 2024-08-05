--1. Enunciado: Selecciona todos los clientes junto 
--con los detalles de sus cuentas.
SELECT A.NOMBRE,A.APELLIDO,A.CORREO_ELECTRONICO,
B.NUMERO_CUENTA,B.TIPO_CUENTA,B.SALDO,
B.ESTADO,B.FECHA_APERTURA FROM CLIENTES A 
INNER JOIN CUENTASBANCARIAS B ON A.CLIENTE_ID = B.CLIENTE_ID;

--2. Enunciado: Selecciona todos los empleados y las 
--sucursales donde trabajan, incluyendo aquellos empleados que 
--no están asignados a ninguna sucursal.
SELECT  A.NOMBRE,A.APELLIDO,A.CORREO_ELECTRONICO,
B.NOMBRE "NOMBRE DE SUCURSAL" , B.DIRECCION "DIRECCION SUCURSAL"
FROM EMPLEADOS A LEFT JOIN SUCURSALES B
ON A.SUCURSAL_ID = B.SUCURSAL_ID;

--3.Enunciado: Selecciona todos los clientes y sus transacciones,
--incluyendo aquellas transacciones que no tienen clientes asignados.
SELECT C.NOMBRE,C.APELLIDO,C.CORREO_ELECTRONICO,
A.TIPO_TRANSACCION,A.MONTO,A.FECHA_TRANSACCION
FROM TRANSACCIONES A INNER JOIN CUENTASBANCARIAS B
ON A.CUENTA_ID = B.CUENTA_ID LEFT JOIN CLIENTES C 
ON B.CLIENTE_ID = C.CLIENTE_ID;

--4.Enunciado: Selecciona todos los empleados y 
--los departamentos, incluyendo aquellos empleados que 
--no están asignados a un departamento y aquellos 
--departamentos sin empleados.
SELECT A.empleado_id, A.nombre, A.apellido,A.correo_electronico,
A.DEPARTAMENTO_ID,B.DEPARTAMENTO_ID,B.NOMBRE
FROM EMPLEADOS A FULL OUTER JOIN DEPARTAMENTOS B
ON A.DEPARTAMENTO_ID = B.DEPARTAMENTO_ID


--5. Enunciado:Selecciona los clientes que tienen cuentas con 
--un saldo mayor a 5000.
SELECT A.NOMBRE,A.APELLIDO,A.CORREO_ELECTRONICO,
B.NUMERO_CUENTA,B.TIPO_CUENTA,B.SALDO,
B.ESTADO,B.FECHA_APERTURA FROM CLIENTES A 
INNER JOIN CUENTASBANCARIAS B ON A.CLIENTE_ID = B.CLIENTE_ID
WHERE B.SALDO > 5000;

--6.Enunciado: Selecciona todos los empleados y las sucursales
--donde trabajan, incluyendo aquellos empleados que no 
--están asignados a ninguna sucursal, pero solo si la 
--sucursal está en "New York".
SELECT  A.NOMBRE,A.APELLIDO,A.CORREO_ELECTRONICO,
B.NOMBRE "NOMBRE DE SUCURSAL" , B.DIRECCION "DIRECCION SUCURSAL"
FROM EMPLEADOS A LEFT JOIN SUCURSALES B
ON A.SUCURSAL_ID = B.SUCURSAL_ID
WHERE B.NOMBRE = 'New York';

--7.Enunciado: Selecciona todas las transacciones y los 
--clientes asociados, incluyendo aquellas transacciones 
--sin clientes, pero solo si el monto de la transacción 
--es menor a 100.
SELECT C.NOMBRE,C.APELLIDO,C.CORREO_ELECTRONICO,
A.TIPO_TRANSACCION,A.MONTO,A.FECHA_TRANSACCION
FROM TRANSACCIONES A INNER JOIN CUENTASBANCARIAS B
ON A.CUENTA_ID = B.CUENTA_ID LEFT JOIN CLIENTES C 
ON B.CLIENTE_ID = C.CLIENTE_ID
WHERE A.MONTO < 100;

--8.Enunciado: Selecciona todos los empleados y los departamentos,
--incluyendo aquellos empleados que no están asignados
--a un departamento y aquellos departamentos sin empleados, 
--pero solo si el departamento está en "HR".
SELECT A.empleado_id, A.nombre, A.apellido,A.correo_electronico,
A.DEPARTAMENTO_ID,B.DEPARTAMENTO_ID,B.NOMBRE
FROM EMPLEADOS A FULL OUTER JOIN DEPARTAMENTOS B
ON A.DEPARTAMENTO_ID = B.DEPARTAMENTO_ID
WHERE B.NOMBRE = 'HR'

--9.Enunciado: Selecciona las cuentas, los clientes y 
--las transacciones asociadas a cada cuenta.
SELECT A.NOMBRE,A.APELLIDO,A.CORREO_ELECTRONICO,
B.NUMERO_CUENTA,B.TIPO_CUENTA,B.SALDO,
B.ESTADO,B.FECHA_APERTURA,C.TIPO_TRANSACCION,C.MONTO,
C.FECHA_TRANSACCION
FROM CLIENTES A 
INNER JOIN CUENTASBANCARIAS B ON A.CLIENTE_ID = B.CLIENTE_ID
INNER JOIN TRANSACCIONES C ON B.CUENTA_ID = C.CUENTA_ID;


--10.Enunciado: Selecciona todas las transacciones, los clientes
--y las cuentas, incluyendo aquellas transacciones que no 
--están asignadas a ningún cliente o cuenta.
SELECT * FROM TRANSACCIONES A FULL OUTER JOIN CUENTASBANCARIAS B
ON A.CUENTA_ID = B.CUENTA_ID FULL OUTER JOIN CLIENTES C ON
B.CLIENTE_ID = C.CLIENTE_ID;


