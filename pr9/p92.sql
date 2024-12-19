spool p92_clean.lst
SET ECHO ON;
-- 3. Abrir una nueva sesión unix (sesión2) ¡sin cerrar la original (sesión1)!. Ejecutar de nuevo el
-- SQL*Plus para conectarte a tu base de datos como el usuario alumno con pasword xxxxx.
-- (¡No olvides hacer un nuevo spool!)
SET LINESIZE 200;
SET PAGESIZE 200;
-- 4. Listar todas las t-uplas de la tabla DEPARTAMENTO.
REM 4;
SELECT *
FROM DEPARTAMENTO;
-- 5. Listar todas las t-uplas de la tabla PROFESOR.
REM 5;
SELECT *
FROM PROFESOR;
-- 6. Insertar la t-upla (5, ‘ECONOMÍA’) en la tabla DEPARTAMENTO.
REM 6;
INSERT INTO DEPARTAMENTO (CD, D)
VALUES (5, 'ECONOMÍA');
-- 7. Modificar el nombre del departamento con código 5 al valor ‘ECONOMÍA APLICADA’.
REM 7;
UPDATE DEPARTAMENTO
SET D = 'ECONOMÍA APLICADA'
WHERE CD = 5;
-- 8. Modificar en la tabla TITULACION la t-upla correspondiente a la titulación ‘GII’, poniendo
-- como valor de facultad ‘ESIT1’.
REM 8;
UPDATE TITULACION
SET FAC = 'ESIT1'
WHERE T = 'GII';
-- 9. Eliminar en la tabla TITULACION la t-upla correspondiente a la titulación ‘GII’.
REM 9;
DELETE FROM TITULACION
WHERE T = 'GII';
-- 10. Deshacer los cambios.
REM 10;
ROLLBACK;
-- 11. Crear una vista, llamada ‘VISTA3’, sobre la tabla ‘ASIGNATURA’, con los atributos A y
-- CAR.
REM 11;
CREATE VIEW VISTA3 AS
SELECT A, CAR
FROM ASIGNATURA;
-- 12. Eliminar la tabla ASIGNATURA.
REM 12;
DROP TABLE ASIGNATURA;
-- 13. Listar las t-uplas de la tabla AREA.
REM 13;
SELECT *
FROM AREA;
-- 14. Borrar en la tabla AREA la t-upla asociada al departamento con código 2.
REM 14;
DELETE FROM AREA
WHERE CD = 2;
-- 15. Borrar en la tabla AREA la t-upla asociada al departamento con código 3.
REM 15;
DELETE FROM AREA
WHERE CD = 3;
-- 16. Insertar la t-upla (5, ‘ECONOMÍA APLICADA’) en la tabla DEPARTAMENTO.
REM  16;
INSERT INTO DEPARTAMENTO (CD, D)
VALUES (5, 'ECONOMÍA APLICADA');
-- 17. Borrar las asignaturas adscritas al área con código 1.
REM 17;
DELETE FROM ASIGNATURA
WHERE CAR = 1;
-- 18. Eliminar en la tabla TITULACION la tupla correspondiente a la titulación ‘MII’.
REM 18;
DELETE FROM TITULACION
WHERE T = 'MII';
-- 19. Hacer permanentes los cambios. Cerrar la sesión2.
REM 19;
COMMIT;
spool off;
exit;
