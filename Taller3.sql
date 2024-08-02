select * from clientes as a join 
cuentas_bancarias as b on a.cliente_id = b.cliente_id ;

select * from empleados;
select * from sucursales;


select * from empleados as a left join sucursales as b on a.sucursal_id = b.sucursal_id;

select * from clientes; 
select * from transacciones; 
select * from cuentas_bancarias;

select * from cuentas_bancarias;
select * from clientes as a right join cuentas_bancarias as b  
on a.cliente_id = b.cliente_id right join transacciones as c 
on b.cuenta_id = c.cuenta_id; 

select * from clientes as a join 
cuentas_bancarias as b on a.cliente_id = b.cliente_id 
where  b.saldo >= 5000;

select * from empleados as a left join sucursales as b on a.sucursal_id = b.sucursal_id
where b.nombre = 'New York';


select * from transacciones as a join cuentas_bancarias as b 
on a.cuenta_id = b.cuenta_id 
left join clientes as c on c.cliente_id = b.cliente_id
where b.saldo < 100;	

select * from empleados where posicion = 'HR' ;

select * from transacciones as a join cuentas_bancarias as b 
on a.cuenta_id = b.cuenta_id 
join clientes as c on c.cliente_id = b.cliente_id;

select * from transacciones as a LEFT join cuentas_bancarias as b 
on a.cuenta_id = b.cuenta_id 
left join clientes as c on c.cliente_id = b.cliente_id;



