
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
