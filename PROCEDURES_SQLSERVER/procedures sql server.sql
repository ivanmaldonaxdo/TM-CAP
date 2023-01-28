create procedure sp_insert_usuario(

@p_NOMBRE varchar(20),
@p_APELLIDOS varchar(40),
@p_FECHA_NAC date,
@p_EMAIL varchar(30),
@p_CLAVE varchar(15),
@p_RUT varchar(12),
@p_ID_ROL int,
@p_DIRECCION varchar(70),
@p_TELEFONO int,
@p_ESTADO varchar(15)
)
as
begin

      INSERT INTO USUARIO (nombre,apellidos,fecha_nac,email,clave,rut,id_rol,direccion,telefono,estado)VALUES (
 @p_NOMBRE
,@p_APELLIDOS
,@p_FECHA_NAC
,@p_EMAIL
,@p_CLAVE
,@p_RUT
,@p_ID_ROL
,@p_DIRECCION
,@p_TELEFONO
,@p_ESTADO);


end
go
<<<<<<< HEAD


create procedure sp_update_usuario(
@p_ID_USUARIO int,
@p_NOMBRE varchar(20),
@p_APELLIDOS varchar(40),
@p_FECHA_NAC date,
@p_EMAIL varchar(30),
@p_CLAVE varchar(15),
@p_RUT varchar(12),
@p_ID_ROL int,
@p_DIRECCION varchar(70),
@p_TELEFONO int,
@p_ESTADO varchar(15)
)
as
begin

      update usuario set

NOMBRE= @p_NOMBRE
, APELLIDOS=@p_APELLIDOS
,FECHA_NAC=@p_FECHA_NAC
,EMAIL=@p_EMAIL
,CLAVE=@p_CLAVE
,RUT=@p_RUT
,ID_ROL=@p_ID_ROL
,DIRECCION=@p_DIRECCION
,TELEFONO=@p_TELEFONO
,ESTADO=@p_ESTADO
WHERE ID_USUARIO=@p_ID_USUARIO


end
go



create procedure sp_select_usuario
as
begin

select * from usuario;
end
go


create procedure sp_select_compra
as
begin

select * from compra;
end
go

-------------


create procedure sp_select_rol
as
begin

select * from rol;
end
go


create procedure sp_select_categoria
as
begin

select * from categoria;
end
go




create procedure sp_insert_compra(
@fecha_compra date,
@id_usuario int,
@tipo_comprobante varchar(20),
@serie_comprobante varchar(7),
@num_comprobante varchar(10),
@impuesto decimal(11,2),
@total int,
@estado varchar(20)
)
as
begin

      INSERT INTO COMPRA (fecha_compra,id_usuario,tipo_comprobante,serie_comprobante,num_comprobante,impuesto,total,estado)VALUES (
@fecha_compra,
@id_usuario,
@tipo_comprobante,
@serie_comprobante,
@num_comprobante,
@impuesto,
@total,
@estado);


end
go

--

create procedure sp_update_compra(
@id_compra int,
@fecha_compra date,
@id_usuario int,
@tipo_comprobante varchar(20),
@serie_comprobante varchar(7),
@num_comprobante varchar(10),
@impuesto decimal(11,2),
@total int,
@estado varchar(20)
)
as
begin

      update compra set

fecha_compra= @fecha_compra
, id_usuario=@id_usuario
,tipo_comprobante=@tipo_comprobante
,serie_comprobante=@serie_comprobante
,num_comprobante=@num_comprobante
,impuesto=@impuesto
,total=@total
,estado=@estado

WHERE id_compra=@id_compra


end
go

--PRODUCTO
--insert
CREATE PROCEDURE sp_insert_producto (
  @P_NOMBRE                   VARCHAR(256),
  @P_DESCRIPCION              VARCHAR(256),
  @P_PRECIO                   INTEGER,
  @P_ID_CATEGORIA             INTEGER,
  @P_CODIGO                   VARCHAR(50),
  @P_STOCK                    INTEGER,
  @P_ESTADO                   bit,
  @P_IMAGEN                   image
)
AS
BEGIN
  INSERT INTO PRODUCTO (
    NOMBRE,
    DESCRIPCION,
    PRECIO,
    ID_CATEGORIA,
    CODIGO,
    STOCK,
    ESTADO,
    IMAGEN
  )
  VALUES (
    @P_NOMBRE,
    @P_DESCRIPCION,
    @P_PRECIO,
    @P_ID_CATEGORIA,
    @P_CODIGO,
    @P_STOCK,
    @P_ESTADO,
    @P_IMAGEN
  );
END
GO

--update
CREATE PROCEDURE sp_update_producto(
  @P_ID_PROD             	  INTEGER,
  @P_NOMBRE                   VARCHAR(256),
  @P_DESCRIPCION              VARCHAR(256),
  @P_PRECIO                   INTEGER,
  @P_ID_CATEGORIA             INTEGER,
  @P_CODIGO                   VARCHAR(50),
  @P_STOCK                    INTEGER,
  @P_ESTADO                   bit,
  @P_IMAGEN                   image
)
AS
BEGIN
  UPDATE PRODUCTO SET
    NOMBRE = @P_NOMBRE,
    DESCRIPCION = @P_DESCRIPCION,
    PRECIO = @P_PRECIO,
    ID_CATEGORIA = @P_ID_CATEGORIA,
    CODIGO = @P_CODIGO,
    STOCK = @P_STOCK,
    ESTADO = @P_ESTADO,
    IMAGEN = @P_IMAGEN
  WHERE ID_PRODUCTO = @P_ID_PROD;
END
GO

---SELECT PRODUCTO
CREATE PROCEDURE sp_select_producto
AS
BEGIN
	SELECT * FROM PRODUCTO;
END
GO


--DETALLE compra

--insert
CREATE PROCEDURE sp_insert_detaCompra (
  @P_CANTIDAD	      INT,
  @P_PRECIO	        INT,
  @P_ID_COMPRA	    INT,
  @P_ID_PRODUCTO	  INT,
  @P_DESCUENTO	    INT
)
AS
BEGIN
	INSERT INTO DETALLE_COMPRA (CANTIDAD,PRECIO,ID_COMPRA,ID_PRODUCTO,DESCUENTO)
  VALUES(
		@P_CANTIDAD,
		@P_PRECIO,
		@P_ID_COMPRA,
		@P_ID_PRODUCTO,
		@P_DESCUENTO
	);
END
GO

--update
CREATE PROCEDURE sp_update_detaCompra (
  @P_ID_DETALLE		INT,
  @P_CANTIDAD		  INT,
  @P_PRECIO			  INT,
  @P_ID_COMPRA		INT,
  @P_ID_PRODUCTO	INT,
  @P_DESCUENTO		INT
)
AS
BEGIN
	UPDATE DETALLE_COMPRA SET
    CANTIDAD = @P_CANTIDAD,
    PRECIO = @P_PRECIO,
    ID_COMPRA = @P_ID_COMPRA,
    ID_PRODUCTO = @P_ID_PRODUCTO,
    DESCUENTO = @P_DESCUENTO
  WHERE ID_DETALLE = @P_ID_DETALLE;
END
GO
--select
CREATE PROCEDURE sp_select_detaCompra
AS
BEGIN
	SELECT * FROM DETALLE_COMPRA;
END
GO
--INSERT SOLICITUD
CREATE PROCEDURE sp_insert_solicitud (
  @P_MENSAJE VARCHAR(150),
  @P_TELEFONO INT,
  @P_MAIL VARCHAR(25),
  @P_FECHA DATE
)
AS
BEGIN
	INSERT INTO SOLICITUD (MENSAJE,TELEFONO,MAIL,FECHA) VALUES(
    @P_MENSAJE,
    @P_TELEFONO,
    @P_MAIL,
    @P_FECHA
    );
END
GO

-- select solicitud
CREATE PROCEDURE sp_select_solicitud
AS
BEGIN
	SELECT * FROM SOLICITUD;
END
GO
