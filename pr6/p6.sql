spool p6_clean.lst

SET ECHO ON;
SET LINESIZE 200;
SET PAGESIZE 200;
-- 1. Obtener la fecha del sistema.
REM 1;
SELECT CURRENT_DATE
FROM DUAL;
-- 2. Obtener la hora del sistema.
REM 2;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'HH24:MI:SS')
FROM DUAL;
-- 3. Dar la fecha del sistema con el formato día de la semana, día del mes, mes y año.
REM 3;
SELECT TO_CHAR(CURRENT_DATE, 'DAY DD MONTH YYYY')
FROM DUAL;
-- 4. Dar la hora del sistema en formato de reloj de 24 horas.
REM 4;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'HH24:MI:SS')
FROM DUAL;
-- 5. Obtener el número de días que lleva impartiendo la asignatura con código 11 el profesor con
-- DNI 8888.
REM 5;
SELECT SYSDATE - FI
FROM PLAN_DOCENTE
WHERE DNI = 8888
  AND FF IS NULL
  AND PLAN_DOCENTE.CAS = 11;
-- 6. Listar los nombres de profesores que han impartido una asignatura más de 365 días.
-- Coge los que est'an impartiando ahora y los que han impartido
REM 6;
SELECT DISTINCT P
FROM PLAN_DOCENTE
  JOIN PROFESOR ON PROFESOR.DNI = PLAN_DOCENTE.DNI
WHERE FF - FI > 365
  OR SYSDATE - FF IS NULL;
-- 7. Hallar el número de profesores del departamento ‘ASTROFÍSICA’.
REM 7;
SELECT COUNT(DISTINCT DNI)
FROM PROFESOR
  JOIN AREA ON PROFESOR.CAR = AREA.CAR
  JOIN DEPARTAMENTO ON AREA.CD = DEPARTAMENTO.CD
WHERE D = 'ASTROFISICA';
-- 8. Hallar para cada departamento el número de profesores que tiene. Ordena la salida
-- alfabéticamente.
REM 8;
SELECT DEPARTAMENTO.D,
  COUNT(DISTINCT PROFESOR.DNI)
FROM PROFESOR
  JOIN AREA ON PROFESOR.CAR = AREA.CAR
  JOIN DEPARTAMENTO ON AREA.CD = DEPARTAMENTO.CD
GROUP BY DEPARTAMENTO.D
ORDER BY DEPARTAMENTO.D;
-- 9. Hallar en cuantas titulaciones imparte el departamento de ‘ESTADÍSTICA,
-- INVESTIGACIÓN OPERATIVA Y COMPUTACIÓN’.
REM 9;
SELECT COUNT(DISTINCT T)
FROM ASIGNATURA
  JOIN AREA ON ASIGNATURA.CAR = AREA.CAR
  JOIN DEPARTAMENTO ON AREA.CD = DEPARTAMENTO.CD
WHERE DEPARTAMENTO.D = 'ESTADISTICA, INVESTIGACION OPERATIVA Y COMPUTACION';
-- 10. Hallar el número de profesores adscritos a áreas cuyo nombre (el de las áreas) empiece por
-- ‘A’.
REM 10;
SELECT COUNT(DISTINCT DNI)
FROM PROFESOR
  JOIN AREA ON PROFESOR.CAR = AREA.CAR
WHERE AR LIKE 'A%';
-- 11. Hallar para cada titulación el número de asignaturas que tiene. Ordena la salida
-- alfabéticamente.
REM 11;
SELECT T,
  COUNT(*)
FROM ASIGNATURA
GROUP BY T
ORDER BY T;
-- 12. Listar el nombre de la asignatura con más créditos teóricos.
REM 12;
SELECT A
FROM ASIGNATURA
WHERE CT = (
	    SELECT MAX(CT)
	    FROM ASIGNATURA
	  );
	-- 13. Listar el nombre de la asignatura con menos créditos teóricos
REM 13;
SELECT A
FROM ASIGNATURA
WHERE CT = (
	    SELECT MIN(CT)
	    FROM ASIGNATURA
	  );
	-- 14. Listar para cada asignatura el número total de créditos que tiene.
REM 14;
SELECT A,
  CT + CP + CL
FROM ASIGNATURA;
-- 15. Listar el nombre de la asignatura con más créditos.
REM 15;
SELECT A
FROM ASIGNATURA
WHERE CT + CP + CL = (
	    SELECT MAX(CT + CP + CL)
	    FROM ASIGNATURA
	  );
	-- 16. Listar el nombre de la asignatura con menos créditos.
REM 16;
SELECT A
FROM ASIGNATURA
WHERE CT + CP + CL = (
	    SELECT MIN(CT + CP + CL)
	    FROM ASIGNATURA
	  );
	-- 17. Listar el nombre del área a la que está adscrita la asignatura con más créditos.
REM 17;
SELECT AR
FROM ASIGNATURA
  JOIN AREA ON ASIGNATURA.CAR = AREA.CAR
WHERE CT + CP + CL = (
	    SELECT MAX(CT + CP + CL)
	    FROM ASIGNATURA
	  );
	-- 18. Hallar el número de asignaturas impartidas por el profesor con DNI 1111.
REM 18;
SELECT COUNT(*)
FROM PLAN_DOCENTE
WHERE DNI = 1111;
-- 19. Hallar el número de créditos impartidos por el profesor con DNI 1111.
REM 19;
SELECT SUM(CTA + CPA + CLA)
FROM PLAN_DOCENTE
WHERE DNI = 1111;
-- 20. Hallar el nombre del profesor que más créditos imparte actualmente.
REM 20;
SELECT P
FROM PLAN_DOCENTE
  JOIN ASIGNATURA ON ASIGNATURA.CAS = PLAN_DOCENTE.CAS
  JOIN PROFESOR ON PROFESOR.DNI = PLAN_DOCENTE.DNI
WHERE FF IS NULL
GROUP BY P
HAVING SUM(CT + CP + CL) = (
	    SELECT MAX(SUM(CT + CP + CL))
	    FROM PLAN_DOCENTE
	      JOIN ASIGNATURA ON ASIGNATURA.CAS = PLAN_DOCENTE.CAS
	      JOIN PROFESOR ON PROFESOR.DNI = PLAN_DOCENTE.DNI
	      NATURAL JOIN PROFESOR
	    WHERE FF IS NULL
	    GROUP BY P
	  );
	-- 21. Hallar el número medio de asignaturas adscritas a cada área.
REM 21;
SELECT AVG(COUNT(*))
FROM AREA
  JOIN ASIGNATURA ON ASIGNATURA.CAR = AREA.CAR
GROUP BY AR;
-- 22. Hallar el número medio de profesores de cada departamento.
REM 22;
SELECT AVG(num_profesores)
FROM (
	    SELECT D.CD, COUNT(DISTINCT P.DNI) AS num_profesores
	    FROM DEPARTAMENTO D
	      JOIN AREA A ON D.CD = A.CD
	      JOIN PROFESOR P ON A.CAR = P.CAR
	    GROUP BY D.CD
);
-- 23. Hallar los nombres de las áreas que tengan más de 3 asignaturas.
REM 23;
SELECT AR
FROM AREA
  JOIN ASIGNATURA ON ASIGNATURA.CAR = AREA.CAR
GROUP BY AR
HAVING COUNT(*) > 3;
-- 24. Hallar los nombres de las áreas que tengan más de 6 asignaturas.
REM 24;
SELECT AR
FROM AREA
  JOIN ASIGNATURA ON ASIGNATURA.CAR = AREA.CAR
GROUP BY AR
HAVING COUNT(*) > 6;
-- 25. Hallar el nombre del departamento con menos profesores.
REM 25;
SELECT D.D
FROM DEPARTAMENTO D
  JOIN AREA A ON A.CD = D.CD
  JOIN PROFESOR P ON P.CAR = A.CAR
GROUP BY D.CD, D.D
HAVING COUNT(P.DNI) = (
	    SELECT MIN(CNT)
	    FROM (
		        SELECT COUNT(P2.DNI) AS CNT
			        FROM DEPARTAMENTO D2
				          JOIN AREA A2 ON A2.CD = D2.CD
					          JOIN PROFESOR P2 ON P2.CAR = A2.CAR
						        GROUP BY D2.D
							    )
						);

						spool off 
						exit

