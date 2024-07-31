--**1. Enunciado:** Selecciona todos los clientes junto con los detalles de sus cuentas.
SELECT 
    c.cliente_id,
    c.nombre,
    c.apellido,
    c.correo_electronico,
    cb.cuenta_id,
    cb.numero_cuenta,
    cb.tipo_cuenta,
    cb.saldo,
    cb.fecha_apertura,
    cb.estado
FROM 
    Clientes c
LEFT JOIN 
    Cuentas_Bancarias cb ON c.cliente_id = cb.cliente_id;

--**2. Enunciado:** Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal.
SELECT 
    e.empleado_id,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    e.posicion,
    e.salario,
    s.sucursal_id,
    s.nombre AS nombre_sucursal,
    s.direccion AS direccion_sucursal
FROM 
    Empleados e
LEFT JOIN 
    Sucursales s ON e.sucursal_id = s.sucursal_id;

--**3. Enunciado:** Selecciona todos los clientes y sus transacciones, incluyendo aquellas transacciones que no tienen clientes asignados.
SELECT 
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    cb.cuenta_id,
    cb.numero_cuenta,
    t.transaccion_id,
    t.tipo_transaccion,
    t.monto,
    t.fecha_transaccion,
    t.descripcion
FROM 
    Clientes c
RIGHT JOIN 
    Cuentas_Bancarias cb ON c.cliente_id = cb.cliente_id
RIGHT JOIN 
    Transacciones t ON cb.cuenta_id = t.cuenta_id
ORDER BY 
    c.cliente_id, t.fecha_transaccion;

--**4. Enunciado:** Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados.
SELECT 
    e.empleado_id,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    e.posicion,
    e.salario,
    s.sucursal_id,
    s.nombre AS nombre_sucursal,
    s.direccion AS direccion_sucursal
FROM 
    Empleados e
FULL OUTER JOIN 
    Sucursales s ON e.sucursal_id = s.sucursal_id
ORDER BY 
    e.empleado_id, s.sucursal_id;

--**5. Enunciado:** Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.
SELECT DISTINCT
    c.cliente_id,
    c.nombre,
    c.apellido,
    c.correo_electronico,
    cb.numero_cuenta,
    cb.tipo_cuenta,
    cb.saldo
FROM 
    Clientes c
INNER JOIN 
    Cuentas_Bancarias cb ON c.cliente_id = cb.cliente_id
WHERE 
    cb.saldo > 5000
ORDER BY 
    c.cliente_id, cb.saldo DESC;

--**6. Enunciado:** Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal, pero solo si la sucursal está en "New York".
SELECT 
    e.empleado_id,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    e.posicion,
    e.salario,
    s.sucursal_id,
    s.nombre AS nombre_sucursal,
    s.direccion AS direccion_sucursal
FROM 
    Empleados e
LEFT JOIN 
    Sucursales s ON e.sucursal_id = s.sucursal_id
WHERE 
    s.direccion LIKE '%New York%' OR s.sucursal_id IS NULL
ORDER BY 
    e.empleado_id;

--**7. Enunciado:** Selecciona todas las transacciones y los clientes asociados, incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100.
SELECT 
    t.transaccion_id,
    t.tipo_transaccion,
    t.monto,
    t.fecha_transaccion,
    t.descripcion,    
    cb.numero_cuenta,
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente
FROM 
    Transacciones t
LEFT JOIN 
    Cuentas_Bancarias cb ON t.cuenta_id = cb.cuenta_id
LEFT JOIN 
    Clientes c ON cb.cliente_id = c.cliente_id
WHERE 
    t.monto < 100
ORDER BY 
    t.fecha_transaccion DESC, t.transaccion_id;

--**8. Enunciado:** Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados, pero solo si el departamento está en "HR".
SELECT 
    e.empleado_id,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    e.posicion,
    e.salario,
    s.sucursal_id,
    s.nombre AS nombre_sucursal,
    s.direccion AS direccion_sucursal
FROM 
    Empleados e
FULL OUTER JOIN 
    Sucursales s ON e.sucursal_id = s.sucursal_id
WHERE 
    s.nombre = 'HR' OR s.sucursal_id IS NULL OR e.empleado_id IS NULL;

--**9. Enunciado:** Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta.
SELECT     
    cb.numero_cuenta,
    cb.tipo_cuenta,
    cb.saldo,    
    cb.estado AS estado_cuenta,
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    c.correo_electronico,
    t.transaccion_id,
    t.tipo_transaccion,
    t.monto AS monto_transaccion,
    t.fecha_transaccion,
    t.descripcion AS descripcion_transaccion
FROM 
    Cuentas_Bancarias cb
LEFT JOIN 
    Clientes c ON cb.cliente_id = c.cliente_id
LEFT JOIN 
    Transacciones t ON cb.cuenta_id = t.cuenta_id;

--**10. Enunciado:** Selecciona todas las transacciones, los clientes y las cuentas, incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.
SELECT 
    t.transaccion_id,
    t.tipo_transaccion,
    t.monto AS monto_transaccion,
    t.fecha_transaccion,
    t.descripcion AS descripcion_transaccion,    
    cb.numero_cuenta,
    cb.tipo_cuenta,
    cb.saldo,
    cb.fecha_apertura,
    cb.estado AS estado_cuenta,
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    c.correo_electronico
FROM 
    Clientes c
RIGHT JOIN 
    Cuentas_Bancarias cb ON c.cliente_id = cb.cliente_id
RIGHT JOIN 
    Transacciones t ON cb.cuenta_id = t.cuenta_id;