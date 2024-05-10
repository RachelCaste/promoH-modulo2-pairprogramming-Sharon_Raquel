 CREATE SCHEMA `tienda_zapatillas`;
 USE `tienda_zapatillas`;
 
 CREATE TABLE zapatillas(
 id_zapatilla INT NOT NULL AUTO_INCREMENT,
 modelo CHAR(45) NOT NULL,
 color CHAR(45) NOT NULL,
 PRIMARY KEY (id_zapatilla)
 );
 
 CREATE TABLE clientes(
 id_cliente INT NOT NULL AUTO_INCREMENT,
 nombre CHAR(45) NOT NULL,
 numero_telefono INT NOT NULL,
 email CHAR(45) NOT NULL,
 direccion CHAR(45) NOT NULL,
 ciudad CHAR(45) NOT NULL,
 provincia CHAR(45) NOT NULL,
 pais CHAR(45) NOT NULL,
 codigo_postal CHAR(45) NOT NULL,
 PRIMARY KEY (id_cliente)
 );
 
CREATE TABLE empleados(
id_empleado INT NOT NULL AUTO_INCREMENT,
nombre CHAR(45) NOT NULL,
tienda CHAR(45) NOT NULL,
salario INT NULL,
fecha_incorporacion DATE NOT NULL,
PRIMARY KEY (id_empleado)
);

CREATE TABLE facturas(
id_factura INT AUTO_INCREMENT NOT NULL,
numero_factura CHAR(45) NOT NULL,
fecha DATE NOT NULL,
id_zapatilla INT NOT NULL,
id_empleado INT NOT NULL,
id_cliente INT NOT NULL,
PRIMARY KEY (id_factura),
FOREIGN KEY (id_zapatilla)
REFERENCES zapatillas (id_zapatilla),
FOREIGN KEY (id_empleado)
REFERENCES empleados (id_empleado),
FOREIGN KEY (id_cliente)
REFERENCES clientes (id_cliente)
);

ALTER TABLE zapatillas 
ADD COLUMN (marca CHAR(45) NOT NULL, talla INT NOT NULL);

ALTER TABLE empleados
MODIFY COLUMN salario DECIMAL(10.2);

ALTER TABLE clientes
DROP COLUMN pais;

ALTER TABLE facturas
MODIFY COLUMN total DECIMAL(10,2);

ALTER TABLE empleados
MODIFY COLUMN salario DECIMAL(10,2);

INSERT INTO zapatillas (modelo, color,marca ,talla)
VALUES ("XQYUN", "Negro", "Nike", 42), 
("UOPMN", "Rosas", "Nike", 39), 
("OPNYT", "Verdes", "Adidas", 35);

INSERT INTO empleados (nombre, tienda,salario,fecha_incorporacion)
VALUES ("Laura", "Alcobendas", 25987, "2010/09/03"),
("María", "Sevilla", NULL, "2002/04/11"),
("Ester", "Oviedo", 30165.98, "2000/11/29");

INSERT INTO clientes (nombre,numero_telefono, email,direccion, ciudad, provincia,codigo_postal)
VALUES ("Monica", 1234567289, "monica@email.com", "Calle Felicidad" ,"Móstoles" ,"Madrid","28176"),
("Lorena", 289345678, "lorena@email.com", "Calle Alegria", "Barcelona", "Barcelona", "12346"),
("Carmen", 298463759, "carmen@email.com", "Calle del Color", "Vigo", "Pontevedra", "23456");

INSERT INTO facturas (numero_factura, fecha, id_zapatilla, id_empleado,id_cliente, total)
VALUES ("123", "2001/12/11", 1, 2, 1, 54.98),
("1234", "2005/05/23", 1, 1,3,89.91),
("12345", "2015/09/18", 2, 3,3,76.23);

UPDATE zapatillas
SET color = "Amarillas"
WHERE color = "Rosas";

UPDATE empleados
SET tienda = "A Coruña"
WHERE id_empleado = 1;

UPDATE clientes
SET numero_telefono = 123456728
WHERE nombre = "Monica";

UPDATE facturas
SET total = 89.91
WHERE id_factura = 2;

