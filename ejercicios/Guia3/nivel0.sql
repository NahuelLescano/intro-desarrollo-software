-- EJERCICIOS 0
-- Se pide mostrar, en cada ejercicio:
-- 1. Todas las bandas musicales con sus respectivos campos (todos).
SELECT * FROM bandas;

-- 2. Solo el nombre y el país de origen de todas las bandas.
SELECT nombre, pais_origen FROM bandas;

-- 3. El nombre y la fecha de creación de todas las bandas, ordenadas por fecha de creación (de más reciente a más antiguo).
SELECT nombre, fecha_creacion FROM bandas
ORDER BY fecha_creacion DESC;

-- 4. El nombre y el país de origen de todas las bandas que son del género "Rock".
SELECT nombre, pais_origen FROM bandas
WHERE genero = 'Rock';

-- 5. Todos los álbumes con sus respectivos campos (todos).
SELECT * FROM albumes;

-- 6. Solo el nombre y la duración de todos los álbumes, ordenados por orden alfabético de nombre (de A a Z).
SELECT nombre, duracion FROM albumes
ORDER BY nombre ASC;

-- 7. El ranking y el nombre de todos los álbumes, ordenados de mejor (1) a peor ranking.
SELECT ranking, nombre FROM albumes
ORDER BY ranking ASC;

-- 8. El nombre y la duración de todas las canciones, ordenadas por duración (de más larga a más corta).
SELECT nombre, duracion FROM albumes
ORDER BY duracion DESC;

-- 9. El nombre y fecha de todos los conciertos, ordenados por fecha (de más antiguo a más reciente).
SELECT nombre, fecha FROM conciertos
ORDER BY fecha ASC;


-- SELECT * FROM albumes
-- INNER JOIN bandas ON albumes.banda_id = bandas.id;

