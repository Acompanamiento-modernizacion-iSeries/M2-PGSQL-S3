#1
SELECT 
    c.cliente_id, 
    c.nombre AS cliente_nombre, 
    c.apellido AS cliente_apellido, 
    c.direccion AS cliente_direccion, 
    c.telefono AS cliente_telefono, 
    c.correo_electronico AS cliente_correo, 
    c.fecha_nacimiento AS cliente_fecha_nacimiento, 
    c.estado AS cliente_estado, 
    cb.cuenta_id, 
    cb.numero_cuenta, 
    cb.tipo_cuenta, 
    cb.saldo, 
    cb.fecha_apertura, 
    cb.estado AS cuenta_estado
FROM 
    Clientes c
LEFT JOIN 
    CuentasBancarias cb ON c.cliente_id = cb.cliente_id;
#2
SELECT 
    e.empleado_id, 
    e.nombre AS empleado_nombre, 
    e.apellido AS empleado_apellido, 
    e.direccion AS empleado_direccion, 
    e.telefono AS empleado_telefono, 
    e.correo_electronico AS empleado_correo, 
    e.fecha_contratacion, 
    e.posicion, 
    e.salario, 
    s.sucursal_id, 
    s.nombre AS sucursal_nombre, 
    s.direccion AS sucursal_direccion, 
    s.telefono AS sucursal_telefono
FROM 
    Empleados e
LEFT JOIN 
    Sucursales s ON e.sucursal_id = s.sucursal_id;
#3
SELECT 
    c.cliente_id, 
    c.nombre AS cliente_nombre, 
    c.apellido AS cliente_apellido, 
    t.transaccion_id, 
    t.tipo_transaccion, 
    t.monto, 
    t.fecha_transaccion, 
    t.descripcion
FROM 
    Transacciones t
LEFT JOIN 
    CuentasBancarias cb ON t.cuenta_id = cb.cuenta_id
LEFT JOIN 
    Clientes c ON cb.cliente_id = c.cliente_id;
#4
SELECT 
    e.empleado_id, 
    e.nombre AS empleado_nombre, 
    e.apellido AS empleado_apellido, 
    s.sucursal_id, 
    s.nombre AS sucursal_nombre, 
    s.direccion AS sucursal_direccion, 
    s.telefono AS sucursal_telefono
FROM 
    Sucursales s
FULL JOIN 
    Empleados e ON s.sucursal_id = e.sucursal_id;
#5
SELECT DISTINCT 
    c.cliente_id, 
    c.nombre AS cliente_nombre, 
    c.apellido AS cliente_apellido
FROM 
    Clientes c
JOIN 
    CuentasBancarias cb ON c.cliente_id = cb.cliente_id
WHERE 
    cb.saldo > 5000;
#6
SELECT 
    e.empleado_id, 
    e.nombre AS empleado_nombre, 
    e.apellido AS empleado_apellido, 
    e.direccion AS empleado_direccion, 
    e.telefono AS empleado_telefono, 
    e.correo_electronico AS empleado_correo, 
    e.fecha_contratacion, 
    e.posicion, 
    e.salario, 
    s.sucursal_id, 
    s.nombre AS sucursal_nombre, 
    s.direccion AS sucursal_direccion, 
    s.telefono AS sucursal_telefono
FROM 
    Empleados e
LEFT JOIN 
    Sucursales s ON e.sucursal_id = s.sucursal_id AND s.nombre = 'New York';
#7
SELECT 
    t.transaccion_id, 
    t.tipo_transaccion, 
    t.monto, 
    t.fecha_transaccion, 
    t.descripcion, 
    c.cliente_id, 
    c.nombre AS cliente_nombre, 
    c.apellido AS cliente_apellido
FROM 
    Transacciones t
LEFT JOIN 
    CuentasBancarias cb ON t.cuenta_id = cb.cuenta_id
LEFT JOIN 
    Clientes c ON cb.cliente_id = c.cliente_id
WHERE 
    t.monto < 100;
#8
SELECT 
    e.empleado_id, 
    e.nombre AS empleado_nombre, 
    e.apellido AS empleado_apellido, 
    s.sucursal_id, 
    s.nombre AS sucursal_nombre, 
    s.direccion AS sucursal_direccion, 
    s.telefono AS sucursal_telefono
FROM 
    Sucursales s
FULL JOIN 
    Empleados e ON s.sucursal_id = e.sucursal_id
WHERE 
    s.nombre = 'HR';
#9
SELECT 
    cb.cuenta_id, 
    cb.numero_cuenta, 
    cb.tipo_cuenta, 
    cb.saldo, 
    cb.fecha_apertura, 
    cb.estado AS cuenta_estado, 
    c.cliente_id, 
    c.nombre AS cliente_nombre, 
    c.apellido AS cliente_apellido, 
    t.transaccion_id, 
    t.tipo_transaccion, 
    t.monto, 
    t.fecha_transaccion, 
    t.descripcion
FROM 
    CuentasBancarias cb
INNER JOIN 
    Clientes c ON cb.cliente_id = c.cliente_id
INNER JOIN 
    Transacciones t ON cb.cuenta_id = t.cuenta_id;
#10
SELECT 
    t.transaccion_id, 
    t.tipo_transaccion, 
    t.monto, 
    t.fecha_transaccion, 
    t.descripcion, 
    c.cliente_id, 
    c.nombre AS cliente_nombre, 
    c.apellido AS cliente_apellido, 
    cb.cuenta_id, 
    cb.numero_cuenta, 
    cb.tipo_cuenta, 
    cb.saldo, 
    cb.fecha_apertura
FROM 
    Transacciones t
LEFT JOIN 
    CuentasBancarias cb ON t.cuenta_id = cb.cuenta_id
LEFT JOIN 
    Clientes c ON cb.cliente_id = c.cliente_id;