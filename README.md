# Alkemy-SQL-1
Ejercicio Grupal de resolución de consultas SQL


Se nos propuso ejecutar un script para crear una base de datos con una sintaxis de MySQL
Los archivos y consultas estan en:
https://drive.google.com/drive/folders/1765YHnYS7wl7od_RDqMsF6SwIV99vAhZ?usp=share_link

Luego se dividio en 2 grupos donde los ejercicios que se adjuntan en el archivo script.sql contienen la resolución que encontramos en mi equipo para los ejercicios pares.
Los impares se dejan aqui adjuntos en el readme a los cuales realizamos un review luego de que otro equipo nos pasara las respuestas para validarlas y probar las mismas.




#Mostrar el precio máximo de los productos de la tabla PRODUCTS por línea de producto y renombrar ese campo como Precio_Maximo

SELECT productLine as Linea_Producto
     , MAX(buyPrice) as Precio_Maximo
  FROM products p 
 GROUP BY productLine 
 
#De la tabla EMPLOYEES mostrar cuanta cantidad de representantes de ventas hay en cada oficina que no sea la 4.
 
SELECT officeCode as Oficina
     , COUNT(1) as Cant_Representantes
  FROM employees e 
 WHERE officeCode != 4
   AND UPPER(jobTitle) = 'SALES REP'
 GROUP BY officeCode 
 
# Mostrar en una tabla el número de cada orden, la cantidad y la fecha de envío (shippedDate)
 
SELECT o.orderNumber AS Numero_Orden
     , SUM(od.quantityOrdered) AS Cant_Ordenada
     , o.shippedDate AS Fec_Envio
  FROM orders o 
 INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber 
 GROUP BY o.orderNumber 
 
# Obtener la cantidad de clientes por país, ordenado de mayor a menor. Solo mostrar aquellos países con mas de 5 clientes.
 
SELECT country AS Pais
     , COUNT(1) AS Cant_Clientes
  FROM customers c 
 GROUP BY country 
HAVING COUNT(1) > 5
 ORDER BY 2 DESC
 
# Obtener una lista con los nombres de clientes y la cantidad de ordenes que se emitieron para ellos
 
SELECT c.customerName AS Nombre_Cliente
     , COUNT(1) AS Cant_Ordenes
  FROM customers c 
  LEFT JOIN orders o ON c.customerNumber = o.customerNumber 
 GROUP BY c.customerName 
 ORDER BY 2 DESC
 
# Aplicar un descuento del 10% (buyPrice) a los productos cuya cantidad en stock sea mayor a 8000 (quantityInStock)
 
SELECT (p.buyPrice * 0.9) AS Precio_Descuento 
  FROM products p 
 WHERE quantityInStock > 8000
 
# Obtenga los codigos de producto, nombre, linea a la que pertenecen y descripción de aquellos en los cuales la descripción del producto contenga la palabra "features"
 
SELECT p.productCode 
     , p.productName 
     , p.productLine 
     , p.productDescription 
  FROM products p 
 WHERE UPPER(p.productDescription) LIKE '%FEATURES%'
 
# Obtener los nombres de las líneas de producto que tengan más de una palabra
 
SELECT *
  FROM products p 
 WHERE productName LIKE '% %'
 
# Obtener un listado de ordenes emitidas a clientes de USA mostrando el valor total de cada orden si se le aplicará un aumento del 10%
 
SELECT o.orderNumber 
     , (SUM(od.priceEach * od.quantityOrdered)*1.1) AS Total_Orden
  FROM orders o
 INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber 
 INNER JOIN customers c ON o.customerNumber = c.customerNumber 
 WHERE UPPER(c.country) = 'USA'
GROUP BY o.orderNumber
