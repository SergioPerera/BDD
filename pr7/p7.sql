spool p7_clean.lst

SET ECHO ON;
SET LINESIZE 200;
SET PAGESIZE 200;
-- 1. Listar todas las t-uplas de la tabla PROFESOR
REM 1;
SELECT *
FROM PROFESOR;
-- 2. Añadir la siguiente t-upla a la tabla PROFESOR: (4040, ‘CARMELO’, 7, TU).
REM 2;
INSERT INTO PROFESOR
VALUES (4040, 'CARMELO', 7, 'TU');
-- 3. Listar todas las t-uplas de la tabla PROFESOR.
REM 3;
SELECT *
FROM PROFESOR;
-- 4. Deshacer los cambios.
REM 4;
ROLLBACK;
-- 5. Listar todas las t-uplas de la tabla PROFESOR.
REM 5;
SELECT *
FROM PROFESOR;
-- 6. Añadir la siguiente t-upla a la tabla PROFESOR: (4040, ‘CARMELO’, 7, TU).
REM 6;
INSERT INTO PROFESOR
VALUES (4040, 'CARMELO', 7, 'TU');
-- 7. Hacer permanentes los cambios.
REM 7;
COMMIT;
-- 8. Añadir la siguiente t-upla a la tabla PROFESOR: (5050, ‘CARINA’, 9, CEU). Explica que
-- ocurre.
REM 8;
INSERT INTO PROFESOR
VALUES (5050, 'CARINA', 9, 'CEU');
-- 9. Añadir la siguiente t-upla a la tabla PROFESOR: (5050, ‘CARINA’, 8, CEU).
REM 9;
INSERT INTO PROFESOR
VALUES (5050, 'CARINA', 8, 'CEU');
-- 10. Listar todas las t-uplas de la tabla PROFESOR.
REM 10;
SELECT *
FROM PROFESOR;
