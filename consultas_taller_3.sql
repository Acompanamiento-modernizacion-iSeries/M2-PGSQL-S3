--         SISTEMA BANCARIO 

--SCRIPT CREADO POR: Juan Carlos Alvarez Cuartas


-- CONSULTAS AVANZADAS CON  JOIN  EL SISTEMA BANCARIO

-- 1. Selecciona todos los clientes junto con los detalles de sus cuentas.
SELECT c.cliente_id, c.nombre AS nombre_cliente, c.apellido, c.direccion, c.telefono, 
        c.correo_electronico, c.fecha_nacimiento, c.nombre AS estado_cliente, b.cuenta_id, 
        b.numero_cuenta, c.nombre AS tipo_cuenta, b.saldo, b.fecha_apertura, 2.nombre AS estado_cuenta
FROM Clientes c
    JOIN Cuentas_Bancarias cb ON c.cliente_id = cb.cliente_id
    JOIN Tipo_Cuenta tc ON cb.tipo_cuenta = tc.tipo_id
    JOIN Estados_Cliente ec ON c.estado = ec.estado_id
    JOIN Estados_Cuenta ec2 ON cb.estado = ec2.estado_id;

-- 2. Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal.
SELECT e.empleado_id, e.nombre AS nombre_empleado, e.apellido, e.direccion, e.telefono, e.correo_electronico, 
        e.fecha_contratacion, p.nombre AS posicion, e.salario, s.nombre AS sucursal, s.direccion AS direccion_sucursal, 
        s.telefono AS telefono_sucursal
FROM Empleados e
    LEFT JOIN Sucursales s ON e.sucursal_id = s.sucursal_id
    JOIN Posiciones p ON e.posicion = p.posicion_id;

-- 3. Selecciona todos los clientes y sus transacciones, incluyendo aquellas transacciones que no tienen clientes asignados.
SELECT c.cliente_id, c.nombre AS nombre_cliente, c.apellido, t.transaccion_id, t.tipo_transaccion, t.monto, t.fecha_transaccion, t.descripcion
FROM Clientes c
    RIGHT JOIN Cuentas_Bancarias cb ON c.cliente_id = cb.cliente_id
    RIGHT JOIN Transacciones t ON cb.cuenta_id = t.cuenta_id;

-- 4. Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados.
SELECT e.empleado_id, e.nombre AS nombre_empleado, e.apellido, e.direccion, e.telefono, e.correo_electronico, e.fecha_contratacion, 
        p.nombre AS posicion, e.salario, s.nombre AS sucursal, s.direccion AS direccion_sucursal, s.telefono AS telefono_sucursal
FROM Empleados e
    LEFT JOIN Sucursales s ON e.sucursal_id = s.sucursal_id
    LEFT JOIN Posiciones p ON e.posicion = p.posicion_id;

-- 5. Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.
SELECT c.cliente_id, c.nombre AS nombre_cliente, c.apellido, c.direccion, c.telefono, c.correo_electronico, c.fecha_nacimiento, 
        b.cuenta_id, b.numero_cuenta, b.saldo
FROM Clientes c
    JOIN Cuentas_Bancarias cb ON c.cliente_id = cb.cliente_id
WHERE cb.saldo > 5000;

-- 6. Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal, pero solo si la sucursal está en "New York".
SELECT e.empleado_id, e.nombre AS nombre_empleado, e.apellido, e.direccion, e.telefono, e.correo_electronico, e.fecha_contratacion, 
        p.nombre AS posicion, e.salario, s.nombre AS sucursal, s.direccion AS direccion_sucursal, s.telefono AS telefono_sucursal
FROM Empleados e
    LEFT JOIN Sucursales s ON e.sucursal_id = s.sucursal_id
    JOIN Posiciones p ON e.posicion = p.posicion_id
WHERE s.nombre = 'New York';

-- 7. Selecciona todas las transacciones y los clientes asociados, incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100.
SELECT t.transaccion_id, t.cuenta_id, t.tipo_transaccion, t.monto, t.fecha_transaccion, t.descripcion, c.cliente_id, 
        c.nombre AS nombre_cliente, c.apellido
FROM Transacciones t
LEFT JOIN Cuentas_Bancarias cb ON t.cuenta_id = cb.cuenta_id
LEFT JOIN Clientes c ON cb.cliente_id = c.cliente_id
WHERE t.monto < 100;

-- 8. Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados, pero solo si el departamento está en "HR".
SELECT e.empleado_id, e.nombre AS nombre_empleado, e.apellido, e.direccion, e.telefono, e.correo_electronico, e.fecha_contratacion,
         p.nombre AS posicion, e.salario, s.nombre AS sucursal, s.direccion AS direccion_sucursal, s.telefono AS telefono_sucursal
FROM Empleados e
    LEFT JOIN Sucursales s ON e.sucursal_id = s.sucursal_id
    LEFT JOIN Posiciones p ON e.posicion = p.posicion_id
WHERE p.nombre = 'HR';

-- 9. Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta.
SELECT cb.cuenta_id, b.numero_cuenta, b.saldo, b.fecha_apertura, c.cliente_id, c.nombre AS nombre_cliente, c.apellido, t.transaccion_id, 
        t.tipo_transaccion, t.monto, t.fecha_transaccion, t.descripcion
FROM Cuentas_Bancarias cb
    JOIN Clientes c ON cb.cliente_id = c.cliente_id
    LEFT JOIN Transacciones t ON cb.cuenta_id = t.cuenta_id;

-- 10. Selecciona todas las transacciones, los clientes y las cuentas, incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.
SELECT t.transaccion_id, t.cuenta_id, t.tipo_transaccion, t.monto, t.fecha_transaccion, t.descripcion, c.cliente_id, c.nombre AS nombre_cliente, 
        c.apellido, b.numero_cuenta, b.saldo
FROM Transacciones t
LEFT JOIN Cuentas_Bancarias cb ON t.cuenta_id = cb.cuenta_id
LEFT JOIN Clientes c ON cb.cliente_id = c.cliente_id;