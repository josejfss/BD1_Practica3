CREATE TABLE Pais(
    id_pais INTEGER NOT NULL,
    nombre VARCHAR2(150)  NOT NULL
);

ALTER TABLE Pais ADD CONSTRAINT Pais_PK PRIMARY KEY ( id_pais );

CREATE TABLE Vendedor(
    id_vendedor INTEGER NOT NULL,
    nombre VARCHAR2(300) NOT NULL,
    id_pais INTEGER NOT NULL
);
ALTER TABLE Vendedor ADD CONSTRAINT Vendedor_PK PRIMARY KEY ( id_vendedor );
ALTER TABLE Vendedor ADD CONSTRAINT Pais_Vendedor_FK FOREIGN KEY ( id_pais )
        REFERENCES Pais ( id_pais );

CREATE TABLE Cliente(
    id_cliente INTEGER NOT NULL,
    Nombre VARCHAR2(150) NOT NULL,
    Apellido VARCHAR2(150) NOT NULL,
    Direccion VARCHAR2(250) NOT NULL,
    Telefono VARCHAR2(15) NOT NULL,
    Tarjeta VARCHAR2(50) NOT NULL,
    Edad INTEGER NOT NULL,
    Salario INTEGER NOT NULL,
    Genero VARCHAR2(2) NOT NULL,
    id_pais INTEGER NOT NULL
);
ALTER TABLE Cliente ADD CONSTRAINT Cliente_PK PRIMARY KEY ( id_cliente );
ALTER TABLE Cliente ADD CONSTRAINT Pais_Cliente_FK FOREIGN KEY ( id_pais )
        REFERENCES Pais ( id_pais );

CREATE TABLE Categoria(
    id_categoria INTEGER NOT NULL,
    nombre VARCHAR2(150) NOT NULL
);

ALTER TABLE Categoria ADD CONSTRAINT Categoria_PK PRIMARY KEY ( id_categoria );

CREATE TABLE Producto(
    id_producto INTEGER NOT NULL,
    Nombre VARCHAR2(150) NOT NULL,
    Precio NUMBER(10,2)	NOT NULL,
    id_Categoria INTEGER NOT NULL
);

ALTER TABLE Producto ADD CONSTRAINT Producto_PK PRIMARY KEY ( id_producto );
ALTER TABLE Producto ADD CONSTRAINT Categoria_Producto_FK FOREIGN KEY ( id_categoria )
        REFERENCES Categoria ( id_categoria );

CREATE TABLE Orden(
    id_orden INTEGER NOT NULL,
    linea_orden INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    fecha_orden DATE NOT NULL,
    id_producto INTEGER NOT NULL,
    id_vendor INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    PRIMARY KEY ( id_producto, linea_orden )
);
ALTER TABLE Orden ADD CONSTRAINT Producto_Orden_FK FOREIGN KEY ( id_producto )
        REFERENCES Producto ( id_producto );
ALTER TABLE Orden ADD CONSTRAINT Vendedor_Orden_FK FOREIGN KEY ( id_vendor)
        REFERENCES Vendedor ( id_vendedor );
ALTER TABLE Orden ADD CONSTRAINT Cliente_Orden_FK FOREIGN KEY ( id_cliente)
        REFERENCES Cliente ( id_cliente );
