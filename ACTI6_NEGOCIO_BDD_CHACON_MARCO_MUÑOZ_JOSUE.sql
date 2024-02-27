-- CREANDO BASE DE DATOS 
CREATE DATABASE NEGOCIO_MARCO_CHACON_MUNOZ_JOSUE
-- CREANDO MI TABLA <Clientes>
CREATE TABLE
    Clientes (
        ID_Cliente INT PRIMARY KEY, -- Llave primaria de la tabla Clientes
        Nombre NVARCHAR (50),
        Direccion NVARCHAR (255),
        Telefono NVARCHAR (10),
        CONSTRAINT chk_telefono_cliente CHECK (LEN (Telefono) <= 20), -- Restricción: longitud máxima del teléfono es 20 caracteres
        CONSTRAINT chk_nombre_cliente CHECK (LEN (Nombre) <= 50) -- Restricción: longitud máxima del nombre es 50 caracteres
    );

-- CREANDO MI TABLA <Facturas>
CREATE TABLE
    Facturas (
        ID_Factura INT PRIMARY KEY, -- Llave primaria de la tabla Facturas
        Fecha DATE,
        ID_Cliente INT, -- Clave foránea referenciando la tabla Clientes
        FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente) -- Relación: Facturas(ID_Cliente) -> Clientes(ID_Cliente)
    );

-- CREANDO MI TABLA <Ventas>
CREATE TABLE
    Ventas (
        ID_Venta INT PRIMARY KEY, -- Llave primaria de la tabla Ventas
        ID_Factura INT, -- Clave foránea referenciando la tabla Facturas
        ID_Producto INT, -- Clave foránea referenciando la tabla Productos
        Cantidad INT,
        FOREIGN KEY (ID_Factura) REFERENCES Facturas (ID_Factura), -- Relación: Ventas(ID_Factura) -> Facturas(ID_Factura)
        FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto) -- Relación: Ventas(ID_Producto) -> Productos(ID_Producto)
    );

-- CREANDO MI TABLA <Proveedores>
CREATE TABLE
    Proveedores (
        ID_Proveedor INT PRIMARY KEY, -- Llave primaria de la tabla Proveedores
        Nombre NVARCHAR (50),
        Direccion NVARCHAR (255),
        Telefono NVARCHAR (10),
        CONSTRAINT chk_telefono_proveedores CHECK (LEN (Telefono) <= 20), -- Restricción: longitud máxima del teléfono es 20 caracteres
        CONSTRAINT chk_nombre_proveedores CHECK (LEN (Nombre) <= 50) -- Restricción: longitud máxima del nombre es 50 caracteres
    );

-- CREANDO MI TABLA <Productos>
CREATE TABLE
    Productos (
        ID_Producto INT PRIMARY KEY, -- Llave primaria de la tabla Productos
        Descripcion NVARCHAR (255),
        Precio DECIMAL(10, 2), --total de digitos 10 y total de decimales 2, (redondeo de 2 digitos decimales)
        ID_Categoria INT, -- Clave foránea referenciando la tabla Categorias
        ID_Proveedor INT, -- Clave foránea referenciando la tabla Proveedores
        FOREIGN KEY (ID_Categoria) REFERENCES Categorias (ID_Categoria), -- Relación: Productos(ID_Categoria) -> Categorias(ID_Categoria)
        FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores (ID_Proveedor) -- Relación: Productos(ID_Proveedor) -> Proveedores(ID_Proveedor)
    );

-- CREANDO MI TABLA <Categorias>
CREATE TABLE
    Categorias (
        ID_Categoria INT PRIMARY KEY, -- Llave primaria de la tabla Categorias
        Descripcion NVARCHAR (100),
        CONSTRAINT chk_desc_cat CHECK (LEN (Descripcion) <= 100) -- Restricción: longitud máxima de la descripción es 100 caracteres
    );

--REGISTROS
-- Insertando datos en la tabla Proveedores
INSERT INTO
    Proveedores (ID_Proveedor, Nombre, Direccion, Telefono)
VALUES
    (
        1,
        'ElectroTech',
        'Av. Amazonas y Naciones Unidas',
        '0991234567'
    ),
    (
        2,
        'MobileCenter',
        'Av. 6 de Diciembre y Patria',
        '0987654321'
    ),
    (
        3,
        'GadgetStore',
        'Calle El Inca y Juan Montalvo',
        '0976543210'
    ),
    (
        4,
        'ElectroPlus',
        'Av. Naciones Unidas y Orellana',
        '0965432109'
    ),
    (
        5,
        'TechHouse',
        'Av. 10 de Agosto y Colón',
        '0954321098'
    );

-- Insertando datos en la tabla Productos
INSERT INTO
    Productos (
        ID_Producto,
        Descripcion,
        Precio,
        ID_Categoria,
        ID_Proveedor
    )
VALUES
    (
        1,
        'Televisor LED 55" 4K UHD Smart TV',
        799.99,
        1,
        1
    ),
    (
        2,
        'Smartphone Samsung Galaxy S21 Ultra 5G',
        1199.99,
        2,
        2
    ),
    (3, 'Tablet Apple iPad Pro 12.9"', 1099.99, 3, 3),
    (4, 'Laptop Dell XPS 15"', 1499.99, 4, 4),
    (5, 'Cámara Nikon D850 DSLR', 2799.99, 5, 5);

-- Insertando datos en la tabla Categorias
INSERT INTO
    Categorias (ID_Categoria, Descripcion)
VALUES
    (1, 'Televisores'),
    (2, 'Smartphones'),
    (3, 'Tablets'),
    (4, 'Laptops'),
    (5, 'Cámaras');

-- Insertando datos en la tabla Clientes
INSERT INTO
    Clientes (ID_Cliente, Nombre, Direccion, Telefono)
VALUES
    (
        1,
        'Pedro Alvarado',
        'Av. de los Shyris y Eloy Alfaro',
        '0976543210'
    ),
    (
        2,
        'María Sánchez',
        'Calle El Inca y Juan Montalvo',
        '0965432109'
    ),
    (
        3,
        'Luisa Martínez',
        'Av. Naciones Unidas y Orellana',
        '0954321098'
    ),
    (
        4,
        'Javier Pérez',
        'Av. 10 de Agosto y Colón',
        '0943210987'
    ),
    (
        5,
        'Andrea Mendoza',
        'Av. 12 de Octubre y Wilson',
        '0932109876'
    );

-- Insertando datos en la tabla Facturas
INSERT INTO
    Facturas (ID_Factura, Fecha, ID_Cliente)
VALUES
    (1, '2024-02-15', 1),
    (2, '2024-02-16', 2),
    (3, '2024-02-17', 3),
    (4, '2024-02-18', 4),
    (5, '2024-02-19', 5);

-- Insertando datos en la tabla Ventas
INSERT INTO
    Ventas (ID_Venta, ID_Factura, ID_Producto, Cantidad)
VALUES
    (1, 1, 1, 1),
    (2, 2, 2, 2),
    (3, 3, 3, 1),
    (4, 4, 4, 1),
    (5, 5, 5, 1);

---consultas originales
SELECT
    *
FROM
    Categorias
SELECT
    *
FROM
    Clientes
SELECT
    *
FROM
    Facturas
SELECT
    *
FROM
    Productos
SELECT
    *
FROM
    Proveedores
SELECT
    *
FROM
    Ventas
    -- actualizaciones de datos:
    -- Actualizar números de teléfono de Pedro Alvarado y Andrea Mendoza en la tabla Clientes
UPDATE Clientes
SET
    Telefono = CASE
        WHEN Nombre = 'Pedro Alvarado' THEN '0998887777'
        WHEN Nombre = 'Andrea Mendoza' THEN '0997778888'
        ELSE Telefono
    END
WHERE
    Nombre IN ('Pedro Alvarado', 'Andrea Mendoza');

-- Actualizar la dirección de TechHouse y MobileCenter en la tabla Proveedores
UPDATE Proveedores
SET
    Direccion = CASE
        WHEN Nombre = 'TechHouse' THEN 'Av. 10 de Agosto y Juan León Mera'
        WHEN Nombre = 'MobileCenter' THEN 'Av. 6 de Diciembre y Gaspar de Villarroel'
        ELSE Direccion
    END
WHERE
    Nombre IN ('TechHouse', 'MobileCenter');

-- Actualizar la fecha de la factura del cliente Pedro Alvarado
UPDATE Facturas
SET Fecha = DATEADD(day, 7, Fecha)
WHERE ID_Cliente = (SELECT ID_Cliente FROM Clientes WHERE Nombre = 'Pedro Alvarado');

-- Consulta utilizando JOINs para mostrar los datos de los clientes con sus facturas actualizadas
SELECT C.ID_Cliente, C.Nombre AS NombreCliente, C.Direccion AS DireccionCliente, C.Telefono AS TelefonoCliente,
       F.ID_Factura, F.Fecha AS FechaFactura
FROM Facturas AS F
JOIN Clientes AS C ON F.ID_Cliente = C.ID_Cliente;

-- Eliminar un cliente que tenga un número de teléfono específico
DELETE FROM Clientes
WHERE Telefono = '0976543210'; -- Número de teléfono específico

-- Eliminar las ventas asociadas a la factura del cliente Pedro Alvarado
DELETE FROM Ventas
WHERE ID_Factura IN (SELECT ID_Factura FROM Facturas WHERE ID_Cliente = (SELECT ID_Cliente FROM Clientes WHERE Nombre = 'Pedro Alvarado'));

-- Ahora puedes eliminar la factura del cliente Pedro Alvarado
DELETE FROM Facturas
WHERE ID_Cliente = (SELECT ID_Cliente FROM Clientes WHERE Nombre = 'Pedro Alvarado');


-- Verificar si existen ventas asociadas a la factura que se va a eliminar
IF EXISTS (SELECT 1 FROM Ventas WHERE ID_Factura IN (SELECT ID_Factura FROM Facturas WHERE ID_Cliente = (SELECT ID_Cliente FROM Clientes WHERE Nombre = 'Pedro Alvarado')))
BEGIN
    -- Si existen ventas asociadas, se deben eliminar primero
    DELETE FROM Ventas WHERE ID_Factura IN (SELECT ID_Factura FROM Facturas WHERE ID_Cliente = (SELECT ID_Cliente FROM Clientes WHERE Nombre = 'Pedro Alvarado'));
END

-- Verificar si la factura es la última factura del cliente
IF NOT EXISTS (SELECT 1 FROM Facturas WHERE ID_Cliente = (SELECT ID_Cliente FROM Clientes WHERE Nombre = 'Pedro Alvarado') AND ID_Factura <> (SELECT ID_Factura FROM Facturas WHERE ID_Cliente = (SELECT ID_Cliente FROM Clientes WHERE Nombre = 'Pedro Alvarado')))
BEGIN
    -- Si es la última factura del cliente, se puede eliminar directamente
    DELETE FROM Facturas WHERE ID_Cliente = (SELECT ID_Cliente FROM Clientes WHERE Nombre = 'Pedro Alvarado');
END
ELSE
BEGIN
    -- Si no es la última factura, mostrar un mensaje de advertencia o tomar alguna otra acción adecuada
    PRINT 'La factura no puede ser eliminada porque no es la última factura del cliente.';
END


--CONSULTA DE FACTURAS

SELECT F.ID_Factura, F.Fecha, C.ID_Cliente, C.Nombre AS NombreCliente, C.Direccion AS DireccionCliente, C.Telefono AS TelefonoCliente
FROM Facturas AS F
JOIN Clientes AS C ON F.ID_Cliente = C.ID_Cliente;



-- Verificar si el cliente tiene facturas asociadas y eliminarlas
IF EXISTS (SELECT 1 FROM Facturas WHERE ID_Cliente = (SELECT ID_Cliente FROM Clientes WHERE Nombre = 'Pedro Alvarado' AND Telefono LIKE '09%' AND Nombre LIKE '% A%'))
BEGIN
    -- Si hay facturas asociadas, eliminarlas primero
    DELETE FROM Facturas WHERE ID_Cliente = (SELECT ID_Cliente FROM Clientes WHERE Nombre = 'Pedro Alvarado');
END

-- Verificar si el cliente tiene ventas asociadas a través de las facturas y eliminarlas
IF EXISTS (SELECT 1 FROM Ventas WHERE ID_Factura IN (SELECT ID_Factura FROM Facturas WHERE ID_Cliente = (SELECT ID_Cliente FROM Clientes WHERE Nombre = 'Pedro Alvarado' AND Telefono LIKE '09%' AND Nombre LIKE '% A%')))
BEGIN
    -- Si hay ventas asociadas, eliminarlas primero
    DELETE FROM Ventas WHERE ID_Factura IN (SELECT ID_Factura FROM Facturas WHERE ID_Cliente = (SELECT ID_Cliente FROM Clientes WHERE Nombre = 'Pedro Alvarado' AND Telefono LIKE '09%' AND Nombre LIKE '% A%'));
END

-- Eliminar al cliente Pedro Alvarado
DELETE FROM Clientes WHERE Nombre = 'Pedro Alvarado' AND Telefono LIKE '09%' AND Nombre LIKE '% A%';


--CONSULTAS:


-- Consulta de Productos y Categorías
SELECT P.Descripcion AS Producto, C.Descripcion AS Categoria
FROM Productos AS P
JOIN Categorias AS C ON P.ID_Categoria = C.ID_Categoria
WHERE P.Precio > 1000 AND C.Descripcion LIKE '%Smart%'
ORDER BY P.Precio ASC;


--Consulta de Proveedores y Productos
SELECT Pr.Nombre AS Proveedor, P.Descripcion AS Producto, P.Precio
FROM Proveedores AS Pr
JOIN Productos AS P ON Pr.ID_Proveedor = P.ID_Proveedor
WHERE Pr.Nombre LIKE '%Tech%' AND P.Precio < 1500
ORDER BY Pr.Nombre ASC;



--Consulta de Ventas y Clientes
SELECT V.ID_Venta, C.Nombre AS Cliente, C.Telefono, V.Cantidad
FROM Ventas AS V
JOIN Facturas AS F ON V.ID_Factura = F.ID_Factura
JOIN Clientes AS C ON F.ID_Cliente = C.ID_Cliente
WHERE V.Cantidad = 1 AND C.Telefono LIKE '09%'
ORDER BY F.Fecha ASC;


--productos - proveedores
SELECT Productos.ID_Producto, Productos.Descripcion, Productos.Precio, Proveedores.Nombre, Proveedores.Direccion, Proveedores.Telefono
FROM Productos
JOIN Proveedores ON Productos.ID_Proveedor = Proveedores.ID_Proveedor
WHERE Productos.Precio > 5 AND LEN(Productos.Descripcion) > 12 AND LEN(Proveedores.Nombre) < 10;
-- ventas -- productos

SELECT Ventas.ID_Venta, Ventas.Cantidad, Productos.Descripcion, Productos.Precio
FROM Ventas
JOIN Productos ON Ventas.ID_Producto = Productos.ID_Producto
WHERE Ventas.Cantidad > 1 AND Productos.Precio > 200 AND LEN(Productos.Descripcion) < 100;
