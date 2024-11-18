-- 1. Listar los nombres de asignaturas adscritas a áreas cuyo nombre empiece por ‘A’.
SELECT A
FROM ASIGNATURA
  NATURAL JOIN AREA
WHERE A LIKE 'A%';
-- 2. Listar los nombres de asignaturas adscritas a áreas cuyo nombre termine en ‘A’.
SELECT A
FROM ASIGNATURA
  NATURAL JOIN AREA
WHERE AR LIKE '%A';
-- 3. Listar los nombres de asignaturas que lleven la palabra ‘DATOS’.
SELECT A
FROM ASIGNATURA
WHERE A LIKE '%DATOS%';
-- 4. Listar los DNI de los profesores en cuyo nombre el tercer carácter sea ‘R’.
SELECT DNI
FROM PROFESOR
WHERE P LIKE '__R%';
-- 5. Listar, sin contar duplicados, los DNI de los profesores con nombres de, a lo sumo, 5
-- caracteres de longitud.
SELECT DISTINCT DNI
FROM PROFESOR
WHERE LENGTH(P) <= 5;
-- 6. Listar, sin contar duplicados, los DNI de los profesores con nombres de, al menos, 5
-- caracteres de longitud.
SELECT DISTINCT DNI
FROM PROFESOR
WHERE LENGTH(P) >= 5;
-- 7. Listar los nombres de los profesores que actualmente imparten alguna asignatura.
SELECT DNI
FROM PROFESOR
  NATURAL JOIN PLAN_DOCENTE
WHERE FF IS NULL;
-- 8. Nombres de los profesores que han impartido la asignatura con código 8.
SELECT P
FROM PROFESOR
  NATURAL JOIN PLAN_DOCENTE
WHERE CAS = 8;
-- 9. Listar las t-uplas de la tabla PLAN_DOCENTE ordenadas de forma ascendente, según el
-- campo FF.
SELECT *
FROM PLAN_DOCENTE
ORDER BY FF ASC;
-- 10. Listar las t-uplas de la tabla PLAN_DOCENTE ordenadas de forma descendente, según el
-- campo FF.
SELECT *
FROM PLAN_DOCENTE
ORDER BY FF DESC;
-- 11. Nombres de los profesores que han impartido la asignatura ‘OPTIMIZACIÓN’ en la
-- titulación GII. Ordena los nombres ascendentemente.


SELECT *
FROM PLAN_DOCENTE
  JOIN ASIGNATURA ON PLAN_DOCENTE.CAS = ASIGNATURA.CAS
  JOIN PROFESOR ON PLAN_DOCENTE.DNI = PROFESOR.DNI
WHERE A = 'OPTIMIZACION'
  AND T = 'GII';


-- 12. Listar los nombres de los profesores del departamento ‘MATEMÁTICA
-- FUNDAMENTAL’. Ordena los nombres descendentemente.
-- 13. Listar los nombres de las asignaturas impartidas por el profesor con DNI 1010.
-- 14. Listar los nombres de las asignaturas impartidas por el profesor con nombre ‘DAVID’.
-- 15. Listar los nombres de las áreas adscritas al departamento ‘ESTADISTICA,
-- INVESTIGACIÓN OPERATIVA Y COMPUTACIÓN’.
-- 16. Listar los nombres de las asignaturas impartidas actualmente por catedráticos de universidad
-- (categoría CU).
-- 17. Listar los nombres de las asignaturas que siempre han sido impartidas por catedráticos de
-- universidad (categoría CU).
-- 18. Listar los nombres de asignaturas adscritas a ‘LENGUAJES Y SISTEMAS
-- INFORMÁTICOS’ o a ‘CIENCIAS DE LA COMPUTACIÓN E INTELIGENCIA
-- ARTIFICIAL’.
-- BASES DE DATOS – GRADO EN INGENIERÍA INFORMÁTICA – ULL
-- 2
-- 19. Listar los nombres de profesores que actualmente dan clases en las titulaciones ‘GII’ o en
-- ‘MII’.
-- 20. Listar los nombres de profesores que actualmente dan clases en las titulaciones ‘GII’ y en
-- ‘MII’ simultáneamente.
-- 21. Listar los nombres de profesores que actualmente no imparten ninguna asignatura.
-- 22. Listar los nombres de asignaturas impartidas en la titulación GII.
-- 23. Listar los nombres de las áreas de conocimiento y los nombres de las asignaturas que
-- pertenecen a ellos.
-- 24. Listar los nombres de departamentos y los nombres de las áreas adscritas a ellos. Ambos
-- campos deben estar ordenados de forma alfabética.
-- 25. Listar los nombres de departamentos y los profesores de cada uno de ellos. Ambos campos
-- deben estar ordenados de forma alfabética.
-- 26. En qu'e d'ia de la semana he nacido
-- 27 Cuantos d'ias he vivido
