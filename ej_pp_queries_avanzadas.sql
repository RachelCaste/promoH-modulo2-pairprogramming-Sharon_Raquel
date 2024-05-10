/* PAIR PROGRAMMING
 1*/

SELECT ProductName, UnitPrice AS highest_price
FROM products
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM products);

SELECT ProductName, UnitPrice AS lowest_price
FROM products
WHERE UnitPrice = (SELECT MIN(UnitPrice) FROM products);

-- 2 conocer el número de productos y el precio medio de todos ellos (en general, no por cada producto)
SELECT AVG(UnitPrice) AS media_precios , SUM(UnitsInStock) AS total_products
FROM products; 

-- 3  máxima y mínima cantidad de carga para un pedido (freight) enviado a Reino Unido (United Kingdom).
SELECT MIN(Freight), MAX(Freight)
FROM orders
WHERE ShipCountry= "UK";

-- 4- qué productoS se venden por encima del precio medio para todos los productos de la empresa, ya que sospechan que dicho número es demasiado elevado. También quieren que ordenemos los resultados por su precio de mayor a menor.
SELECT ProductName, AVG(UnitPrice) AS media_precio
FROM products 
GROUP BY ProductName
HAVING media_precio
ORDER BY media_precio ASC;

-- 5  Discontinued es un booleano: si es igual a 1 el producto ha sido descontinuado.
SELECT COUNT(*) AS product_descont
FROM products
WHERE Discontinued = 1;

-- 6 aquellos productos no descontinuados, sobre todo el ProductID y ProductName. Como puede que salgan demasiados resultados, nos piden que los limitemos a los 10 con ID más elevado
SELECT ProductID, ProductName, Discontinued 
FROM products
GROUP BY ProductID,ProductName
HAVING Discontinued= 0
LIMIT 10;

