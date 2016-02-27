
     -- crearemos una tabla muy simple para probar el poder pl sql
 
    create table dance (id_dance integer, nombre varchar2 (40), edad integer);
    
    --PRENDEMOS EL SERVIDOR EN MODO DE DESARROLLADOR
    
    SET SERVEROUTPUT ON;
    
    --VAMOS A EMPESAR CON UN  BLOQUE PL SQL
    DECLARE
    --AQUI SE DECLARA LAS VARIABLES
    
    EDAD INTEGER;
    YEARS INTEGER;
    BEGIN
    --AQUI VA LA LOGICA DEL PROGRAMA
    
    YEARS:=21;
    EDAD:=YEARS*365;
    
    DBMS_OUTPUT.PUT_LINE(' TU EDAD EN DIAS ES ' || EDAD);
    
    END;
    /







 --CREAR UN BLOQUE PLQSL QUE GENERA 200,000 REGISTROS EN SECUENCIA ASCENDENTE EN LA TABLA DANCE
    --ESTRUCTURA FOR EN UN CICLO FOR
  
    BEGIN 
    
    FOR I IN 1..200000 LOOP
    INSERT INTO DANCE VALUES (I, 'LUIS', 21);
    END LOOP;
    END;
    /
    
    -- HACEMOS UN SELECT PARA VER QUE HIZO
    SELECT * FROM DANCE;
    
    
    --OPERACIONES BASICAS SOBRE UNA BASE DE DATOS.
    --INSERT, BUSCAR POR ID, BUSCAR  TODOS, BORRAR POR ID  = UN LENGUAJE TECNICO A ESTAS OPERACIONES SE LES LLAMA CRUD
    --SISTEMA DE PELICULAS
    
    CREATE table PELICULA (ID_PELICULA INTEGER , 
    TITULO varchar2 (120), 
    SINOPSIS varchar2(120),
    CLASIFICACION varchar2(5),
    constraint PK_ID_PELICULA primary key (ID_PELICULA)
    );
    
    DESCRIBE PELICULA;
    
    CREATE TABLE HORARIO (ID_HORARIO integer, 
    ID_HORARIO integer,
    HORARIO varchar2(8),
    constraint PK_ID_HORARIO primary key (ID_HORARIO),
    CONSTRAINT FK1_ID_PELICULA FOREIGN KEY  (ID_PELICULA) REFERENCES PELICULA (ID_PELICULA)
    ); 
    
    CREATE TABLE SALA (ID_SALA integer,
    ID_PELICULA INTEGER,
    NUM_SALA varchar2 (8),
    constraint PK_ID_SALA primary key (ID_SALA),
    constraint FK2_ID_PELICULA FOREIGN KEY  (ID_PELICULA) REFERENCES PELICULA (ID_PELICULA)
    );
    
    
    CREATE sequence SEC_PELICULA
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
    
    --------------------------10/02/2015--------------------------------
    
    create table paises ( id_pais varchar2 (4),
                     nombre varchar2 (100),
                     habitante integer,
                     idioma varchar2 (40),
                     constraint pk_id_pais primary key(id_pais)
                     ); 

insert into paises values ('mx', 'Mexico', 90000, 'español');
insert into paises values ('usa', 'Estados Unidos', 12000000, 'ingles');
insert into paises values ('jpa', 'Japon', 9000000, 'japones');
insert into paises values ('ger', 'Alemania', 1400000, 'aleman');
insert into paises values ('bra', 'Brazil', 2300000, 'portuges');

select * from paises;

    ----------------------------------------------------------------------
    
    create table paises ( id_pais varchar2 (4),
                     nombre varchar2 (100),
                     habitante integer,
                     idioma varchar2 (40),
                     constraint pk_id_pais primary key(id_pais)
                     ); 

insert into paises values ('mx', 'Mexico', 90000, 'español');
insert into paises values ('usa', 'Estados Unidos', 12000000, 'ingles');
insert into paises values ('jpa', 'Japon', 9000000, 'japones');
insert into paises values ('ger', 'Alemania', 1400000, 'aleman');
insert into paises values ('bra', 'Brazil', 2300000, 'portuges');

select * from paises;


declare
  cursor cur_paises is select * from paises;

total_habitantes integer;
begin
total_habitantes:=0;

for fila in cur_paises loop
total_habitantes:=total_habitantes+fila.habitante;
dbms_output.put_line('Nombre: '||fila.nombre||' Habitantes: ' ||fila.habitante);
end loop;
dbms_output.put_line('Habitantes de todos los paises: '||total_habitantes);

end;



create table estudiante (id_estudiante integer,
                         id_pais varchar2(4),
                         carrera varchar2(30),
                         edad integer,
                         constraint pk_id_estudiante primary key(id_estudiante),
                         constraint fk1_id_pais foreign key(id_pais) references paises(id_pais));


describe estudiante;

insert into estudiante values (1, 'mx', 'Sistemas ',20);
insert into estudiante values (2, 'usa', 'Diseño ',22);
insert into estudiante values (3, 'mx', 'Arquitectura ',20);
insert into estudiante values (4, 'mx', 'Economia ',19);
insert into estudiante values (5, 'jpa', 'Derecho ',21);
insert into estudiante values (6, 'ger', 'Salud ',20);
insert into estudiante values (7, 'bra', 'Sistemas ',23);

select *from estudiante;

-----terminar

declare
  cursor cur_estudinate is select * from estudiante;

total_habitantes integer;
begin
total_habitantes:=0;
for fila in cur_estudiante loop
total_habitantes:=total_habitantes+fila.habitante;
dbms_output.put_line('Nombre: '||fila.nombre||' Habitantes: ' ||fila.habitante||' carrera: ' ||fila.carrera);
end loop;
dbms_output.put_line('Habitantes de todos los paises: '||total_habitantes);

end;

----------------17/02/2016--------------

declare 

cursor CUR_EMPLEADOS IS SELECT * FROM empleado_ventas;
begin
FOR REC_EMP IN CUR_EMPLEADOS LOOP
dbms_output.put_LINE('NOMBRE:'||REC_EMP.nombre_cliente||'SUELDO:'||REC_EMP.SUELDO_BASE);
end LOOP;
END;
/

SELECT * FROM empleado_ventas;

SET SERVEROUTPUT ON;

declare 

cursor CUR_EMP IS SELECT * FROM empleado_ventas;
cursor CUR_SUC IS SELECT * FROM SUCURSAL;
begin
FOR EMP IN CUR_EMP LOOP
FOR SUC IN CUR_SUC LOOP
IF EMP.ID_CLIENTE=SUC.ID_CLIENTE THEN
dbms_output.put_LINE('EMPLEADO:'||EMP.nombre_cliente||'SUCURSAL'||SUC.NOMBRE);
END IF;
end LOOP;
END LOOP;
END;
/



SELECT * FROM empleado_ventas;

SET SERVEROUTPUT ON;

SELECT EMPLEADO_VENTAS.ID_CLIENTE, EMPLEADO_VENTAS.NOMBRE_CLIENTE, SUCU5RSAL.NOMBRE FROM EMPLEADO_VENTAS JOIN SUCURSAL  ON EMPLEADO_VENTAS.ID_CLIENTE=SUCURSAL.ID_CLIENTE;


-----------------------------------------27/02/2016----------------------------------

--DISPARADORES
--un obejto de base de datos que siempre se ejecuta  automatico es decir nunca se invoca manualmente y en este curso son de tipo DML(DATA MANIPULATION LANGUAJE)  INSERTAR, ACTUALIZAR SELECT, DELETE (SELECT ES DE SOLO LECTURA : JAMAS ESTA DEFINIDO EN EL DML)
--DDL DATA DESCRIPTION LANGUAJE
--Y LOS DISPARADORES DE TIPO DML SON LO SE APLICAN A LAS OPERACIONES SIGUIENTES INSERT, UPDATE, DELETE
--DISPARADORES DDL Y DML(AUTOMATIZACION Y VALIDACION = PORTABILIDAD )
--MVC
--M TIENEN CAPAS PERSISTENCIA GUARDA (DISPARADORES), TRANSACIONAL
--before generalmente esta son para vlidar
--after generalmente son para automatizar
--operaciones insert update delete
create table xxx ( id_xxx integer,
                  edad integer
                  );
                  
create or replace trigger xxx_mayor_edad before  insert on xxx for each row --Examen la logica de un cursor
begin 
if :new.edad < 18 then
raise_application_error(-20001, 'lo sineto chsmsco precoz, no registrado'); --logica personalizada de base de datos 
end if;
end;
/
           
insert into xxx values(1,20);
SELECT * FROM xxx;
                
--------------------------------------------------------------------------------------------------------------------------       
                create table nomina_xxx (id_nomina_xxx integer,
                                         login varchar2 (10), 
                                         saldo integer );
                                         
insert into nomina_xxx values (1, 'yo', 20000);  
SELECT * FROM nomina_xxx;

--crear un disparador que personalize update, de tal manera que sume el saldo anterior al nuevo saldo y asignarle un update.
create or replace trigger actualizar_saldo before update on nomina_xxx for each row 
begin
:new.saldo:=:new.saldo+:old.saldo;
end;
/
 update nomina_xxx set saldo = 500 where id_nomina_xxx=1;  
 update nomina_xxx set saldo = -500 where id_nomina_xxx=1;  
                     


    
    














