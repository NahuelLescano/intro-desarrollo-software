# Introduccion al desarrollo de software

Esto no es oficial de la materia.
Son mis apuntes basados en los que los profes presentan en su pagina principal y notas hechas en clase. A mi me gusta tenerlos en PDF (?.

Los apuntes estan todos hechos en markdown y luego los convierto a PDF usando `pandoc`

```bash
./generate_pdf.sh <apunte>
```

## Ejercicios de SQL

Para correr las queries, primero tenes que levantar el contenedor. Podes hacerlo a traves de `docker compose` o `make`

Para levantar el contenedor, usa:

```bash
docker compose up -d
```
o

```bash
make
```
Por defecto hace `make up`

Para ver los contenedores corriendo en el momento

```bash
docker compose ps
```

o

```bash
make ps
```

Ver los logs del momento

```bash
docker compose logs -f
```

o

```bash
make logs
```

Para remover el contenedor, usa:

```bash
docker compose down
```

o

```bash
make down
```

O, si queres borrar el volumen, podes hacer:

```bash
docker compose down -v
```

o

```bash
make delete
```

Si por alguna razon la base de datos no funciona del todo bien, podes resetearlo corriendo ambos comandos al mismo tiempo:

```bash
docker compose down -v
docker compose up -d
```

o

```bash
make reset
```

### Pagina de la catedra

Pagina oficial de la materia: [Intro pagina principal](https://www.intro-camejo.com.ar/)

