
--Consultas Avanzadas con JOINs para el Sistema Bancario
--1. Enunciado: Selecciona todos los clientes junto con los detalles de sus cuentas.

select a.cliente_id, a.nombre ||' '|| a.apellido, b.* from clientes a
join cuentas_bancarias b on b.cliente_id = a.cliente_id; 

--2. Enunciado: Selecciona todos los empleados y las sucursales donde trabajan, 
--incluyendo aquellos empleados que no están asignados a ninguna sucursal.

select a.empleado_id, a.nombre ||' '||a.apellido, a.sucursal_id, b.nombre
from empleados a
left join sucursales b on b.sucursal_id = a.sucursal_id

--3. Enunciado: Selecciona todos los clientes y sus transacciones, 
--incluyendo aquellas transacciones que no tienen clientes asignados.

select a.cliente_id  ,a.nombre ||' '|| a.apellido, b.cuenta_id, c.*  
from clientes a
join cuentas_bancarias b on  b.cliente_id = a.cliente_id
right join transacciones c on c.cuenta_id = b.cuenta_id;


--4. Enunciado: Selecciona todos los empleados y los departamentos, 
--incluyendo aquellos empleados que no están asignados a un departamento y 
--aquellos departamentos sin empleados.

select a.empleado_id, a.nombre ||' '|| a.apellido, b.nombre
from empleados a
full join departamentos b on a.departamento_id = b.departamento_id;


--5. Enunciado: Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.

select a.cliente_id  ,a.nombre ||' '|| a.apellido, b.cuenta_id, b.saldo  
from clientes a
join cuentas_bancarias b on  b.cliente_id = a.cliente_id
where b.saldo > 5000;

--6. Enunciado: Selecciona todos los empleados y las sucursales donde trabajan, 
--incluyendo aquellos empleados que no están asignados a ninguna sucursal, 
--pero solo si la sucursal está en "New York".

select a.empleado_id ,a.nombre ||' '|| a.apellido, b.sucursal_id, b.nombre
from empleados a 
left join sucursales b on b.sucursal_id = a.sucursal_id
and  b.nombre like '%New York%'; 

select * from sucursales;


--7. Enunciado: Selecciona todas las transacciones y los clientes asociados, 
--incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100.

select a.transaccion_id , a.tipo_transaccion, c.cliente_id, c.nombre||' '||c.apellido, a.monto
from transacciones a
join cuentas_bancarias b on b.cuenta_id = a.cuenta_id
left join clientes c on c.cliente_id = b.cliente_id
where a.monto < 100;


--8. Enunciado: Selecciona todos los empleados y los departamentos,
--incluyendo aquellos empleados que no están asignados a un departamento y 
--aquellos departamentos sin empleados, pero solo si el departamento está en "HR".

select a.empleado_id, a.nombre ||' '|| a.apellido, b.nombre
from empleados a
full join departamentos b on a.departamento_id = b.departamento_id
where upper(b.nombre) like '%HR%';


--9. Enunciado: Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta.

select * 
from cuentas_bancarias a
join clientes b on b.cliente_id = a.cliente_id
join transacciones c on c.cuenta_id = a.cuenta_id ;

--10. Enunciado: Selecciona todas las transacciones, los clientes y las cuentas, 
--incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.

select * 
from transacciones a
left join cuentas_bancarias c on c.cuenta_id = a.cuenta_id
left join clientes b on b.cliente_id = c.cliente_id;







