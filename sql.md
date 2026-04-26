# Introduccion a SQL

SQL (Structured Query Language) es un lenguaje de consulta y manipulación de bases de datos (declarativo) usado para definir, consultar y modificar datos.

* **Base de datos**: Un conjunto organizado de datos que se pueden acceder y manipular.
* **Tabla**: Una estructura dentro de una base de datos que almacena datos en filas y columnas.
* **Consulta**: Una instruccion SQL que se utiliza para recuperar o manipular datos en una base de datos.

Notemos que hay una distincion entre **Base de Datos** y una **Tabla**. Una Base de Datos puede contener multiples Tablas, cada una con su propia estructura y datos. La base de datos se refiere a un conjunto completo de datos, mientras que una tabla es un a representacion espeficia de esos datos en forma de filas y columnas.

# Manipulacion de tablas y bases de datos

Para crear una base de datos en SQL, se utiliza la instruccion `CREATE DATABASE <base_de_datos>`. Por ejemplo:

```sql
CREATE DATABASE mi_base_de_datos;
```

## Creacion de una tabla

Para crear una tabla dentro de una base de datos, se utiliza la instruccion `CREATE TABLE <tabla>`. Por ejemplo:

```sql
CREATE TABLE empleados {
    id           INT PRIMARY KEY,
    nombre       VARCHAR(50),
    departamento VARCHAR(50),
    salario      DECIMAL(10, 2)
};
```

En esta consulta se crea una tabla `empleados` con cuatro columnas:
* la columna`id`: es de tipo `INT` y se define como `PRIMARY KEY`, lo que significa que debe ser unica para cada registro.
* las columnas `nombre` y `departamento`: son de tipo `VARCHAR(50)` con maximo 50 caracteres.
* la columna `salario`: es de tipo `DECIMAL(10, 2)` con dos decimales

## Insercion de datos

Para insertar datos en una tabla, se utiliza `INSERT INTO <tabla (columnas)> VALUES (<valores_a_insertar>)`

```sql
INSERT INTO empleados (id, nombre, departamento, salario)
VALUES (1, 'Juan Perez', 'Recursos Humanos', 3000.00);
```

Esta consulta inserta un nuevo registro en la tabla `empleados` con los valores especificados para cada columna. Se pueden multiples registros utilizando varias sentencias `INSERT INTO` o una sola sentencia con multimples valores.

```sql
INSERT INTO empleados (id, nombre, departamento, salario)
VALUES 
    (2, 'Ana Gomez', 'Finanzas', 3500.20)
    (3, 'Luis Martinez', 'IT', 4000.25)
    (4, 'Maria Lopez', 'Marketing', 3200.45);
```

## Eliminacion de datos

Para eliminar datos de una tabla, se utiliza la instruccion `DELETE FROM <tabla>`

```sql
DELETE FROM empleados
WHERE id = 1;
```

Esta consulta elimina el registro de la tabla `empleados` donde el `id` es igual a 1.
**IMPORTANTE**: hay que tener cuidado al utilizar esta instruccion, ya que lo **eliminara permanentemente** los datos del registro especificado. Ademas, sino se especifica `WHERE ...`, *se borraran todos los datos de la tabla*.

# Actualizacion de datos

Para actualizar datos en una tabla, se utiliza la instruccion `UPDATE <tabla> SET <columna>`

```sql
UPDATE empleados
SET salarios = 3200.56
WHERE id = 2;
```

Esta consulta actualiza el salario del empleado con `id` igual a 2, estableciendo su nuevo salario. Al igual que con el `DELETE`, es importante especificar correctamente la condicion en el `WHERE` para evitar actualizar registros incorrectos.

## Actualizacion de columnas en una tabla

Para actualizar la estructura de una tabla, como agregar o eliminar columnas, se utiliza `ALTER TABLE <tabla> ADD <columna>`.

```sql
ALTER TABLE empleados
ADD fecha_contratacion DATE;
```

Si luego se quisiera eliminar esta columna, se utilizaria `ALTER TABLE <tabla> DROP COLUMN <columna>`

```sql
ALTER TABLE empleados
DROP COLUMN fecha_contratacion DATE;
```

## Eliminacion de una tabla

Para eliminar una tabla de una base datos, se utiliza la instruccion `DROP TABLE <tabla>`.

```sql
DROP TABLE empleado;
```

La consulta elimina la tabla empleados de la base de datos, junto con toods los datos que contiene, **a menos que existan restricciones de foreign keys**.
Hay que tener cuidado con el uso de este comando, al igual que con el `DELETE`, ya que los cambios son *permanentes*.

Si se sabe que la tabla tiene registricciones de *foreign keys* y se desea eliminarla junto con todas las referencias, se puede utilizar la opcion `CASADE`:

```sql
DROP TABLE empleado CASCADE;
```

## Quitar datos de la tabla

Para eliminar todos los datos de una tabla sin eliminar la tabla en si, se utiliza `TRUNCATE TABLE <tabla>`.

```sql
TRUCANTE TABLE empleado;
``` 

Se elimina todos loos registros de la tabla `empleados`, pero mantiene la estructura de la tabla intacta. Por lo tanto, la tabla seguira existiendo y se podra seguir utilizando para insertar nuevos datos.

## Eliminacion de una base de datos

Para eliminar una base de datos completa, se utiliza la instruccion `DROP DATABASE <base_de_datos>`

```sql
DROP DATABASE mi_base_de_datos;
```

Esta consulta elimina la base de datos `mi_base_de_datos` junto con todas las tablas y datos que contiene. **MUCHO CUIDADO CON ESTA CONSULTA** ya que elimina de forma permanente la base de datos y todos sus contenidos.


# Consultas en una tabla

Ahora que ya se tiene un conjunto de tablas con datos insertados, se epueden realizar consultas para recuperar informacion especifica. Las consultas se realizan utilizando `SELECT <columnas> FROM <tabla>`

```sql
SELECT * FROM empleados;
```

Esta consulta selecciona todos los registros de la tabla `empleados` y muestra todas las columnas. El asterisco indica que se deben seleccionar todas las columnas disponibles.

Para seleccionar columnas especificas, se pueden enumerar los nombres de las columnas.

```sql
SELECT nombre, salario FROM empleados;
```

## Filtrado de resultados

Para filtrar los resultados de una consulta, se utiliza la clausula `WHERE`.

```sql
SELECT * FROM empleados
WHERE salario > 3000.00;
```

Esta consulta selecciona todos los registros de la tabla `empleados` donde el salario es mayor a **3000.00**. Se pueden utilizar operadores de comparacion como `=` **(equal)**, `>` **(greater than)**, `<` **(less than)**, `>=` **(greater or equal than)**, `<=` **(less or equal than)** y `<>` **(not equal)** para establecer condiciones.

```sql
SELECT * FROM empleados
WHERE nombre LIKE 'A%';
```

Esta consulta selecciona todos los registros de la tabla `empleados` donde el nombre comienza con la letra `A`. El operador `LIKE` se utiliza para realizar busquedas basadas en patrones, y simbolo `%` actual como un comodin que representa cualquier secuencia de caracteres.

## Ordenamiento de resultados

Para ordenar los resultados de una consulta, se utiliza la clausula `ORDER BY`.

```sql
SELECT * FROM empleados
ORDER BY salario DESC;
```

Esta consulta selecciona todos los registros de la tabla `empleados` y los ordena por la columna `salario` en orden descedente (`DESC`). Es decir, que los empleados estar ordenados desde el de mejor salario al de peor salario. Por default, el orden es ascendente (`ASC`).

```sql
SELECT * FROM empleados
ORDER BY nombre ASC;
```

# Agrupamiento de resultados

Para agrupar los resultados de una consulta, se utilizar la clausula `GROUP BY`.

```sql
SELECT departamento, COUNT(*) AS total_empleados
FROM empleados
GROUP BY departamento;
```

Esta consulta selecciona el departamento y el numero total de empleados en cada departamento de la tabla `empleados`. La funcion `COUNT(*)` cuenta el numero de registros en cada grupo definido por `GROUP BY`. El resultado mostrara una lista de departamentos junto con el total de empleados en cada uno.

```sql
SELECT departamento, AVG(salario) AS salario_promedio
FROM empleados
GROUP BY departamento;
```

Esta consulta selecciona el departamento y el salario promedio de los empleados en cada departamento de la tabla `empleados`. La funcion `AVG(salario)` calcula el salario promedio para cada grupo definido por `GROUP BY`. El resultado mostrara una lista de departamentos junto con el salario promedio de los empleados en cada uno.

## Funciones de agregacion

SQL proporciona varias funciones de agregacion que se pueden utilizar para realizar calculos en los datos. Algunas de las funciones mas comunes son:

\begin{table}[h]
\centering
\begin{tabularx}{\textwidth}{lX}
\toprule
\textbf{Funciones} & \textbf{Uso} \\
\midrule
\texttt{COUNT()} & Cuenta el numero de registros en un grupo. \\
\texttt{SUM()} & Suma los valores de una columna en un grupo. \\
\texttt{AVG()} & Calcula el promedio de los valores de una columna en un grupo. \\
\texttt{MIN()} & Devuelve el valor minimo de una columna en un grupo. \\
\texttt{MAX()} & Devuelve el valor maximo de una columna en un grupo. \\
\bottomrule
\end{tabularx}
\end{table}


# Consultas entre tablas

Es comun trabajar con multiples tablas y realizar consultas que involucren datos de varias de ellas.

## joins (Uniones)

Los *joins* permiten combinar registros de dos o mas tablas basandose en una relacion entre ellas. Existen varios tipos de *joins*, siendo el mas comun el `INNER JOIN`, que devuelve solo los registros que tienen coincidencias en ambas tablas.

Por ejemplo, se tuvieramos una tabla `departamentos` que contiene informacion sobre los departamentos de la empresa, y queremos obtener una lista de empleados junto con su departamento, podriamos hacer lo siguiente:

```sql
SELECT empleados.nombre, departamentos.nombre AS departamento
FROM empleados
INNER JOIN departamentos ON empleados.departamento = departamento.id;
```

Otra forma de hacer este *join* es utilizando `WHERE`:

```sql
SELECT empleados.nombre, departamentos.nombre AS departamento
FROM empleados, departamentos
WHERE empleados.departamento = departamentos.id;
```

### Diferencias entre `WHERE` y `JOIN`

En realidad, ambas formas son validas y producen el mismo resultado. Sin embargo, el uso de `JOIN` es mas explicito y legile, permitiendo trabajar con multiples tablas. Ademas de que permite especificar diferentes tipos de uniones (`LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`) que tienen diferentes comportamientos en cuanto a los registros que se incluyen en el resultado.

## Subconsultas

Las subconsultas son consultas anidadas dentro de otra consulta. Se utilizan para realizar operaciones mas complejas o para filtar resultados basados en el resultado de otra consulta

Por ejemplo, si queremos obtener una lista de empleados cuyo salario es mayor que el salario promedio de todos los empleados:

```sql
SELECT nombre, salario
FROM empleados
WHERE salarios > (SELECT AVG(salario) FROM empleados);
```

## Consultas avanzadas

Se pueden combinar multiples joins y subconsultas.

```sql
SELECT empleados.nombre, departamentos.nombre AS departamento, AVG(empleados.salario) AS salario_promedio
FROM empleados
INNER JOIN departamentos ON empleados.departamento = departamentos.id
GROUP BY empleados.nombre, departamentos.nombre;
```

Esta consulta selecciona el nombre de los empleados, nombre de su departamento y el salario promedio de los empleados en ese departamento. Utiliza un `INNER JOIN` para combinar las tablas `empleados` y `departamentos` y luego agrupa los resultados por el nombre del empleado y el nombre del departamento para calcular el salario promedio.

# Primary Keys y Foreign Keys

## Primary Keys (claves primarias)

Una **primary key** es una columna o conjunto de columnas que identifica de manera unica cada fila en una tabla. No puede contener valores nulos y debe ser unica para cada registro. Garantiza que no haya duplicados en la tabla y establece relaciones con otras tablas.

Por ejemplo:

```sql
CREATE TABLE empleados {
    id           SERIAL PRIMARY KEY,
    nombre       VARCHAR(50),
    departamento VARCHAR(50),
    salario      DECIMAL(10, 2)
};
```

En este caso, la columna `id` es de tipo `SERIAL`, lo que significa que se generara automaticamente un valor unico para cada nuevo registro insertado en la tabla.

## Foreign keys (claves foraneas)

Una **foreign key** es una columna o conjuto de columnas en una tabla que hace referencia a la **primary key** de otra tabla. Se utiliza para establecer y reforzar la relacion entre las dos tablas. Las claves foraneas permiten la comunicacion entre tablas, asegurando que los valores en la columna de la clave foreanea coincidan con los valores en la columna de la clave primaria de la tabla referenciada. Es decir, que de alguna manera **una clave foranea en una tabla apunta a una clave primaria de otra tabla**.

```sql
CREATE TABLE departamentos {
    id     SERIAL PRIMARY KEY,
    nombre VARCHAR(50)
};


CREATE TABLE empleados {
    id           SERIAL PRIMARY KEY,
    nombre       VARCHAR(50),
    departamento INT,
    salario      DECIMAL(10, 2),
    FOREIGN KEY (depto_id) REFERENCES departamentos(id)
};
```
