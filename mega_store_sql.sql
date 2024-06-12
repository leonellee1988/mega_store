--- Elimación de tablas:

DROP TABLE ventas_diarias CASCADE;

--- Creación de tablas:

CREATE TABLE familia(
	codigo_familia bigserial PRIMARY KEY,
	nombre_familia varchar(50) NOT NULL
);

SELECT * FROM familia;

CREATE TABLE producto(
	codigo_producto bigserial PRIMARY KEY,
	nombre_producto varchar(50) NOT NULL,
	costo_producto decimal(10,2) NOT NULL,
	margen_producto decimal(10,2) NOT NULL,
	codigo_familia integer NOT NULL,
	FOREIGN KEY (codigo_familia) REFERENCES familia (codigo_familia)
);

SELECT * FROM producto;

CREATE TABLE vendedor(
	codigo_vendedor bigserial PRIMARY KEY,
	nombre_vendedor varchar(50) NOT NULL,
	fecha_nacimiento date NOT NULL,
	salario_vendedor decimal(10,2) NOT NULL
);

SELECT * FROM vendedor;

CREATE TABLE ventas_diarias(
	numero_factura bigserial PRIMARY KEY,
	fecha_factura date NOT NULL,
	codigo_producto integer NOT NULL,
	cantidad_factura integer NOT NULL,
	codigo_vendedor integer NOT NULL
);

SELECT * FROM ventas_diarias;

-- Insertar registros en tablas:

INSERT INTO familia (nombre_familia) VALUES
('Electrodomésticos'),
('Muebles'),
('Ropa'),
('Calzado'),
('Juguetes'),
('Libros'),
('Tecnología'),
('Deportes'),
('Alimentos'),
('Bebidas');

SELECT * FROM familia;

INSERT INTO producto (nombre_producto, costo_producto, margen_producto, codigo_familia) VALUES
('Refrigerador', 500.00, 0.30, 1),
('Lavadora', 300.00, 0.35, 1),
('Microondas', 150.00, 0.40, 1),
('Televisor', 800.00, 0.25, 1),
('Aspiradora', 120.00, 0.45, 1),

('Sofá', 600.00, 0.30, 2),
('Mesa', 200.00, 0.35, 2),
('Silla', 80.00, 0.40, 2),
('Cama', 400.00, 0.25, 2),
('Estantería', 150.00, 0.45, 2),

('Camiseta', 20.00, 0.35, 3),
('Pantalón', 40.00, 0.40, 3),
('Chaqueta', 60.00, 0.45, 3),
('Vestido', 50.00, 0.30, 3),
('Falda', 30.00, 0.25, 3),

('Zapatos Deportivos', 70.00, 0.40, 4),
('Sandalias', 30.00, 0.35, 4),
('Botas', 90.00, 0.30, 4),
('Zapatillas', 60.00, 0.45, 4),
('Mocasines', 80.00, 0.25, 4),

('Muñeca', 25.00, 0.35, 5),
('Pelota', 15.00, 0.40, 5),
('Puzzle', 20.00, 0.45, 5),
('Lego', 50.00, 0.30, 5),
('Coche de Juguete', 35.00, 0.25, 5),

('Libro de Ciencia', 30.00, 0.35, 6),
('Novela', 25.00, 0.40, 6),
('Libro Infantil', 20.00, 0.45, 6),
('Enciclopedia', 70.00, 0.30, 6),
('Comic', 15.00, 0.25, 6),

('Teléfono Móvil', 600.00, 0.35, 7),
('Portátil', 1000.00, 0.40, 7),
('Tablet', 400.00, 0.45, 7),
('Smartwatch', 200.00, 0.30, 7),
('Auriculares', 100.00, 0.25, 7),

('Bicicleta', 150.00, 0.35, 8),
('Pesas', 50.00, 0.40, 8),
('Pelota de Fútbol', 30.00, 0.45, 8),
('Raqueta de Tenis', 80.00, 0.30, 8),
('Cinta de Correr', 600.00, 0.25, 8),

('Pan', 1.00, 0.35, 9),
('Leche', 1.20, 0.40, 9),
('Queso', 5.00, 0.45, 9),
('Carne', 10.00, 0.30, 9),
('Frutas', 3.00, 0.25, 9),

('Agua', 0.50, 0.35, 10),
('Refresco', 1.00, 0.40, 10),
('Cerveza', 1.50, 0.45, 10),
('Vino', 10.00, 0.30, 10),
('Jugo', 2.00, 0.25, 10);

SELECT * FROM producto;

INSERT INTO vendedor (nombre_vendedor, fecha_nacimiento, salario_vendedor) VALUES
('Carlos Pérez', '1980-05-15', 1500.00),
('Ana García', '1990-11-20', 1600.00),
('Luis Martínez', '1985-03-10', 1700.00),
('Marta Rodríguez', '1992-07-25', 1800.00),
('José Sánchez', '1978-02-28', 1900.00);

SELECT * FROM vendedor;

INSERT INTO ventas_diarias (fecha_factura, codigo_producto, cantidad_factura, codigo_vendedor)
SELECT
    DATE '2024-01-01' + (random() * (DATE '2024-05-31' - DATE '2024-01-01'))::integer,
    (random() * 50 + 1)::integer,  -- Ajusta según la cantidad de productos
    (random() * 20 + 1)::integer,  -- Cantidad aleatoria
    (random() * 5 + 1)::integer    -- Ajusta según la cantidad de vendedores
FROM generate_series(1, 10000);

SELECT * FROM ventas_diarias;

--- Creación de un outlier:

UPDATE ventas_diarias
SET cantidad_factura = 50
WHERE numero_factura = 350;