--1. Selecciona todos los clientes junto con los detalles de sus cuentas.


SELECT 
    Clientes.cliente_id, 
    Clientes.nombre, 
    Clientes.apellido, 
    Cuentas_Bancarias.cuenta_id, 
    Cuentas_Bancarias.numero_cuenta, 
    Cuentas_Bancarias.tipo_cuenta, 
    Cuentas_Bancarias.saldo
FROM 
    Clientes
JOIN 
    Cuentas_Bancarias ON Clientes.cliente_id = Cuentas_Bancarias.cliente_id;



--2. Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal.


SELECT 
    Empleados.empleado_id, 
    Empleados.nombre, 
    Empleados.apellido, 
    Sucursales.sucursal_id, 
    Sucursales.nombre AS nombre_sucursal
FROM 
    Empleados
LEFT JOIN 
    Sucursales ON Empleados.sucursal_id = Sucursales.sucursal_id;



--3. Selecciona todos los clientes y sus transacciones, incluyendo aquellas transacciones que no tienen clientes asignados.


SELECT 
    Clientes.cliente_id, 
    Clientes.nombre, 
    Clientes.apellido, 
    Transacciones.transaccion_id, 
    Transacciones.tipo_transaccion, 
    Transacciones.monto
FROM 
    Clientes
FULL JOIN 
    Cuentas_Bancarias ON Clientes.cliente_id = Cuentas_Bancarias.cliente_id
FULL JOIN 
    Transacciones ON Cuentas_Bancarias.cuenta_id = Transacciones.cuenta_id;



--4. Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados. Asumiremos que hay una tabla "Departamentos" y que "Empleados" tiene una columna "departamento_id".


-- Tabla Departamentos
CREATE TABLE Departamentos (
    departamento_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

ALTER TABLE Empleados 
ADD COLUMN departamento_id INT REFERENCES Departamentos (departamento_id);


INSERT INTO public.departamentos(
	 nombre)
	VALUES ('Mercadeo');

SELECT 
    Empleados.empleado_id, 
    Empleados.nombre, 
    Empleados.apellido, 
    Departamentos.departamento_id, 
    Departamentos.nombre AS nombre_departamento
FROM 
    Empleados
FULL JOIN 
    Departamentos ON Empleados.departamento_id = Departamentos.departamento_id;



--5. Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.



SELECT 
    Clientes.cliente_id, 
    Clientes.nombre, 
    Clientes.apellido,
    Cuentas_Bancarias.saldo
FROM 
    Clientes
JOIN 
    Cuentas_Bancarias ON Clientes.cliente_id = Cuentas_Bancarias.cliente_id
WHERE 
    Cuentas_Bancarias.saldo > 5000;



--6. Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal, pero solo si la sucursal está en "New York". Asumiremos que la tabla "Sucursales" tiene una columna "ciudad".

ALTER TABLE Sucursales 
ADD COLUMN ciudad VARCHAR (100);

SELECT 
    Empleados.empleado_id, 
    Empleados.nombre, 
    Empleados.apellido, 
    Sucursales.sucursal_id, 
    Sucursales.nombre AS nombre_sucursal
FROM 
    Empleados
LEFT JOIN 
    Sucursales ON Empleados.sucursal_id = Sucursales.sucursal_id
WHERE 
    Sucursales.ciudad = 'New York' OR Sucursales.sucursal_id IS NULL;



--7. Selecciona todas las transacciones y los clientes asociados, incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100.


SELECT 
    Transacciones.transaccion_id, 
    Transacciones.tipo_transaccion, 
    Transacciones.monto, 
    Clientes.cliente_id, 
    Clientes.nombre, 
    Clientes.apellido
FROM 
    Transacciones
LEFT JOIN 
    Cuentas_Bancarias ON Transacciones.cuenta_id = Cuentas_Bancarias.cuenta_id
LEFT JOIN 
    Clientes ON Cuentas_Bancarias.cliente_id = Clientes.cliente_id
WHERE 
    Transacciones.monto < 100;



--8. Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados, pero solo si el departamento está en "HR".


SELECT 
    Empleados.empleado_id, 
    Empleados.nombre, 
    Empleados.apellido, 
    Departamentos.departamento_id, 
    Departamentos.nombre AS nombre_departamento
FROM 
    Empleados
FULL JOIN 
    Departamentos ON Empleados.departamento_id = Departamentos.departamento_id
WHERE 
    Departamentos.nombre = 'HR' ;



--9. Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta.



SELECT 
    Cuentas_Bancarias.cuenta_id, 
    Cuentas_Bancarias.numero_cuenta, 
    Clientes.cliente_id, 
    Clientes.nombre, 
    Clientes.apellido, 
    Transacciones.transaccion_id, 
    Transacciones.tipo_transaccion, 
    Transacciones.monto
FROM 
    Cuentas_Bancarias
JOIN 
    Clientes ON Cuentas_Bancarias.cliente_id = Clientes.cliente_id
JOIN 
    Transacciones ON Cuentas_Bancarias.cuenta_id = Transacciones.cuenta_id;



--10. Selecciona todas las transacciones, los clientes y las cuentas, incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.



SELECT 
    Transacciones.transaccion_id, 
    Transacciones.tipo_transaccion, 
    Transacciones.monto, 
    Cuentas_Bancarias.cuenta_id, 
    Cuentas_Bancarias.numero_cuenta, 
    Clientes.cliente_id, 
    Clientes.nombre, 
    Clientes.apellido
FROM 
    Transacciones
FULL JOIN 
    Cuentas_Bancarias ON Transacciones.cuenta_id = Cuentas_Bancarias.cuenta_id
JOIN 
    Clientes ON Cuentas_Bancarias.cliente_id = Clientes.cliente_id;