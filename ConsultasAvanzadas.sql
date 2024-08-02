Consultas Avanzadas con joins
1. select * from clientes c inner join cuentas b on c.cliente_id = b.cliente_id
2. select * from empleados e left join sucursales s on e.sucursal_id = s.sucursal_id
3. select * from clientes c inner join cuentas b on c.cliente_id = b.cliente_id 
   right join transacciones t on b.cuenta_id = t.cuenta_id 
4. select * from empleados e full join sucursales s on e.sucursal_id = s.sucursal_id
5. select * from clientes c inner join cuentas b on c.cliente_id = b.cliente_id 
   where b.saldo > 5000
6. select * from empleados e left join sucursales s on e.sucursal_id = s.sucursal_id
   where s.nombre = 'Central'
7. select * from clientes c inner join cuentas b on c.cliente_id = b.cliente_id 
   right join transacciones t on b.cuenta_id = t.cuenta_id where t.monto < 100
8. select * from empleados e full join sucursales s on e.sucursal_id = s.sucursal_id
   where s.direccion = 'HR'
9. select * from cuentas b inner join clientes c on b.cliente_id = c.cliente_id
   join transacciones t on b.cuenta_id = t.cuenta_id
10.select * from transacciones t full join cuentas b on t.cuenta_id = b.cuenta_id
   full join clientes c on b.cliente_id = c.cliente_id