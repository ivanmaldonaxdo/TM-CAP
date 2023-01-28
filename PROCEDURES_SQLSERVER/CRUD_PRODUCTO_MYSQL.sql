--insert producto
DELIMITER $$
CREATE DEFINER=`a7eeda_tmcap`@`%` PROCEDURE `sp_insert_producto`(
  IN P_NOMBRE                   VARCHAR(256),
  IN P_DESCRIPCION              VARCHAR(256),
  IN P_PRECIO                   INTEGER,
  IN P_ID_CATEGORIA             INTEGER,
  IN P_CODIGO                   VARCHAR(50),
  IN P_STOCK                    INTEGER,
  IN P_ESTADO                   bit,
  IN P_IMAGEN                   blob
  )
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Insercion Fallida';
  END;

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
    P_NOMBRE,
    P_DESCRIPCION,
    P_PRECIO,
    P_ID_CATEGORIA,
    P_CODIGO,
    P_STOCK,
    P_ESTADO,
    P_IMAGEN
  );

  SELECT 'Insercion Correcta';
  COMMIT;
END$$
DELIMITER ;

--UPDATE PRODUCTO
DELIMITER $$
CREATE DEFINER=`a7eeda_tmcap`@`%` PROCEDURE `sp_update_producto`(
  IN P_ID_PROD             	  INTEGER,
  IN P_NOMBRE                   VARCHAR(256),
  IN P_DESCRIPCION              VARCHAR(256),
  IN P_PRECIO                   INTEGER,
  IN P_ID_CATEGORIA             INTEGER,
  IN P_CODIGO                   VARCHAR(50),
  IN P_STOCK                    INTEGER,
  IN P_ESTADO                   bit,
  IN P_IMAGEN                   blob
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    ROLLBACK;
    SELECT 'Actualizacion Fallida';
  END;
  UPDATE PRODUCTO SET
    NOMBRE = P_NOMBRE,
    DESCRIPCION = P_DESCRIPCION,
    PRECIO = P_PRECIO,
    ID_CATEGORIA = P_ID_CATEGORIA,
    CODIGO = P_CODIGO,
    STOCK = P_STOCK,
    ESTADO = P_ESTADO,
    IMAGEN = P_IMAGEN
  WHERE ID_PRODUCTO = P_ID_PROD;

  SELECT 'Actualizacion Correcta';
  COMMIT;
END$$
DELIMITER ;

--SELECT producto
DELIMITER $$
CREATE DEFINER=`a7eeda_tmcap`@`%` PROCEDURE `sp_select_producto`()
BEGIN
	SELECT * FROM PRODUCTO;
END$$
DELIMITER ;
