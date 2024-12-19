SET ECHO ON;
-- 17. Eliminar de la tabla ‘PLAN_DOCENTE’ todas las t-uplas correspondientes al profesor con
-- DNI 4444.
SET LINESIZE 200;
SET PAGESIZE 200;
SPOOL p7_clean.lst APPEND
REM 17;
DELETE FROM PLAN_DOCENTE
WHERE DNI = 4444;
-- 18. Listar las t-uplas de la tabla ‘PLAN_DOCENTE’ correspondientes al profesor con DNI
-- 4444.
REM 18;
SELECT *
FROM PLAN_DOCENTE
WHERE DNI = 4444;
-- 19. Establecer un punto de control con el nombre ‘P1’.
REM 19;
SAVEPOINT P1;
-- 20. Eliminar de la tabla ‘PLAN_DOCENTE’ todas las t-uplas correspondientes al profesor con
-- DNI 1010.
REM 20;
DELETE FROM PLAN_DOCENTE
WHERE DNI = 1010;
-- 21. Establecer un punto de control con el nombre ‘P2’.
REM 21;
SAVEPOINT P2;
-- 22. Eliminar de la tabla ‘PLAN_DOCENTE’ todas las t-uplas correspondientes al profesor con
-- DNI 2222.
REM 22;
DELETE FROM PLAN_DOCENTE
WHERE DNI = 2222;
-- 23. Listar las t-uplas de la tabla ‘PLAN_DOCENTE’.
REM 23;
SELECT *
FROM PLAN_DOCENTE;
-- 24. Añadir a la tabla ‘PLAN_DOCENTE’ la t-upla (1010, 9, 1.5, 0, 1.5, ‘01-SEP-09’, NULL).
-- Explica que ocurre.
REM 24;
INSERT INTO PLAN_DOCENTE
VALUES (1010, 9, 1.5, 0, 1.5, '01-SEP-09', NULL);
-- 25. Listar las t-uplas de la tabla ‘PLAN_DOCENTE’.
REM 25;
SELECT *
FROM PLAN_DOCENTE;
-- 26. Deshacer los cambios hasta el punto de control P2.
REM 26;
ROLLBACK TO SAVEPOINT P2;
-- 27. Listar las t-uplas de la tabla ‘PLAN_DOCENTE’.
REM 27;
SELECT *
FROM PLAN_DOCENTE;
-- 28. Deshacer los cambios hasta el punto de control P1.
REM 28;
ROLLBACK TO SAVEPOINT P1;
-- 29. Listar las t-uplas de la tabla ‘PLAN_DOCENTE’.
REM 29;
SELECT *
FROM PLAN_DOCENTE;
-- 30. Deshacer los cambios hasta el inicio de la transacción.
REM  30;
ROLLBACK;
-- 31. Listar las t-uplas de la tabla ‘PLAN_DOCENTE’.
REM 31;
SELECT *
FROM PLAN_DOCENTE;

spool off
exit
