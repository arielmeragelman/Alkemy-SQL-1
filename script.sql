-- 02 De la tabla ORDERS obtener los números de las últimas 5 órdenes
 SELECT orderNumber FROM orders ORDER BY orderDate DESC LIMIT 5;

-- 04 Indicar en una misma consulta: la cantidad de registros de la tabla productos, el precio promedio de los mismos, el precio maximo y el precio minimo y la suma total de productos en stock (sin agrupar por producto)
 SELECT count(*) as 'Cantidad', avg(buyPrice) as 'Precio Promedio', max(buyPrice) as 'Precio Máximo', min(buyPrice) as 'Precio Mínimo', sum(quantityInStock) as 'Stock Total' FROM products;

-- 06. Obtener la cantidad de clientes por país, ordenado de mayor a menor.
 SELECT country as 'País', COUNT(country) as 'Recuento' FROM customers GROUP BY country ORDER BY 2 DESC;

-- 08. Obtener todas las ordenes por número de cliente que hayan sido emitidas en el año 2005. Solo mostrar aquellos clientes con mas de 3 ordenes.
 SELECT customerNumber as 'Numero de Cliente', count(orderNumber) as 'Cantidad de Ordenes' FROM orders WHERE YEAR(orderDate) = 2005 GROUP BY customerNumber HAVING COUNT(orderNumber) > 3;

-- 10. Obtener los nombres de los clientes y el monto (amount) de aquellos que relizaron compras en los meses de Marzo de cada año. Ordenar por monto de mayor a menor
 SELECT c.customerName as 'Nombre Cliente', SUM(p.amount) as 'Monto Total' FROM payments p JOIN customers c ON p.customerNumber = c.customerNumber WHERE MONTH(p.paymentDate) = 3 GROUP BY p.customerNumber ORDER BY SUM(p.amount) DESC;

-- 12. Obtener los registros de los productos cuyo codigo inicie con la secuencia " S10_ "
 SELECT * FROM products WHERE productCode LIKE 'S10_%';

-- 14.  Obtenga los codigos de los pagos (payments) , fecha y monto de aquellos que comienzan con la secuencia "IP" y son mayores o iguales a 1000
 SELECT checkNumber as 'Código de Pago', paymentDate as 'Fecha', amount as 'Monto' FROM payments WHERE checkNumber LIKE 'IP%' AND amount >= 1000;

-- 16. Obtener la cantidad de cheques emitidos por año desde el mas actual hasta el mas antiguo, el importe promedio de los mismos, el máximo
-- importe y el mínimo importe
 SELECT YEAR(paymentDate) as 'Año', COUNT(checkNumber) as 'Cantidad', AVG(amount) as 'Monto Promedio', MAX(amount) as 'Monto Máximo', MIN(amount) as 'Monto Mínimo' FROM payments GROUP BY YEAR(paymentDate) ORDER BY 1 DESC;


-- 18. Obtener el listado de clientes que sean USA o España cuyo límite de crédito sea mayor a 50000 o
-- que no tengan ningun representate de venta asignado
 SELECT * FROM customers WHERE LOWER(country) IN ('spain', 'usa') AND (creditLimit > 50000 OR salesRepEmployeeNumber IS NULL);
