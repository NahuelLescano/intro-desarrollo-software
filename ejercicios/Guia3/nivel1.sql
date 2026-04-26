-- EJERCICIOS 1
-- 1. El nombre y el país de origen de todas las bandas que tienen exactamente 5 integrantes.
SELECT nombre, pais_origen FROM bandas
WHERE cant_integrantes = 5;

-- 2. El nombre y la duración de todos los álbumes que tienen una duración mayor a 40 minutos.
SELECT nombre, duracion FROM albumes
WHERE duracion > 40;

-- 3. El nombre y la duración de todas las canciones que tienen una duración menor o igual a 3 minutos.
SELECT nombre, duracion FROM canciones
WHERE duracion <= 3;

-- 4. El nombre y la fecha de todos los conciertos que se realizaron en el país "Argentina".
SELECT nombre, fecha FROM conciertos
WHERE pais = 'Argentina';

-- 5. El nombre y ranking de los mejores 7 álbumes de la historia (según fulanito), ordenados alfabéticamente por nombre (de A a Z).
SELECT nombre, ranking FROM albumes
ORDER BY ranking ASC;
