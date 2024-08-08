SELECT cl.nombre, cl.apellido, cta.numero_cuenta, cta.tipo_cuenta, cta.saldo FROM clientes cl INNER JOIN cuentas_bancarias cta ON cl.cliente_id = cta.cliente_id

SELECT em.nombre, em.apellido, suc.nombre FROM empleados em LEFT JOIN sucursales suc ON em.sucursal_id = suc.sucursal_id

SELECT cl.nombre, trx.tipo_transaccion FROM transacciones trx LEFT JOIN clientes_transacciones ct ON trx.transaccion_id = ct.transaccion_id LEFT JOIN clientes cl ON ct.cliente_id = cl.cliente_id;

SELECT e.nombre, d.nombre_departamento FROM empleados e FULL OUTER JOIN departamentos d ON e.departamento_id = d.departamento_id;

SELECT cl.nombre, cta.saldo FROM cuentas_bancarias cta INNER JOIN clientes cl ON cta.cliente_id = cl.cliente_id WHERE saldo > 5000

SELECT e.nombre, s.ciudad FROM empleados e LEFT JOIN sucursales s ON e.sucursal_id = s.sucursal_id WHERE s.ciudad = 'New York' OR s.sucursal_id IS NULL;

SELECT cl.nombre, trx.tipo_transaccion, trx.monto FROM transacciones trx LEFT JOIN clientes_transacciones ct ON trx.transaccion_id = ct.transaccion_id LEFT JOIN clientes cl ON ct.cliente_id = cl.cliente_id WHERE monto < 100 OR cl.cliente_id IS NULL;

SELECT e.nombre, d.nombre_departamento FROM empleados e FULL OUTER JOIN departamentos d ON e.departamento_id = d.departamento_id WHERE nombre_departamento = 'HR' OR d.departamento_id is null;

SELECT cta.numero_cuenta, cl.nombre AS cliente_nombre, trx.tipo_transaccion, trx.monto, trx.fecha_transaccion FROM cuentas_bancarias cta JOIN clientes_cuentas cc ON cta.cuenta_id = cc.cuenta_id JOIN clientes cl ON cc.cliente_id = cl.cliente_id LEFT JOIN transacciones trx ON cta.cuenta_id = trx.cuenta_id

SELECT trx.transaccion_id, trx.monto, trx.tipo_transaccion, cl.nombre AS cliente_nombre, cta.numero_cuenta FROM transacciones trx FULL OUTER JOIN clientes_transacciones ct ON trx.transaccion_id = ct.transaccion_id FULL OUTER JOIN clientes cl ON ct.cliente_id = cl.cliente_id FULL OUTER JOIN cuentas_bancarias cta ON trx.cuenta_id = cta.cuenta_id
