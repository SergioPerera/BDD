spool p8_clean.lst
SET ECHO ON;
SET LINESIZE 200;
SET PAGESIZE 200;
-- 1. Crear una tabla llamada TITULACION con los atributos T (nombre de titulación) y FAC
-- (nombre de facultad). La clave primaria es T. Especifica los tipos de datos que creas
-- convenientes y razona tu elección.
REM 1;
CREATE TABLE TITULACION (T CHAR(4) PRIMARY KEY, FAC VARCHAR2(60));
-- 2. Insertar, mediante una única instrucción, en la tabla TITULACION, los nombres de las
-- TITULACION obtenidos a partir de la tabla ASIGNATURA.
REM 2;
INSERT INTO TITULACION (T)
SELECT DISTINCT T
FROM ASIGNATURA;
-- 3. Listar todos los registros de la tabla TITULACION.
REM 3;
SELECT *
FROM TITULACION;
-- 4. Rellenar convenientemente el campo FAC de la tabla TITULACION.
-- Rellenamos el campo FAC con 'ESIT' para todas las titulaciones
REM 4;
UPDATE TITULACION
SET FAC = 'ESIT';
-- 5. Crear un sinónimo denominado TIT para la tabla TITULACION.
REM 5;
CREATE SYNONYM TIT FOR TITULACION;
-- 6. Listar todos los registros de TIT.
REM 6;
SELECT *
FROM TIT;
-- 7. Añadir una condición de integridad referencial entre el atributo T de la tabla
-- ASIGNATURA y el atributo T de la tabla TITULACION con borrado en cáscada.
REM 7;
ALTER TABLE ASIGNATURA
ADD CONSTRAINT fk_asignatura_titulacion FOREIGN KEY (T) REFERENCES TITULACION (T) ON DELETE CASCADE;
-- 8. Incrementar en dos caracteres la longitud del campo T en la tabla TITULACION.
REM 8;
ALTER TABLE TITULACION
MODIFY T CHAR(6);
-- 9. Crear una vista, llamada ‘VISTA1’, sobre la tabla ASIGNATURA, con los campos (CAS,
-- A, T, CUR, CAR).
REM 9;
CREATE VIEW VISTA1 AS
SELECT CAS,
  A,
  T,
  CUR,
  CAR
FROM ASIGNATURA;
-- 10. Listar todas las t-uplas de la vista ‘VISTA1’.
REM 10;
SELECT *
FROM VISTA1;
-- 11. Insertar la t-upla (13, ‘ESTADISTICA’, GII, 3, 7) en VISTA1.
REM 11;
INSERT INTO VISTA1 (CAS, A, T, CUR, CAR)
VALUES (13, 'ESTADISTICA', 'GII', 3, 7);
-- 12. Listar todas las t-uplas de la vista ‘VISTA1’.
REM 12;
SELECT *
FROM VISTA1;
-- 13. Listar todas las t-uplas de la tabla ASIGNATURA.
REM 13;
SELECT *
FROM ASIGNATURA;
-- 14. Modificar el campo CAR en ‘VISTA1’ de la t-upla con CAS 13. El nuevo valor es 6.
REM 14;
UPDATE VISTA1
SET CAR = 6
WHERE CAS = 13;
-- 15. Listar todas las t-uplas de la vista ‘VISTA1’.
REM 15;
SELECT *
FROM VISTA1;
-- 16. ¿Qué conclusiones sacas sobre las actualizaciones de ‘VISTA1’?
-- 17. Crear una vista, llamada ‘VISTA2’, sobre la tabla ’PLAN_DOCENTE’ y la vista
-- ‘VISTA1’ que contenga los datos (DNI, A, T, CUR, CAR) relativos a las ASIGNATURA
-- impartidas por un profesor especificado por su DNI.
REM 17;
CREATE VIEW VISTA2 AS
SELECT PD.DNI,
  V1.A,
  V1.T,
  V1.CUR,
  V1.CAR
FROM PLAN_DOCENTE PD
  JOIN VISTA1 V1 ON PD.CAs = V1.CAS
WHERE PD.DNI = '1010';
-- 18. Listar todas las t-uplas de la vista ‘VISTA2’.
REM 18;
SELECT *
FROM VISTA2;
-- 19. Modifica el campo A de alguna t-upla específica de ‘VISTA2’. Interpreta el resultado.
REM 19;
UPDATE VISTA2
SET A = 'MODIFICADO'
WHERE A = 'ESTADISTICA';
-- 20. Obtener el esquema de la vista ‘VISTA2’.
REM 20;
SELECT COLUMN_NAME,
  DATA_TYPE
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'VISTA2';
-- 21. Eliminar la vista ‘VISTA1’.
REM 21;
DROP VIEW VISTA1;
-- 22. Listar todas las t-uplas de la vista ‘VISTA2’.
REM 22;
SELECT *
FROM VISTA2;
-- 23. Deshacer los cambios. ¿Se ha recuperado la vista VISTA1? ¿A qué crees que se debe?
REM 23;
ROLLBACK;

select * from VISTA1;
-- 24. Crear un índice, llamado ‘INDICE1’, sobre el atributo P de la tabla ‘PROFESOR’.
REM 24;
CREATE INDEX INDICE1 ON PROFESOR(P);
-- Listar los DNI de los PROFESOR con nombre ‘JUAN’.
SELECT DNI
FROM PROFESOR
WHERE P = 'JUAN';
-- 25. Eliminar el índice ‘INDICE1’.
REM 25;
DROP INDEX INDICE1;
-- 26. Crear un índice, llamado ‘INDICE2’, sobre el atributo CAR de la vista ‘VISTA1’. ¿Qué
-- interpretas?
REM 26;
CREATE INDEX INDICE2 ON VISTA1(CAR);
spool off
