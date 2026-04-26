# Introduccion a SQL

SQL (Structured Query Language) es un lenguaje de consulta y manipulación de bases de datos (declarativo) usado para definir, consultar y modificar datos.

* **Base de datos**: Un conjunto organizado de datos que se pueden acceder y manipular.
* **Tabla**: Una estructura dentro de una base de datos que almacena datos en filas y columnas.
* **Consulta**: Una instruccion SQL que se utiliza para recueprar o manipular datos en una base de datos.

Notemos que hay una distincion entre **Base de Datos** y una **Tabla**. Una Base de Datos puede contener multiples Tablas, cada una con su propia estructura y datos. La base de datos se refiere a un conjunto completo de datos, mientras que una tabla es un a representacion espeficia de esos datos en forma de filas y columnas.

## Manipulacion de tablas y bases de datos

Para crear una base de datos en SQL, se utiliza la instruccion `CREATE DATABASE <nombre>`. Por ejemplo:

```sql
CREATE DATABASE mi_base_de_datos;
```

## Creacion de una tabla

Para crear una tabla dentro de una base de datos, se utiliza la instruccion `CREATE TABLE <nombre>`. Por ejemplo:

```sql
CREATE TABLE empleados {
    id           INT PRIMARY KEY,
    nombre       VARCHAR(50),
    departamento VARCHAR(50),
    salario      DECIMAL(10, 2)
};
```
