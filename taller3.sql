--1. Enunciado: Selecciona todos los clientes junto con los detalles de sus cuentas.
Select T1.cliente_id, T1.nombre, t1.apellido, T2.numero_cuenta, T2.tipo_cuenta, T2.saldo, T2.fecha_apertura, T2.estado 
from Clientes As T1
Join Cuentas As T2 On T1.cliente_id = T2.cliente_id;

--2. Enunciado: Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal.
Select * from Empleados As T1
Left Join Sucursales As T2 On T1.sucursal_id = T2.sucursal_id;

--3. Enunciado: Selecciona todos los clientes y sus transacciones, incluyendo aquellas transacciones que no tienen clientes asignados.
Select * from Clientes As T1
Join Cuentas As T2 On t1.cliente_id = T2.cliente_id
Right Join Transacciones As T3 On  T2.numero_cuenta = T3.cuenta_id;

--4. Enunciado: Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados.
Select * from Empleados 
Join Departamentos

--5. Enunciado: Selecciona los clientes que tienen cuentas con un saldo mayor a 5000.
Select *  from Clientes As T1
Join Cuentas As T2 On T1.cliente_id = T2.cliente_id
Where saldo > 5000;

--6. Enunciado: Selecciona todos los empleados y las sucursales donde trabajan, incluyendo aquellos empleados que no están asignados a ninguna sucursal, pero solo si la sucursal está en "New York".
Select * from Empleados As T1
Left Join Sucursales As T2 On T1.sucursal_id = T2.sucursal_id
Where T2.nombre = 'New York';

--7. Enunciado: Selecciona todas las transacciones y los clientes asociados, incluyendo aquellas transacciones sin clientes, pero solo si el monto de la transacción es menor a 100.
Select * from Transacciones As T1
Left Join Cuentas As T2 On T1.cuenta_id = T2.numero_cuenta
Join Clientes As T3 On T2.cliente_id = T3.cliente_id
where T1.monto < 100000;

--8. Enunciado: Selecciona todos los empleados y los departamentos, incluyendo aquellos empleados que no están asignados a un departamento y aquellos departamentos sin empleados, pero solo si el departamento está en "HR".
Select * from Empleados 
--9. Enunciado: Selecciona las cuentas, los clientes y las transacciones asociadas a cada cuenta.
Select * from Cuentas As t1
Join Clientes As T2 On T1.cliente_id = T2.cliente_id
Join Transacciones As T3 On T1.numero_cuenta = t3.cuenta_id;

--10. Enunciado: Selecciona todas las transacciones, los clientes y las cuentas, incluyendo aquellas transacciones que no están asignadas a ningún cliente o cuenta.
Select * from Transacciones As T1
Left Join Cuentas As T2 On T1.cuenta_id = T2.numero_cuenta
Join Clientes As T3 On T2.cliente_id = T3.cliente_id;