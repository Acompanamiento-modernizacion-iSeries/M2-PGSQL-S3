select *  from clientes a inner join cuentas_bancarias b on a.cliente_id = b.cliente_id;

select *  from empleados a left join sucursales b on a.sucursal_id = b.sucursal_id;

select *  from clientes a inner join cuentas_bancarias b on a.cliente_id = b.cliente_id
 Right join  transacciones c on b.cuenta_id =c.cuenta_id;
 
create table departamentos(
departamento_id serial   primary key  ,
nombre varchar (50)    NOT NULL
) ;

ALTER TABLE public empleados
    ADD COLUMN departamento_id int REFERENCES departamentos(departamento_id) ;
	
select *  from empleados a FULL join departamentos b on a.departamento_id = b.departamento_id;

select *  from clientes a inner join cuentas_bancarias b on a.cliente_id = b.cliente_id
WHERE saldo > 5000;

select *  from empleados a left join sucursales b 
on a.sucursal_id = b.sucursal_id where b.nombre = 'New York';

select *  from clientes a inner join cuentas_bancarias b on a.cliente_id = b.cliente_id
 Right join  transacciones c on b.cuenta_id =c.cuenta_id and monto <100;
 
 select *  from empleados a full join departamentos b 
 on a.departamento_id = b.departamento_id and b.nombre ='HR' ;

select *  from cuentas_bancarias b join clientes a on a.cliente_id = b.cliente_id
join transacciones c on b.cuenta_id =c.cuenta_id;

select *  from transacciones c left join cuentas_bancarias b on b.cuenta_id =c.cuenta_id
left join clientes a on a.cliente_id = b.cliente_id;


 







	



