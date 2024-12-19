SET LINESIZE 200;
SET PAGESIZE 200;
--deshabilitar la salida en spooling si estuviera activa
spool off;

-- 1. Eliminar las vistas creadas
DROP VIEW VISTA2;
DROP VIEW VISTA1;

-- 2. Eliminar el sinónimo
DROP SYNONYM TIT;

-- 3. Eliminar los índices creados
-- Puede fallar, ya que no se pueden crear índices directamente sobre vistas
DROP INDEX INDICE2; 
DROP INDEX INDICE1;

-- 4. Eliminar la tabla TITULACION
DROP TABLE TITULACION CASCADE CONSTRAINTS;

DELETE FROM ASIGNATURA WHERE A = 'ESTADISTICA';

-- 5. Opcional: Confirmación de que todo se ha eliminado correctamente
-- Consultar las vistas restantes
SELECT view_name FROM user_views;
-- Consultar los sinónimos restantes
SELECT synonym_name FROM user_synonyms;
-- Consultar las tablas restantes
SELECT table_name FROM user_tables;
-- Consultar los índices restantes
SELECT index_name FROM user_indexes;


