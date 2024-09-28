/* 
Tabla: clientes
Esta tabla almacena la información relacionada con los clientes. 

Columnas:
-- id: Clave primaria de la tabla, de tipo entero, autoincremental (SERIAL).
-- nombre: Nombre del cliente, de tipo TEXT, obligatorio.
-- direccion: Dirección del cliente, de tipo TEXT, obligatorio.
-- telefono: Número de teléfono del cliente, de tipo TEXT, obligatorio.

Descripción:
-- Esta tabla contiene información básica de los clientes, incluyendo su nombre, dirección, y teléfono.
-- El campo id se genera automáticamente con un valor único para cada registro, sirviendo como clave primaria.
*/
CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  direccion TEXT NOT NULL,
  telefono TEXT NOT NULL
);


/* 
Tabla: productos
Esta tabla almacena la información sobre los productos que están disponibles para los clientes.

Columnas:
-- id: Clave primaria de la tabla, de tipo entero, autoincremental (SERIAL).
-- nombre: Nombre del producto, de tipo TEXT, obligatorio.
-- descripcion: Descripción opcional del producto, de tipo TEXT, no obligatorio.
-- precio: Precio del producto, de tipo NUMERIC con precisión de hasta 10 dígitos en total y 2 decimales, obligatorio.
-- stock: Cantidad en inventario del producto, de tipo INT, obligatorio.

Descripción:
-- Esta tabla almacena los detalles de los productos disponibles, como su nombre, descripción, precio, y la cantidad disponible en el inventario (stock).
-- El campo id se genera automáticamente para cada producto, lo que lo hace único dentro de la tabla.
 */
CREATE TABLE productos (
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  descripcion TEXT,
  precio NUMERIC(10, 2) NOT NULL,
  stock INT NOT NULL
);


/* 
Tabla: instalaciones
Esta tabla registra las instalaciones que se han realizado, relacionando a los clientes con los productos.

Columnas:
-- id: Clave primaria de la tabla, de tipo entero, autoincremental (SERIAL).
-- cliente_id: Referencia a la tabla clientes (campo id), indicando qué cliente está asociado a la instalación, de tipo BIGINT, obligatorio.
-- producto_id: Referencia a la tabla productos (campo id), indicando qué producto se ha instalado, de tipo BIGINT, obligatorio.
-- fecha_instalacion: Fecha en la que se realizó la instalación, de tipo DATE, obligatorio.
-- costo_instalacion: Costo de la instalación, de tipo NUMERIC con precisión de hasta 10 dígitos y 2 decimales, obligatorio.
-- estado: Estado de la instalación, de tipo TEXT, obligatorio (puede ser algo como "completado", "pendiente", etc.).

Descripción:
-- La tabla instalaciones almacena los registros de cada instalación realizada, vinculando a un cliente con un producto.
-- Las columnas cliente_id y producto_id son claves foráneas que referencian a las tablas clientes y productos respectivamente. Estas relaciones permiten que las instalaciones estén directamente asociadas a clientes y productos.
-- La cláusula ON DELETE CASCADE asegura que si un cliente o producto es eliminado de sus respectivas tablas, también se eliminarán las instalaciones asociadas.
 */
CREATE TABLE instalaciones (
  id SERIAL PRIMARY KEY,
  cliente_id BIGINT NOT NULL REFERENCES clientes (id) ON DELETE CASCADE,
  producto_id BIGINT NOT NULL REFERENCES productos (id) ON DELETE CASCADE,
  fecha_instalacion DATE NOT NULL,
  descripcion TEXT NOT NULL,
  costo_instalacion NUMERIC(10, 2) NOT NULL,
  estado TEXT NOT NULL
);


select * from instalaciones;

-- Insertar datos en la tabla clientes
INSERT INTO clientes (nombre, direccion, telefono) VALUES
('Juan Pérez', 'Calle Falsa 123, Ciudad', '555-1234'),
('María López', 'Avenida Siempre Viva 742, Ciudad', '555-5678'),
('Carlos Sánchez', 'Boulevard de la Esperanza 456, Ciudad', '555-8765'),
('Laura García', 'Plaza Mayor 1, Ciudad', '555-4321');

-- Insertar datos en la tabla productos
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Producto A', 'Descripción del Producto A', 10.99, 100),
('Producto B', 'Descripción del Producto B', 15.50, 200),
('Producto C', 'Descripción del Producto C', 8.75, 150),
('Producto D', 'Descripción del Producto D', 22.00, 50);

-- Insertar datos en la tabla instalaciones
INSERT INTO instalaciones (cliente_id, producto_id, fecha_instalacion, costo_instalacion, estado) VALUES
(1, 1, '2024-01-15', 50.00, 'Completado'),
(1, 2, '2024-02-20', 75.00, 'Pendiente'),
(2, 1, '2024-01-30', 45.00, 'Completado'),
(3, 3, '2024-03-10', 30.00, 'Completado'),
(4, 4, '2024-04-05', 100.00, 'Pendiente');

