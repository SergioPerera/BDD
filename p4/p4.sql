SET ECHO ON;
SET LINESIZE 200;
SET PAGESIZE 200;

-- 1. Listar todos los registros de la tabla DEPARTAMENTO. Nombra explícitamente todos los
-- campos detrás del SELECT.
REM 1;
SELECT CD, D
FROM DEPARTAMENTO;
-- 2. Listar todos los registros de la tabla AREA. Utiliza * detrás del SELECT. 
REM 2;
SELECT *
FROM AREA;
-- 3. Listar todos los DNI de los profesores.
REM 3;
SELECT  DNI
FROM PROFESOR;
-- 4. Listar todas las t-uplas de la tabla PROFESOR.
REM 4;
SELECT *
FROM PROFESOR;
-- 5. Listar todas las t-uplas de la tabla PROFESOR proyectando los atributos en el siguiente
-- orden: P, DNI, CAT, CAR.
REM 5;
SELECT P, DNI, CAT, CAR
FROM PROFESOR;
-- 6. Idem que la anterior pero ahora pon un alias explicativo para cada uno de los atributos.
REM 6;
SELECT P AS PROFESOR, DNI AS DNI, CAT AS CATEGORIA, CAR AS CODIGO_AREA
FROM PROFESOR;
-- 7. Listar todas las t-uplas de la tabla ASIGNATURA.
REM 7;
SELECT *
FROM ASIGNATURA;
-- 8. Listar todas las t-uplas de la tabla ASIGNATURA asociadas a la titulación GII.
REM 8;
SELECT * FROM ASIGNATURA
WHERE T = 'GII';
-- 9. Listar los DNI de los profesores del área con código 7.
REM 9;
SELECT DNI
FROM PROFESOR
WHERE CAR = 7;
-- 10. Listar, eliminando duplicados, los nombres de los profesores del área con código 7.
REM 10;
SELECT DISTINCT P
FROM PROFESOR
WHERE CAR = 7;
-- 11. Listar los nombres de las asignaturas que tengan un código mayor o igual que 7.
REM 11;
SELECT A
FROM ASIGNATURA
WHERE CAS >= 7; 
-- 12. Listar los nombres de las asignaturas que tengan un código mayor que 7.
REM 12;
SELECT A
FROM ASIGNATURA
WHERE CAS > 7;
-- 13. Listar el código de la asignatura con nombre ‘ALMACENES DE DATOS’.
REM 13;
SELECT CAS
FROM ASIGNATURA
WHERE A = 'ALMACENES DE DATOS';
-- 14. Listar los nombres de las asignaturas que tengan un código distinto de 8.
REM 14;
SELECT A
FROM ASIGNATURA
WHERE CAS <> 8;
-- 15. Listar los nombres de las asignaturas que tengan un código distinto de 8 y 11.
REM 15;
SELECT A
FROM ASIGNATURA
WHERE CAS NOT IN (8, 11);
-- O
SELECT A
FROM ASIGNATURA
WHERE CAS <> 8 AND CAS <> 11;
-- 16. Listar los códigos de las asignaturas impartidas por el profesor con DNI 3333.
REM 16;
SELECT CAS
FROM ASIGNATURA NATURAL JOIN PROFESOR
WHERE DNI = 3333;
-- 17. Listar el código del departamento de ‘ASTROFÍSICA’.
REM 17;
SELECT CD
FROM DEPARTAMENTO
WHERE D = 'ASTROFISICA'
-- 18. Listar los DNI de los profesores que han sido asignados a asignaturas el día ‘01-09-09’.
REM 18;
SELECT DNI
FROM PLAN_DOCENTE
WHERE FI = '01-SEP-09';
-- 19. Listar los DNI de los profesores que han sido asignados a asignaturas con anterioridad al
-- ’01-01-09’.
REM 19;
SELECT DNI
FROM PLAN_DOCENTE
WHERE FI < '01-JAN-09';
-- 20. Listar los nombres de las asignaturas adscritas a las áreas 3, 5 y 8.
REM 20;
SELECT A
FROM ASIGNATURA
WHERE CAR IN (3, 5, 8);
-- 21. Listar los nombres de las asignaturas que no están adscritas a las áreas 3, 5 y 8.
REM 21;
SELECT A
FROM ASIGNATURA
WHERE CAR NOT IN (3, 5, 8);
-- 22. Listar los nombres de los profesores cuyo DNI está comprendido entre 3000 y 7000
REM 22;
SELECT P
FROM PROFESOR 
WHERE DNI BETWEEN 3000 AND 7000;
-- 23. Listar los nombres de los profesores cuyo DNI no está comprendido entre 3000 y 7000.
REM 23;
SELECT P
FROM PROFESOR 
WHERE DNI NOT BETWEEN 3000 AND 7000;
-- 24. Listar los códigos de las asignaturas asignadas actualmente al profesor con DNI 1111.
REM 24;
SELECT CAS
FROM PLAN_DOCENTE
WHERE DNI = 1111 AND FF IS NULL;
-- 25. Obtener para cada asignatura el número total de créditos que tiene.
REM 25;
SELECT CAS, CT + CP + CL AS TOTAL_CREDITOS
FROM ASIGNATURA;


