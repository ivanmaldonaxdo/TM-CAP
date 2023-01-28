CREATE OR REPLACE PROCEDURE sp_insert_usuario (
p_RUT in USUARIO.RUT%type
,p_DIRECCION in USUARIO.DIRECCION%type
,p_ID_ROL in USUARIO.ROL_ID_ROL%type
,p_ESTADO in USUARIO.ESTADO%type
,p_ID_USUARIO in USUARIO.ID_USUARIO%type
,p_CLAVE in USUARIO.CLAVE%type
,p_APELLIDOS in USUARIO.APELLIDOS%type
,p_FECHA_NAC in USUARIO.FECHA_NAC%type
,p_TELEFONO in USUARIO.TELEFONO%type
,p_EMAIL in USUARIO.EMAIL%type
,p_NOMBRE in USUARIO.NOMBRE%type
, v_salida               OUT                    NUMBER,
        v_mensaje              OUT                    VARCHAR2
)  IS
        e_sql_error EXCEPTION;
    BEGIN
        INSERT INTO USUARIO (
RUT
,DIRECCION
,ROL_ID_ROL
,ESTADO
,ID_USUARIO
,CLAVE
,APELLIDOS
,FECHA_NAC
,TELEFONO
,EMAIL
,NOMBRE
)VALUES (
p_RUT
,p_DIRECCION
,p_ID_ROL
,p_ESTADO
,p_ID_USUARIO
,p_CLAVE
,p_APELLIDOS
,p_FECHA_NAC
,p_TELEFONO
,p_EMAIL
,p_NOMBRE

);

        v_salida := 0;
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


 CREATE OR REPLACE PROCEDURE sp_update_usuario (
      p_RUT in USUARIO.RUT%type
,p_DIRECCION in USUARIO.DIRECCION%type
,p_ID_ROL in USUARIO.ROL_ID_ROL%type
,p_ESTADO in USUARIO.ESTADO%type
,p_ID_USUARIO in USUARIO.ID_USUARIO%type
,p_CLAVE in USUARIO.CLAVE%type
,p_APELLIDOS in USUARIO.APELLIDOS%type
,p_FECHA_NAC in USUARIO.FECHA_NAC%type
,p_TELEFONO in USUARIO.TELEFONO%type
,p_EMAIL in USUARIO.EMAIL%type
,p_NOMBRE in USUARIO.NOMBRE%type
,
        v_salida          OUT               NUMBER,
        v_mensaje         OUT               VARCHAR2
    ) IS
        e_sql_error EXCEPTION;
    BEGIN
        update USUARIO set
RUT = p_RUT
,DIRECCION = p_DIRECCION
,ROL_ID_ROL = p_ID_ROL
,ESTADO = p_ESTADO
,CLAVE = p_CLAVE
,APELLIDOS = p_APELLIDOS
,FECHA_NAC = p_FECHA_NAC
,TELEFONO = p_TELEFONO
,EMAIL = p_EMAIL
,NOMBRE = p_NOMBRE
where ID_USUARIO = p_ID_USUARIO;

        v_salida := 0;
        v_mensaje := 'Actualiacion correcta.';
        COMMIT;
    EXCEPTION
        WHEN e_sql_error THEN
            v_salida := 1;
            v_mensaje := 'Actualiacion fallida.';
        WHEN OTHERS THEN
            ROLLBACK;
            v_salida := 2;
            v_mensaje := sqlerrm;
    END;


     CREATE OR REPLACE PROCEDURE sp_delete_usuario (
    p_id_usuario IN usuario.id_usuario%TYPE,
    v_salida     OUT NUMBER,
    v_mensaje    OUT VARCHAR2
) IS
    e_sql_error EXCEPTION;
    v_id_usuario usuario.id_usuario%TYPE;
BEGIN
    SELECT
        id_usuario
    INTO v_id_usuario
    FROM
        usuario
    WHERE
        id_usuario = p_id_usuario;

    IF v_id_usuario = p_id_usuario THEN
        DELETE FROM usuario
        WHERE
            id_usuario = p_id_usuario;

        v_salida := 0;
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

    CREATE OR REPLACE PROCEDURE sp_select_usuario (
      
         cursor_1   OUT          SYS_REFCURSOR
         )
      IS
    BEGIN
    
    OPEN cursor_1 FOR   SELECT * FROM usuario;

        

    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('no se encontaron datos');
    END;