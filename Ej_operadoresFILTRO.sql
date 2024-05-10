-- PAIR PROGRAMMING OPERADORES ESPECIALES


USE tienda;

SELECT  'Hola!'  AS tipo_nombre
FROM customers;

-- 1 Ciudades que empiezan con "A" o "B".
SELECT city, customer_name, CONCAT(contact_first_name,contact_last_name) AS NombreCompleto
FROM customers
WHERE city LIKE "A%" OR city LIKE "B%";

-- 2 Número de pedidos que han hecho en las ciudades que empiezan con L.
SELECT city, customer_name AS "empresa", CONCAT(contact_first_name,contact_last_name) AS NombreCompleto
FROM customers
WHERE city LIKE "L%"
 
SELECT COUNT(customer_number) AS num_pedidos, order_number
FROM orders
GROUP BY customer_number;

-- PRUEBA 2
SELECT customers.city, customers.customer_name AS "empresa", CONCAT(contact_first_name,contact_last_name) AS PersonaContacto, orders.customer_number 
FROM customers
INNER JOIN orders
ON customers.customer_number = orders.customer_number
WHERE customers.city LIKE "L%" AND COUNT(orders.customer_number)
GROUP BY customer_number;
 