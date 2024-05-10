SELECT id, last_name, first_name
FROM employees;

SELECT list_price
FROM products
WHERE list_price BETWEEN 0 and 5;

SELECT * FROM products
WHERE list_price BETWEEN 0 and 5;

SELECT * FROM products -- no hay ningun producto sin precio
WHERE list_price IS NULL;

SELECT * FROM products
WHERE id < 20 AND list_price < 15;


SELECT * FROM products
WHERE id > 20 AND list_price > 15;

SELECT * FROM products
WHERE NOT id < 20 AND NOT list_price < 15;

SELECT ship_city, ship_state_province FROM orders;

SELECT id, product_name, list_price FROM products
LIMIT 10;

-- 11 a misma consulta pero que nos muestre los últimos 10 productos según su ID de manera descendiente.
SELECT id, product_name, list_price FROM products
ORDER BY id DESC
LIMIT 10;

-- 12 conocer los distintos pedidos que hemos tenido (mostrar los valores únicos de ID en la tabla order_details)
SELECT DISTINCT order_id
FROM order_details;

-- 13 Crea una columna en esta consulta con el alias ImporteTotal. Nota: Utiliza unit_price y quantity para calcular el importe total.
SELECT order_id, (unit_price*quantity) AS DineroTotal  
FROM order_details   
ORDER BY DineroTotal DESC
LIMIT 3;

-- 14 pedidos entre 5-10 de ranking
 SELECT order_id, (unit_price*quantity) AS DineroTotal  
FROM order_details   
ORDER BY DineroTotal DESC
LIMIT 6 OFFSET 4;

-- 15) lista de las categorías que componen los tipos de pedido de la empresa. Queremos que la lista de resultado sea renombrada como "NombreDeCategoria".
SELECT category AS "NombreDeCategoria"
FROM products;

-- 16) conocer cuál sería la fecha de envío (ShippedDate) de los pedidos almacenados en la base de datos, si estos sufrieran un retraso de 5 días. Nos piden mostrar la nueva fecha renombrada como FechaRetrasada.
SELECT id, order_date, shipped_date, DATE_ADD(shipped_date, INTERVAL 5 DAY) as FechaRetrasada 
FROM orders;

-- 17) precio mayor o igual a 15 dólares, pero menor o igual que 50 dólares. Selecciona los datos de ese rango de productos usando el operador BETWEEN.
SELECT *
FROM products
WHERE 15 <= list_price <=50;

SELECT *
FROM products
WHERE list_price BETWEEN 15 AND 50;

-- 18) productos que tengan exactamente un precio de 18, 19 o 20 dólares (un rango muy concreto de precios del que la empresa quiere maximizar sus ventas en un futuro). Usa IN

SELECT *
FROM products
WHERE list_price IN(18,19,20);

