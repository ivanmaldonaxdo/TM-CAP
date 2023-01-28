--INSERT
CREATE OR REPLACE PROCEDURE sp_insert_product(
    P_ID_PROD in producto.id_producto%type,
    P_NOMBRE IN producto.nombre%TYPE,
    p_descripcion in producto.DESCRIPCION%type,
    P_PRECIO IN PRODUCTO.PRECIO%TYPE,
    P_CATEGORIA IN PRODUCTO.CATEGORIA_ID_CATEGORIA%TYPE,
    P_CODIGO IN PRODUCTO.CODIGO%TYPE,
    P_STOCK IN PRODUCTO.STOCK%TYPE,
    P_ESTADO IN producto.estado%TYPE,
    P_IMAGEN IN producto.imagen%TYPE,
    v_salida OUT NUMBER,
    v_mensaje OUT VARCHAR2
)
is
    e_sql_error EXCEPTION;
begin
    INSERT INTO PRODUCTO VALUES(
        P_ID_PROD,
        P_NOMBRE,
        P_DESCRIPCION,
        P_PRECIO,
        P_CATEGORIA,
        P_CODIGO,
        P_STOCK,
        P_ESTADO,
        P_IMAGEN
    );
    v_mensaje := 'Insercion correcta.';
    dbms_output.put_line(v_mensaje);
    COMMIT;
EXCEPTION
  WHEN e_sql_error THEN
    v_salida := 1;
    v_mensaje := 'Insercion fallida.';
    dbms_output.put_line(v_mensaje);
  WHEN OTHERS THEN
    ROLLBACK;
    v_salida := 2;
    v_mensaje := sqlerrm;
    dbms_output.put_line(v_mensaje);
END;

--UPDATE
create or replace PROCEDURE sp_update_product(
    P_ID_PROD in producto.id_producto%type,
    P_NOMBRE IN producto.nombre%TYPE,
    p_descripcion in producto.DESCRIPCION%type,
    P_PRECIO IN PRODUCTO.PRECIO%TYPE,
    P_CATEGORIA IN PRODUCTO.CATEGORIA_ID_CATEGORIA%TYPE,
    P_CODIGO IN PRODUCTO.CODIGO%TYPE,
    P_STOCK IN PRODUCTO.STOCK%TYPE,
    P_ESTADO IN producto.estado%TYPE,
    P_IMAGEN IN producto.imagen%TYPE,
    v_salida OUT NUMBER,
    v_mensaje OUT VARCHAR2
)
is
    e_sql_error EXCEPTION;
begin
    UPDATE PRODUCTO SET
        ID_PRODUCTO=P_ID_PROD,
        NOMBRE=P_NOMBRE,
        DESCRIPCION=P_DESCRIPCION,
        PRECIO=P_PRECIO,
        CATEGORIA_ID_CATEGORIA=P_CATEGORIA,
        CODIGO=P_CODIGO,
        STOCK=P_STOCK,
        ESTADO=P_ESTADO,
        IMAGEN=P_IMAGEN
        WHERE ID_PRODUCTO=P_ID_PROD
    ;
    v_mensaje := 'Actualiacion correcta.';
    dbms_output.put_line(v_mensaje);
    COMMIT;
EXCEPTION
  WHEN e_sql_error THEN
    v_salida := 1;
    v_mensaje := 'Actualiacion fallida.';
    dbms_output.put_line(v_mensaje);
  WHEN OTHERS THEN
    ROLLBACK;
    v_salida := 2;
    v_mensaje := sqlerrm;
    dbms_output.put_line(v_mensaje);
END;
--DELETE |
create or replace PROCEDURE sp_delete_product(
    P_ID_PROD in producto.id_producto%type,
    v_salida OUT NUMBER,
    v_mensaje OUT VARCHAR2
)
is
    e_sql_error EXCEPTION;
begin
    DELETE FROM PRODUCTO
    WHERE ID_PRODUCTO=P_ID_PROD
    ;
    v_mensaje := 'Eliminado correctamente.';
    dbms_output.put_line(v_mensaje);
    COMMIT;
EXCEPTION
    WHEN e_sql_error THEN
        v_salida := 1;
        v_mensaje := 'No se pudo eliminar correctamente.';
        dbms_output.put_line(v_mensaje);
    WHEN no_data_found THEN
        v_salida := 3;
        v_mensaje := 'Esta eliminando un usuario que no existe, operacion fallida';
        dbms_output.put_line(v_mensaje);
    WHEN OTHERS THEN
        ROLLBACK;
        v_salida := 2;
        v_mensaje := sqlerrm;
        dbms_output.put_line(v_mensaje);
END;

--DELETE 2 (CON EXEPCTIONS FUNCIONANDO)
CREATE OR REPLACE PROCEDURE sp_delete_product(
    P_ID_PROD in producto.id_producto%type,
    v_salida OUT NUMBER,
    v_mensaje OUT VARCHAR2
)
is
    e_sql_error EXCEPTION;
    v_id_prod producto.id_producto%type;
begin
    select id_producto into v_id_prod FROM PRODUCTO WHERE ID_PRODUCTO=P_ID_PROD ;
    IF v_id_prod = P_ID_PROD THEN
        DELETE FROM PRODUCTO WHERE ID_PRODUCTO=P_ID_PROD;
        v_mensaje := 'Eliminado correctamente.';
        dbms_output.put_line(v_mensaje);
        COMMIT;
    END IF;

EXCEPTION
    WHEN e_sql_error THEN
        v_salida := 1;
        v_mensaje := 'No se pudo eliminar correctamente.';
        dbms_output.put_line(v_mensaje);
    WHEN no_data_found THEN
        v_salida := 3;
        v_mensaje := 'Esta eliminando un usuario que no existe, operacion fallida';
        dbms_output.put_line(v_mensaje);
    WHEN OTHERS THEN
        ROLLBACK;
        v_salida := 2;
        v_mensaje := sqlerrm;
        dbms_output.put_line(v_mensaje);
END;

--select
create or replace PROCEDURE sp_select_producto (
         cur_producto  OUT SYS_REFCURSOR
)
IS
    BEGIN
        OPEN cur_producto FOR SELECT * FROM producto;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('no se encontaron datos');
    END;
