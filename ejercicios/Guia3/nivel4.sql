-- 1. El primer álbum de todas las bandas. Mostrar el nombre de la banda, del álbum y el año de lanzamiento. ¿Y para hacerlo con el último de cada banda?
-- Primer album
SELECT b.nombre AS banda, a.nombre AS album, a.lanzamiento FROM bandas b
INNER JOIN albumes a ON a.banda_id = b.id
WHERE a.lanzamiento = (SELECT MIN(lanzamiento) FROM albumes WHERE banda_id = b.id)
ORDER BY a.lanzamiento ASC;

-- Ultimo album
SELECT b.nombre AS banda, a.nombre AS album, a.lanzamiento FROM bandas b
INNER JOIN albumes a ON a.banda_id = b.id
WHERE a.lanzamiento = (SELECT MIN(lanzamiento) FROM albumes WHERE banda_id = b.id)
ORDER BY a.lanzamiento ASC;

-- 2. La cantidad promedio de integrantes de las bandas por cada género musical. Mostrar el género y la cantidad promedio de integrantes.
SELECT genero, AVG(cant_integrantes) AS promedio_integrantes FROM bandas
GROUP BY genero
ORDER BY promedio_integrantes DESC;

-- 3. El nombre de las bandas que participaron en todos los conciertos que ocurrieron en el país "Argentina".
SELECT b.nombre AS banda FROM bandas b
JOIN conciertos_musicos cm ON cm.banda_id = b.id
JOIN conciertos c ON c.id = cm.concierto_id
WHERE c.pais = 'Argentina'
GROUP BY b.id, b.nombre
HAVING COUNT(c.id) = (SELECT COUNT(*) FROM conciertos WHERE pais = 'Argentina');

-- 4. Las bandas cuyo promedio de duración de canciones es mayor a 5 minutos. Mostrar el nombre de la banda y el promedio de duración de sus canciones.
SELECT b.nombre AS banda, AVG(c.duracion) AS promedio_duracion FROM bandas b
JOIN canciones c ON c.banda_id = b.id
GROUP BY b.id, b.nombre
HAVING AVG(c.duracion) > 5;

-- 5. El nombre de las bandas que no tienen conciertos registrados.
SELECT b.nombre AS banda FROM bandas b
LEFT JOIN conciertos_musicos cm ON cm.banda_id = b.id
-- WHERE cm.concierto_id IS NULL;

-- 6. El nombre y ranking de los álbumes que tienen todas sus canciones con un ranking peor o igual a 30.
SELECT a.nombre, a.ranking FROM albumes a
JOIN canciones c ON c.album_id = a.id
WHERE a.ranking <= 30
GROUP BY a.id, a.nombre, a.ranking;

-- 7. El nombre de las bandas que tienen a más de la mitad de sus canciones con un ranking peor o igual a 30. Mostrar también (para cada banda) la cantidad de canciones rankeadas peor o igual a 30, así como el promedio de ranking de TODAS las canciones de la banda.
SELECT b.nombre, 
COUNT(c.id)    AS cantidad_canciones_peores_30,
ROUND(AVG(c.ranking), 2) AS promedio_ranking_canciones
FROM bandas b
JOIN canciones c ON c.banda_id = b.id
GROUP BY b.id, b.nombre
HAVING COUNT(c.id) FILTER (WHERE c.ranking <= 30) > (COUNT(c.id) / 2);

-- 8. El nombre de las bandas que no tienen ninguna canción dentro del TOP 10 de canciones (según fulanito). Mostrar también el promedio de ranking de todas las canciones de la banda, y ranking mínimo de ellas (es decir, el de su mejor canción).
SELECT b.nombre AS banda, 
ROUND(AVG(c.ranking), 2) AS promedio_ranking,
MIN(c.ranking) AS ranking_min
FROM bandas b
JOIN canciones c ON c.banda_id = b.id
GROUP BY b.id, b.nombre
HAVING COUNT(c.id) FILTER (WHERE c.ranking <= 10) = 0
ORDER BY b.nombre;

-- 9. El nombre de las canciones cuyo ranking es mejor que el ranking del álbum al que pertenecen. Mostrar también el ranking de la canción, así como el nombre del álbum y su ranking. Ordenar por ranking de canción (de mejor a peor).
SELECT c.nombre  AS canciones,
       c.ranking AS ranking_canciones,
       a.nombre  AS album,
       a.ranking AS ranking_album
FROM canciones c
JOIN albumes a ON a.id = c.album_id
WHERE c.ranking < a.ranking
ORDER BY c.ranking ASC;

-- 10. Las bandas y los conciertos donde el concierto se realizó en el país de origen de la banda. Mostrar (en este orden) el nombre de la banda, el del concierto, y el país de origen de la banda.
SELECT b.nombre AS banda, c.nombre AS concierto, b.pais_origen
FROM bandas b
JOIN conciertos_musicos cm ON cm.banda_id = b.id
JOIN conciertos c ON c.id = cm.concierto_id
WHERE c.pais = b.pais_origen
ORDER BY b.nombre, c.nombre;
