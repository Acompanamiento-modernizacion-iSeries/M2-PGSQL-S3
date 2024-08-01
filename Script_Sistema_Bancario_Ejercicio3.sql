--EJERCICIOS 2: POSTGRESS 
--HAROLD CHOLES

-- 1. SELECCIONA TODOS LOS CLIENTES JUNTO CON LOS DETALLES DE SUS CUENTAS.
SELECT clientes.*, cuentas_bancarias.* FROM clientes 
INNER JOIN cuentas_Bancarias ON clientes.cliente_id = cuentas_Bancarias.cliente_id;

-- 2. SELECCIONA TODOS LOS EMPLEADOS Y LAS SUCURSALES DONDE TRABAJAN, INCLUYENDO 
--    AQUELLOS EMPLEADOS QUE NO ESTÁN ASIGNADOS A NINGUNA SUCURSAL.
SELECT empleados.*, sucursales.* FROM empleados
LEFT JOIN sucursales ON empleados.sucursal_id = sucursales.sucursal_id;

-- 3. SELECCIONA TODOS LOS CLIENTES Y SUS TRANSACCIONES, INCLUYENDO AQUELLAS TRANSACCIONES QUE NO TIENEN CLIENTES ASIGNADOS.
SELECT clientes.*, transacciones.* FROM clientes
RIGHT JOIN transacciones ON clientes.cliente_id = transacciones.cuenta_id;

-- 4. SELECCIONA TODOS LOS EMPLEADOS Y LOS DEPARTAMENTOS, INCLUYENDO AQUELLOS EMPLEADOS 
--    QUE NO ESTÁN ASIGNADOS A UN DEPARTAMENTO Y AQUELLOS DEPARTAMENTOS SIN EMPLEADOS.
SELECT empleados.*, sucursales.* FROM Empleados
FULL OUTER JOIN sucursales ON empleados.sucursal_id = sucursales.sucursal_id;

-- 5. SELECCIONA LOS CLIENTES QUE TIENEN CUENTAS CON UN SALDO MAYOR A 5000.
SELECT clientes.* FROM clientes
JOIN cuentas_bancarias ON clientes.cliente_id = cuentas_Bancarias.cliente_id
WHERE (cuentas_bancarias.saldo > '5000'); -- SE COLOCA DE ESTA MANERA POR QUE EL CAMPO ES TIPO MONEY

-- 6. SELECCIONA TODOS LOS EMPLEADOS Y LAS SUCURSALES DONDE TRABAJAN, INCLUYENDO AQUELLOS EMPLEADOS 
--    QUE NO ESTÁN ASIGNADOS A NINGUNA SUCURSAL, PERO SOLO SI LA SUCURSAL ESTÁ EN "NEW YORK".
SELECT empleados.*, sucursales.* FROM empleados
LEFT JOIN sucursales ON empleados.sucursal_id = sucursales.sucursal_id
WHERE sucursales.direccion like  '%New York%' OR sucursales.direccion IS NULL;

-- 7. SELECCIONA TODAS LAS TRANSACCIONES Y LOS CLIENTES ASOCIADOS, INCLUYENDO AQUELLAS 
--    TRANSACCIONES SIN CLIENTES, PERO SOLO SI EL MONTO DE LA TRANSACCIÓN ES MENOR A 100.
SELECT transacciones.*, clientes.* FROM transacciones
LEFT JOIN clientes ON transacciones.cuenta_id = clientes.cliente_id
WHERE transacciones.monto_trans < '100';  -- SE COLOCA DE ESTA MANERA POR QUE EL CAMPO ES TIPO MONEY

-- 8. SELECCIONA TODOS LOS EMPLEADOS Y LOS DEPARTAMENTOS, INCLUYENDO AQUELLOS 
--    EMPLEADOS QUE NO ESTÁN ASIGNADOS A UN DEPARTAMENTO Y AQUELLOS DEPARTAMENTOS SIN EMPLEADOS, 
--    PERO SOLO SI EL DEPARTAMENTO ESTÁ EN "HR".
SELECT empleados.*, sucursales.* FROM empleados
FULL OUTER JOIN sucursales ON empleados.sucursal_id = sucursales.sucursal_id
WHERE sucursales.nombre = 'HR' OR sucursales.nombre IS NULL;

-- 9. SELECCIONA LAS CUENTAS, LOS CLIENTES Y LAS TRANSACCIONES ASOCIADAS A CADA CUENTA.
SELECT cuentas_Bancarias.*, clientes.*, transacciones.* FROM cuentas_bancarias
JOIN clientes ON cuentas_bancarias.cliente_id = clientes.cliente_id
JOIN transacciones ON cuentas_bancarias.cuenta_id = transacciones.cuenta_id;

-- 10. SELECCIONA TODAS LAS TRANSACCIONES, LOS CLIENTES Y LAS CUENTAS, INCLUYENDO 
--     AQUELLAS TRANSACCIONES QUE NO ESTÁN ASIGNADAS A NINGÚN CLIENTE O CUENTA.
SELECT transacciones.*, clientes.*, cuentas_bancarias.* FROM transacciones
LEFT JOIN clientes ON transacciones.cuenta_id = clientes.cliente_id
LEFT JOIN cuentas_bancarias ON transacciones.cuenta_id = cuentas_bancarias.cuenta_id;