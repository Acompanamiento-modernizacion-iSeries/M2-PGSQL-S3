--Selecciona todos los clientes junto con los detalles de sus cuentas
SELECT 
    clientes.*, 
    cuentas_bancarias.*
FROM 
    clientes
LEFT JOIN 
    cuentas_bancarias ON clientes.cliente_id = cuentas_bancarias.cliente_id;

--Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal
SELECT 
    empleados.*, 
    sucursales.*
FROM 
    empleados
LEFT JOIN 
    sucursales ON empleados.sucursal_id = sucursales.sucursal_id;

--Selecciona todos los clientes y sus transacciones, incluyendo aquellas transacciones que no tienen clientes asignados
SELECT 
    clientes.*, 
    transacciones.*
FROM 
    clientes
LEFT JOIN 
    cuentas_bancarias ON clientes.cliente_id = cuentas_bancarias.cliente_id
LEFT JOIN 
    transacciones ON cuentas_bancarias.cuenta_id = transacciones.cuenta_id;

--Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados
SELECT 
    empleados.*, 
    departamentos.*
FROM 
    empleados
FULL OUTER JOIN 
    empleados_departamentos ON empleados.empleado_id = empleados_departamentos.empleado_id
FULL OUTER JOIN 
    departamentos ON empleados_departamentos.departamento_id = departamentos.departamento_id;

--Selecciona los clientes que tienen cuentas con un saldo mayor a 5000
SELECT 
    clientes.*
FROM 
    clientes
INNER JOIN 
    cuentas_bancarias ON clientes.cliente_id = cuentas_bancarias.cliente_id
WHERE 
    cuentas_bancarias.saldo > 5000;

--Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal, pero solo si la sucursal está en "New York"
SELECT 
    empleados.*, 
    sucursales.*
FROM 
    empleados
LEFT JOIN 
    sucursales ON empleados.sucursal_id = sucursales.sucursal_id
WHERE 
    sucursales.nombre = 'New York' OR sucursales.sucursal_id IS NULL;

--Selecciona todas las transacciones y los clientes asociados, incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100
SELECT 
    transacciones.*, 
    clientes.*
FROM 
    transacciones
LEFT JOIN 
    cuentas_bancarias ON transacciones.cuenta_id = cuentas_bancarias.cuenta_id
LEFT JOIN 
    clientes ON cuentas_bancarias.cliente_id = clientes.cliente_id
WHERE 
    transacciones.monto < 100;

--Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados, pero solo si el departamento está en "HR"
SELECT 
    empleados.*, 
    departamentos.*
FROM 
    empleados
FULL OUTER JOIN 
    empleados_departamentos ON empleados.empleado_id = empleados_departamentos.empleado_id
FULL OUTER JOIN 
    departamentos ON empleados_departamentos.departamento_id = departamentos.departamento_id
WHERE 
    departamentos.nombre = 'HR' OR departamentos.departamento_id IS NULL;

--Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta
SELECT 
    cuentas_bancarias.*, 
    clientes.*, 
    transacciones.*
FROM 
    cuentas_bancarias
LEFT JOIN 
    clientes ON cuentas_bancarias.cliente_id = clientes.cliente_id
LEFT JOIN 
    transacciones ON cuentas_bancarias.cuenta_id = transacciones.cuenta_id;

--Selecciona todas las transacciones, los clientes y las cuentas, incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta
SELECT 
    transacciones.*, 
    cuentas_bancarias.*, 
    clientes.*
FROM 
    transacciones
LEFT JOIN 
    cuentas_bancarias ON transacciones.cuenta_id = cuentas_bancarias.cuenta_id
LEFT JOIN 
    clientes ON cuentas_bancarias.cliente_id = clientes.cliente_id;