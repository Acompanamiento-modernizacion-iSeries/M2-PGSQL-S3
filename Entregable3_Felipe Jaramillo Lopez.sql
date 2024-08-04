1. 
select * from public.clientes
join public.cuentas on clientes.cliente_id = cuentas.cliente_id;

2.
select * from public.empleados
join public.sucursales on empleados.sucursal_id = sucursales.sucursal_id ;

3.
select * from public.clientes
join public.cuentas on clientes.cliente_id = cuentas.cliente_id
join public.transacciones on cuentas.cuenta_id = transacciones.cuenta_id;

4. 
select * from public.empleados
right join public.departamentos on empleados.sucursal_id = departamentos.id;

5.
select * from public.clientes
join public.cuentas on clientes.cliente_id = cuentas.cliente_id
where saldo > 5000;

6.
select * from public.empleados 
join public.sucursales on empleados.sucursal_id = sucursales.sucursal_id
where sucursales.nombre  = 'New York';

7.
select * from public.transacciones
join public.cuentas on 	transacciones.cuenta_id = cuentas.cuenta_id
join public.clientes on cuentas.cliente_id = clientes.cliente_id
where transacciones.monto < 100;

8.
select * from public.empleados
left join public.departamentos on empleados.departamento_id = departamentos.id 
where departamentos.nombre = 'HR';

9.
select * from public.transacciones
join public.cuentas on 	transacciones.cuenta_id = cuentas.cuenta_id
join public.clientes on cuentas.cliente_id = clientes.cliente_id ;

10.
select * from public.transacciones
left  join public.cuentas on 	transacciones.cuenta_id = cuentas.cuenta_id
right join public.clientes on cuentas.cliente_id = clientes.cliente_id ;

