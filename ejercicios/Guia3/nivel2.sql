-- 1. El nombre y ranking de las peores 5 canciones de la historia (según fulanito), ordenadas de peor a mejor ranking (¡la peor va primero!).
SELECT nombre, ranking FROM canciones
ORDER BY ranking DESC;

-- 2. El nombre de todos los albumes de la banda The Beatles.
SELECT a.nombre FROM albumes a
INNER JOIN bandas b ON b.id = a.banda_id
WHERE b.nombre = 'The Beatles';

-- SELECT nombre FROM albumes
-- WHERE banda_id = (SELECT id FROM bandas WHERE nombre = 'The Beatles');

-- 3. El nombre de todas las bandas que tienen al menos un álbum lanzado antes o en el año 1980. (¡que no se repitan las bandas!)
SELECT DISTINCT b.nombre FROM bandas b
INNER JOIN albumes a ON a.banda_id = b.id
WHERE a.lanzamiento <= 1980;

-- 4. El nombre y la fecha de los conciertos que se realizaron en el país "Argentina" y que tuvieron lugar antes del año 2010.
SELECT nombre, fecha FROM conciertos
WHERE pais = 'Argentina' AND fecha < 2010;

-- 5. La suma de la duración de todas las canciones de la banda Queen.
SELECT SUM(c.duracion) AS duracion FROM canciones c
INNER JOIN albumes a ON a.id = c.album_id
INNER JOIN bandas b ON b.id = a.banda_id
WHERE b.nombre = 'Queen';

-- 6. La suma de la duración de todos los álbumes de la banda The Rolling Stones.
SELECT SUM(c.duracion) AS duracion FROM canciones c
INNER JOIN albumes a ON a.id = c.album_id
INNER JOIN bandas b ON b.id = a.banda_id
WHERE b.nombre = 'The Rolling Stones';

-- 7. El nombre de los conciertos a los cuales asistió la banda Dire Straits.
SELECT c.nombre AS conciertos_asistidos FROM conciertos c
INNER JOIN conciertos_musicos cm ON cm.concierto_id = c.id
INNER JOIN bandas b ON b.id = cm.banda_id
WHERE b.nombre = 'Dire Straits';

-- 8. El nombre de las bandas que tienen al menos un álbum con una duración menor a 40 minutos (¡que no se repitan las bandas!).
SELECT DISTINCT b.nombre FROM bandas b
INNER JOIN albumes a ON a.banda_id = b.id
WHERE a.duracion < 40;
