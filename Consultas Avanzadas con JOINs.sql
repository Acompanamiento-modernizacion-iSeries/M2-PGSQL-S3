-- creacion tablas:
CREATE TABLE Departamentos (
    departamento_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255))
	;
	
select * from departamentos;

INSERT INTO Departamentos (departamento_id,  nombre) VALUES (1, 'Recursos Humanos');
INSERT INTO Departamentos (departamento_id,  nombre) VALUES (3,  'Sincronizacion');
INSERT INTO Departamentos (departamento_id,  nombre) VALUES (2,  'Marketing');
INSERT INTO Departamentos (departamento_id,  nombre) VALUES (4,  'Tecnología');
INSERT INTO Departamentos (departamento_id, nombre) VALUES (5, 'Ventas');
INSERT INTO Departamentos (departamento_id, nombre) VALUES (6, 'Operaciones');

-- 1. 
select *  from clientes as cl 
join cuentas_bancarias as cu on cl.cliente_id = cu.cliente_id;

-- 2.
select * from empleados as em
left join sucursales as su on em.sucursal_id  = su.sucursal_id;

-- 3. 
select nombre, apellido, correo_electronico, tipo_transaccion, monto from clientes as cl 
join cuentas_bancarias as cu on cl.cliente_id = cu.cliente_id
right join transacciones as tr on tr.cuenta_id = cu.cuenta_id;

-- 4. se requiere crear tabla departamentos
select * from empleados as em
full join departamentos as de on em.departamento_id = de.departamento_id

-- 5.
select *  from clientes as cl 
join cuentas_bancarias as cu on cl.cliente_id = cu.cliente_id where saldo > 5000;

-- 6.
select * from empleados as em
left join sucursales as su on em.sucursal_id  = su.sucursal_id where su.nombre ='New York';

-- 7.
select * from clientes as cl 
right join cuentas_bancarias as cb on cl.cliente_id = cb.cliente_id 
right join transacciones as tr on tr.cuenta_id = cb.cuenta_id where tr.monto < 100;

-- 8. se requiere crear tabla departamentos
select * from empleados as em
full join departamentos as de on em.departamento_id = de.departamento_id
where de.departamento_id = 1;

-- 9.
select * from cuentas_bancarias as cb
join clientes as cl on cl.cliente_id = cb.cliente_id
join transacciones as tr on tr.cuenta_id = cb.cuenta_id ;

-- 10.
select * from transacciones as tr
full join cuentas_bancarias as cb on tr.cuenta_id = cb.cuenta_id
full join clientes as cl on cl.cliente_id = cb.cliente_id;