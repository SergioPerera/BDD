-- DEPARTAMENTO(CD, D)
-- SIGNIFICADO: El departamento con código CD se denomina con el nombre D.
-- CLAVE PRIMARIA: (CD)

-- AREA(CAR, AR, CD)
-- SIGNIFICADO: El área de conocimiento con nombre AR tiene como código CAR y pertenece
-- al departamento CD.
-- CLAVE PRIMARIA: (CAR)
-- CLAVES AJENAS: (CD)

-- PROFESOR(DNI, P, CAR, CAT)
-- SIGNIFICADO: El profesor con D.N.I. DNI se llama P, tiene categoría CAT y está adscrito al
-- área de conocimiento CAR del departamento CD.
-- CLAVE PRIMARIA: (DNI)
-- CLAVES AJENAS: (CAR)

-- ASIGNATURA (CAS, A, T, CUR, CAR, CT, CP, CL)
-- SIGNIFICADO: La asignatura con código CAS tiene por nombre A, se imparte en el curso
-- CUR de la titulación T, pertenece al área de conocimiento CAR y tiene CT/CP/CL créditos
-- teóricos/prácticos/laboratorios.
-- CLAVE PRIMARIA: (CAS)
-- CLAVES AJENAS: (CAR)

-- PLAN_DOCENTE (DNI, CAS, CTA, CPA, CLA, FI, FF)
-- SIGNIFICADO: Al profesor con D.N.I. DNI tiene asignados, desde la fecha FI hasta la fecha
-- FF, en la asignatura CAS, CTA/CPA/CLA créditos teóricos/prácticos/laboratorios. Si el
-- profesor está impartiendo actualmente la asignatura aparece en fecha de finalización un NULL.
-- CLAVE PRIMARIA: (DNI, CAS, FI)
-- CLAVES AJENAS: (CAS), (DNI)

-- 1. Listar todos los registros de la tabla DEPARTAMENTO. Nombra explícitamente todos los
-- campos detrás del SELECT.
SELECT CD, D
FROM DEPARTAMENTO;
-- 2. Listar todos los registros de la tabla AREA. Utiliza * detrás del SELECT. 
SELECT *
FROM AREA;
-- 3. Listar todos los DNI de los profesores.
SELECT  DNI
FROM PROFESOR;
-- 4. Listar todas las t-uplas de la tabla PROFESOR.
SELECT *
FROM PROFESOR;
-- 5. Listar todas las t-uplas de la tabla PROFESOR proyectando los atributos en el siguiente
-- orden: P, DNI, CAT, CAR.
SELECT P, DNI, CAT, CAR
FROM PROFESOR;
-- 6. Idem que la anterior pero ahora pon un alias explicativo para cada uno de los atributos.
SELECT P AS PROFESOR, DNI AS DNI, CAT AS CATEGORIA, CAR AS CODIGO_AREA
FROM PROFESOR;
-- 7. Listar todas las t-uplas de la tabla ASIGNATURA.
SELECT *
FROM ASIGNATURA;
-- 8. Listar todas las t-uplas de la tabla ASIGNATURA asociadas a la titulación GII.
SELECT * FROM ASIGNATURA
WHERE T = 'GII';
-- 9. Listar los DNI de los profesores del área con código 7.
SELECT DNI
FROM PROFESOR
WHERE CAR = 7;
-- 10. Listar, eliminando duplicados, los nombres de los profesores del área con código 7.
SELECT DISTINCT P
FROM PROFESOR
WHERE CAR = 7;
-- 11. Listar los nombres de las asignaturas que tengan un código mayor o igual que 7.
SELECT A
FROM ASIGNATURA
WHERE CAS >= 7; 
-- 12. Listar los nombres de las asignaturas que tengan un código mayor que 7.
SELECT A
FROM ASIGNATURA
WHERE CAS > 7;
-- 13. Listar el código de la asignatura con nombre ‘ALMACENES DE DATOS’.
SELECT CAS
FROM ASIGNATURA
WHERE A = 'ALMACENES DE DATOS';
-- 14. Listar los nombres de las asignaturas que tengan un código distinto de 8.
SELECT A
FROM ASIGNATURA
WHERE CAS <> 8;
-- 15. Listar los nombres de las asignaturas que tengan un código distinto de 8 y 11.
SELECT A
FROM ASIGNATURA
WHERE CAS NOT IN (8, 11);
-- O
SELECT A
FROM ASIGNATURA
WHERE CAS <> 8 AND CAS <> 11;
-- 16. Listar los códigos de las asignaturas impartidas por el profesor con DNI 3333.
SELECT CAS
FROM ASIGNATURA NATURAL JOIN PROFESOR
WHERE DNI = 3333;
-- 17. Listar el código del departamento de ‘ASTROFÍSICA’.
SELECT CD
FROM DEPARTAMENTO
WHERE D = 'ASTROFISICA'
-- 18. Listar los DNI de los profesores que han sido asignados a asignaturas el día ‘01-09-09’.
SELECT DNI
FROM PLAN_DOCENTE
WHERE FI = '01-SEP-09';
-- 19. Listar los DNI de los profesores que han sido asignados a asignaturas con anterioridad al
-- ’01-01-09’.
SELECT DNI
FROM PLAN_DOCENTE
WHERE FI < '01-JAN-09';
-- 20. Listar los nombres de las asignaturas adscritas a las áreas 3, 5 y 8.
SELECT A
FROM ASIGNATURA
WHERE CAR IN (3, 5, 8);
-- 21. Listar los nombres de las asignaturas que no están adscritas a las áreas 3, 5 y 8.
SELECT A
FROM ASIGNATURA
WHERE CAR NOT IN (3, 5, 8);
-- 22. Listar los nombres de los profesores cuyo DNI está comprendido entre 3000 y 7000
SELECT P
FROM PROFESOR 
WHERE DNI BETWEEN 3000 AND 7000;
-- 23. Listar los nombres de los profesores cuyo DNI no está comprendido entre 3000 y 7000.
SELECT P
FROM PROFESOR 
WHERE DNI NOT BETWEEN 3000 AND 7000;
-- 24. Listar los códigos de las asignaturas asignadas actualmente al profesor con DNI 1111.
SELECT CAS
FROM PLAN_DOCENTE
WHERE DNI = 1111 AND FF IS NULL;
-- 25. Obtener para cada asignatura el número total de créditos que tiene.
SELECT CAS, CT + CP + CL AS TOTAL_CREDITOS
FROM ASIGNATURA;
