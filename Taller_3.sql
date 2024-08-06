--Selecciona todos los clientes junto con los detalles de sus cuentas.
SELECT 
    c.cliente_id,
    c.nombre,
    c.apellido,
    c.estado AS estado_cliente,
    cb.numero_cuenta,
    cb.tipo_cuenta,
    cb.saldo,
    cb.fecha_apertura,
    cb.estado AS estado_cuenta
FROM 
    Clientes c
JOIN 
    Cuentas_Bancarias cb ON c.cliente_id = cb.cliente_id;
	
--Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal.

SELECT 
    e.empleado_id,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    e.direccion AS direccion_empleado,
    e.telefono AS telefono_empleado,
    e.correo_electronico AS correo_empleado,
    e.fecha_contratacion,
    e.posicion,
    e.salario,
    s.sucursal_id,
    s.nombre AS nombre_sucursal,
    s.direccion AS direccion_sucursal,
    s.telefono AS telefono_sucursal
FROM 
    Empleados e
LEFT JOIN 
    Sucursales s ON e.sucursal_id = s.sucursal_id;
	
--Selecciona todos los clientes y sus transacciones, incluyendo aquellas transacciones que no tienen clientes asignados.

SELECT 
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    c.direccion AS direccion_cliente,
    c.telefono AS telefono_cliente,
    c.correo_electronico AS correo_cliente,
    c.fecha_nacimiento,
    c.estado AS estado_cliente,
    t.transaccion_id,
    t.cuenta_id,
    t.tipo_transaccion,
    t.monto,
    t.fecha_transaccion,
    t.descripcion
FROM 
    Clientes c
RIGHT JOIN 
    Cuentas_Bancarias cb ON c.cliente_id = cb.cliente_id
RIGHT JOIN 
    Transacciones t ON cb.cuenta_id = t.cuenta_id;

--Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados.

SELECT 
    e.empleado_id,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    e.direccion AS direccion_empleado,
    e.telefono AS telefono_empleado,
    e.correo_electronico AS correo_empleado,
    e.fecha_contratacion,
    e.posicion,
    e.salario,
    d.departamento_id,
    d.nombre AS nombre_departamento
FROM 
    Empleados e
FULL OUTER JOIN 
    Departamentos d ON e.departamento_id = d.departamento_id
WHERE 
    e.empleado_id IS NOT NULL OR d.departamento_id IS NOT NULL;

--Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.

SELECT 
    c.cliente_id,
    c.nombre,
    c.apellido,
    c.direccion,
    c.telefono,
    c.correo_electronico,
    c.fecha_nacimiento,
    c.estado AS estado_cliente,
    cb.cuenta_id,
    cb.numero_cuenta,
    cb.tipo_cuenta,
    cb.saldo,
    cb.fecha_apertura,
    cb.estado AS estado_cuenta
FROM 
    Clientes c
JOIN 
    Cuentas_Bancarias cb ON c.cliente_id = cb.cliente_id
WHERE 
    cb.saldo > 5000;

--Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal, pero solo si la sucursal está en "New York".

SELECT 
    e.empleado_id,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    e.direccion AS direccion_empleado,
    e.telefono AS telefono_empleado,
    e.correo_electronico AS correo_empleado,
    e.fecha_contratacion,
    e.posicion,
    e.salario,
    s.sucursal_id,
    s.nombre AS nombre_sucursal,
    s.direccion AS direccion_sucursal,
    s.telefono AS telefono_sucursal
FROM 
    Empleados e
LEFT JOIN 
    Sucursales s ON e.sucursal_id = s.sucursal_id
WHERE 
    s.direccion LIKE '%New York%' OR s.sucursal_id IS NULL;
	
--Selecciona todas las transacciones y los clientes asociados, incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100.

SELECT 
    t.transaccion_id,
    t.cuenta_id,
    t.tipo_transaccion,
    t.monto,
    t.fecha_transaccion,
    t.descripcion,
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    c.direccion AS direccion_cliente,
    c.telefono AS telefono_cliente,
    c.correo_electronico AS correo_cliente,
    c.fecha_nacimiento,
    c.estado AS estado_cliente
FROM 
    Transacciones t
LEFT JOIN 
    Cuentas_Bancarias cb ON t.cuenta_id = cb.cuenta_id
LEFT JOIN 
    Clientes c ON cb.cliente_id = c.cliente_id
WHERE 
    t.monto < 100;

--Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados, pero solo si el departamento está en "HR".

SELECT 
    e.empleado_id,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    e.direccion AS direccion_empleado,
    e.telefono AS telefono_empleado,
    e.correo_electronico AS correo_empleado,
    e.fecha_contratacion,
    e.posicion,
    e.salario,
    d.departamento_id,
    d.nombre
FROM 
    Empleados e
LEFT JOIN 
    Departamentos d ON e.departamento_id = d.departamento_id
WHERE 
    d.nombre = 'HR' OR d.departamento_id IS NULL;
	
--Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta.

SELECT 
    cb.cuenta_id,
    cb.numero_cuenta,
    cb.tipo_cuenta,
    cb.saldo,
    cb.fecha_apertura,
    cb.estado AS estado_cuenta,
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    c.direccion AS direccion_cliente,
    c.telefono AS telefono_cliente,
    c.correo_electronico AS correo_cliente,
    c.fecha_nacimiento,
    c.estado AS estado_cliente,
    t.transaccion_id,
    t.tipo_transaccion,
    t.monto,
    t.fecha_transaccion,
    t.descripcion AS descripcion_transaccion
FROM 
    Cuentas_Bancarias cb
INNER JOIN 
    Clientes c ON cb.cliente_id = c.cliente_id
LEFT JOIN 
    Transacciones t ON cb.cuenta_id = t.cuenta_id;

--Selecciona todas las transacciones, los clientes y las cuentas, incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.

SELECT 
    t.transaccion_id,
    t.tipo_transaccion,
    t.monto,
    t.fecha_transaccion,
    t.descripcion AS descripcion_transaccion,
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    c.direccion AS direccion_cliente,
    c.telefono AS telefono_cliente,
    c.correo_electronico AS correo_cliente,
    c.fecha_nacimiento,
    c.estado AS estado_cliente,
    cb.cuenta_id,
    cb.numero_cuenta,
    cb.tipo_cuenta,
    cb.saldo,
    cb.fecha_apertura,
    cb.estado AS estado_cuenta
FROM 
    Transacciones t
LEFT JOIN 
    Cuentas_Bancarias cb ON t.cuenta_id = cb.cuenta_id
LEFT JOIN 
    Clientes c ON cb.cliente_id = c.cliente_id;

--Selecciona todas las transacciones, los clientes y las cuentas, incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.

SELECT 
    t.transaccion_id,
    t.tipo_transaccion,
    t.monto,
    t.fecha_transaccion,
    t.descripcion AS descripcion_transaccion,
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    c.direccion AS direccion_cliente,
    c.telefono AS telefono_cliente,
    c.correo_electronico AS correo_cliente,
    c.fecha_nacimiento,
    c.estado AS estado_cliente,
    cb.cuenta_id,
    cb.numero_cuenta,
    cb.tipo_cuenta,
    cb.saldo,
    cb.fecha_apertura,
    cb.estado AS estado_cuenta
FROM 
    Transacciones t
LEFT JOIN 
    Cuentas_Bancarias cb ON t.cuenta_id = cb.cuenta_id
LEFT JOIN 
    Clientes c ON cb.cliente_id = c.cliente_id;

