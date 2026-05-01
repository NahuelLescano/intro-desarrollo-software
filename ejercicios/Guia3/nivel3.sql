-- 1. El nombre de las bandas cuyos álbumes (todos) duran más de 50 minutos.
SELECT DISTINCT b.nombre FROM bandas b
INNER JOIN albumes a ON a.banda_id = b.id
WHERE a.duracion > 50;

-- 2. El nombre de las canciones (con el nombre de su álbum) que pertenecen a álbumes lanzados después del año 2000. Ordenarlas por nombre de álbum (de A a Z), y por cada álbum, por nombre de canción (de Z a A).
SELECT c.nombre AS nombre_cancion, a.nombre AS nombre_album FROM canciones c
INNER JOIN albumes a ON a.id = c.album_id
WHERE a.lanzamiento > 2000
ORDER BY a.nombre ASC, c.nombre DESC;

-- 3. El nombre de las bandas con menos de 5 integrantes y de género "Rock Alternativo", cuyas canciones duran 4 o más minutos (todas ellas).
SELECT b.nombre AS banda, c.nombre AS cancion FROM bandas b
INNER JOIN canciones c ON c.banda_id = b.id
WHERE b.genero = 'Rock Alternativo' AND c.duracion >= 4 AND b.cant_integrantes < 5;

-- 4. El concierto con más bandas participantes, mostrando el nombre del concierto y la cantidad de bandas que participaron.
SELECT c.nombre AS concierto, COUNT(cm.banda_id) AS bandas_participantes FROM conciertos c
INNER JOIN conciertos_musicos cm ON cm.concierto_id = c.id
GROUP BY c.id
ORDER BY bandas_participantes DESC;

-- 5. El nombre de los álbumes cuyas bandas fueron al menos a un concierto en el país "Argentina", ordenados por ranking de mejor a peor.
SELECT DISTINCT a.nombre AS album, b.nombre AS banda
FROM albumes a
INNER JOIN bandas b ON b.id = a.banda_id
INNER JOIN conciertos_musicos cm ON cm.banda_id = b.id
INNER JOIN conciertos c ON c.id = cm.concierto_id
WHERE c.pais = 'Argentina';

-- 6. La cantidad de canciones que tiene cada banda, ordenadas de mayor a menor cantidad de canciones. Mostrar el nombre de la banda y la cantidad de canciones.
SELECT b.nombre AS banda, COUNT(c.id) AS cantidad_canciones FROM bandas b
INNER JOIN canciones c ON c.banda_id = b.id
GROUP BY b.id
ORDER BY cantidad_canciones DESC;
