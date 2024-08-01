-- Requisitos previos
CREATE TABLE departamentos (
	departamento_id SERIAL PRIMARY KEY,
	nombre_departamento VARCHAR (100) NOT NULL
);

INSERT INTO departamentos (nombre_departamento)
VALUES ('HR Office'), ('Tecnologia');

ALTER TABLE empleados ADD COLUMN departamento_id INT REFERENCES departamentos(departamento_id);

UPDATE empleados SET departamento_id = 1 WHERE empleado_id = 1;

UPDATE empleados SET departamento_id = 2 WHERE empleado_id = 3;

-- 1.
SELECT * FROM clientes cli
INNER JOIN cuentas_bancarias cb
ON cli.cliente_id = cb.cliente_id;

-- 2.
SELECT * FROM empleados emp
LEFT JOIN sucursales suc
ON emp.sucursal_id = suc.sucursal_id

-- 3.
SELECT cli.*, tra.* FROM clientes cli
INNER JOIN cuentas_bancarias cb
ON cli.cliente_id = cb.cliente_id
RIGHT JOIN transacciones tra
ON cb.cuenta_id = tra.cuenta_id;

-- 4.
SELECT * FROM empleados emp
FULL JOIN departamentos dep
ON emp.departamento_id = dep.departamento_id;

-- 5.
SELECT * FROM clientes cli
INNER JOIN cuentas_bancarias cb
ON cli.cliente_id = cb.cliente_id
WHERE cb.saldo > 5000;

-- 6.
SELECT * FROM empleados emp
LEFT JOIN sucursales suc
ON emp.sucursal_id = suc.sucursal_id
WHERE suc.nombre = 'New York';

-- 7.
SELECT tra.*, cli.* FROM transacciones tra
INNER JOIN cuentas_bancarias cb
ON tra.cuenta_id = cb.cuenta_id
LEFT JOIN  clientes cli
ON cb.cliente_id = cli.cliente_id
WHERE tra.monto < 100;

-- 8.
SELECT * FROM empleados emp
FULL JOIN departamentos dep
ON emp.departamento_id = dep.departamento_id
WHERE dep.nombre_departamento LIKE '%HR%';

-- 9.
SELECT cb.*, cli.*, tra.* FROM cuentas_bancarias cb
INNER JOIN transacciones tra
ON cb.cuenta_id = tra.cuenta_id
INNER JOIN  clientes cli
ON cb.cliente_id = cli.cliente_id

-- 10.
SELECT tra.*, cb.*, cli.* FROM transacciones tra
LEFT JOIN cuentas_bancarias cb
ON tra.cuenta_id = cb.cuenta_id
LEFT JOIN  clientes cli
ON cb.cliente_id = cli.cliente_id;
