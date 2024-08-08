--1. Selecciona todos los clientes junto con los detalles de sus cuentas.
SELECT CL.cliente_id, CL.nombre, CL.apellido, CB.numero_cuenta
  FROM clientes CL
  JOIN cuentas_bancarias CB ON CB.cliente_id = CL.cliente_id;

--*. Insertar empleado sin sucursal asignada
INSERT INTO empleados (nombre, apellido, direccion, telefono, correo_electronico, posicion, salario)
  VALUES ('Maria','Gomez','102th Avenue','5554444','maria.gomez@banco.com','Auxiliar','1300000');

--2. Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal.
SELECT EM.empleado_id, EM.nombre, EM.apellido, SC.sucursal_id, SC.nombre
  FROM empleados EM
  LEFT JOIN sucursales SC ON SC.sucursal_id = EM.sucursal_id; 

--*. Insertar transacción sin cliente asignado
INSERT INTO transacciones (tipo_transaccion, monto, descripcion)
  VALUES ('deposito','1350000','Remesa Internacional');

--3. Selecciona todos los clientes y sus transacciones, incluyendo aquellas transacciones que no tienen clientes asignados.
SELECT CL.cliente_id, CL.nombre, CL.apellido, CB.numero_cuenta, TR.tipo_transaccion, TR.monto
  FROM clientes CL
  JOIN cuentas_bancarias CB ON CB.cliente_id = CL.cliente_id
  RIGHT JOIN transacciones TR ON TR.cuenta_id = CB.cuenta_id;

--*. Crear Tabla departamentos
CREATE TABLE departamentos (
  departamento_id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

--*. Insertar nuevos departamentos
INSERT INTO departamentos(nombre)
  VALUES ('Recursos Humanos'),('Ventas'),('Operaciones');

--*. Adicionar campo departamentos_id a Tabla empleados
ALTER TABLE empleados 
  ADD COLUMN departamento_id INT REFERENCES departamentos (departamento_id);

--*. Adicionar departamentos a empleados
UPDATE empleados
  SET departamento_id = 2
  WHERE posicion IN ('Asesor Comercial','Analista de Credito');

UPDATE empleados
  SET departamento_id = 3
  WHERE posicion = 'Cajero';

--4. Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados.
SELECT EM.empleado_id, EM.nombre, EM.apellido, DP.departamento_id, DP.nombre
  FROM empleados EM
  FULL JOIN departamentos DP ON DP.departamento_id = EM.departamento_id; 

--5. Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.
SELECT CL.cliente_id, CL.nombre, CL.apellido, CB.numero_cuenta, CB.saldo
  FROM clientes CL
  JOIN cuentas_bancarias CB ON CB.cliente_id = CL.cliente_id
  WHERE CB.saldo > 5000;

--6. Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal, pero solo si la sucursal está en "New York".
SELECT EM.empleado_id, EM.nombre, EM.apellido, SC.sucursal_id, SC.nombre
  FROM empleados EM
  LEFT JOIN sucursales SC ON SC.sucursal_id = EM.sucursal_id
  WHERE SC.nombre = 'New York' 
    OR SC.sucursal_id IS NULL;

--7. Selecciona todas las transacciones y los clientes asociados, incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100.
SELECT CL.cliente_id, CL.nombre, CL.apellido, CB.numero_cuenta, TR.tipo_transaccion, TR.monto
  FROM clientes CL
  JOIN cuentas_bancarias CB ON CB.cliente_id = CL.cliente_id
  RIGHT JOIN transacciones TR ON TR.cuenta_id = CB.cuenta_id
  WHERE TR.monto < 100;

--8. Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados, pero solo si el departamento está en "HR".
SELECT EM.empleado_id, EM.nombre, EM.apellido, DP.departamento_id, DP.nombre
  FROM empleados EM
  FULL JOIN departamentos DP ON DP.departamento_id = EM.departamento_id
  WHERE DP.nombre = 'Recursos Humanos'
    OR EM.departamento_id IS NULL;

--9. Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta.
SELECT CB.cuenta_id, CB.numero_cuenta, CL.nombre, CL.apellido, TR.tipo_transaccion, TR.monto
  FROM cuentas_bancarias CB
  JOIN clientes CL ON CL.cliente_id = CB.cliente_id
  JOIN transacciones TR ON TR.cuenta_id = CB.cuenta_id;

--10. Selecciona todas las transacciones, los clientes y las cuentas, incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.
SELECT CL.cliente_id, CL.nombre, CL.apellido, CB.numero_cuenta, TR.tipo_transaccion, TR.monto
  FROM cuentas_bancarias CB
  JOIN clientes CL ON CL.cliente_id = CB.cliente_id
  RIGHT JOIN transacciones TR ON TR.cuenta_id = CB.cuenta_id;