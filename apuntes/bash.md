# Bash

**Bash (Bourne Again Shell)** es un interprete comandos y un lenguaje de scripting muy popular en los sistemas operativos basados en Unix, como Linux y macOS. Su nombre hace referencia a _Bourne Shell (`sh`)_, la shell original creada por Stephen Bourne en los '70.

## Caracteristicas de Bash

### Interprete de comandos

Un interprete de comandos es un programa que lee y ejecuta comandos ingresados por el usuario, actuando como un puente entre el usuario y el sistema operativo. Esto nos permite ejecutar tareas y controlar el sistema mediante comandos escritos en texto.

#### Funcionamiento basico

* **Entrada de comandos:** al abrir la terminal, por defecto se inicia sesion en bash, permitiendo escribir comandos. Por ejemplo, `ls` para listar el contenido del directorio actual o `cd` para cambiar de directorio.

* **Procesamiento de comandos:** bash recibe el comando, lo interpreta y lo convierte en acciones que el sistema operativo puede ejecutar. Por ejemplo, `mkdir nueva_carpeta`, bash lo interpreta como una solicitud para crear un nuevo directorio llamado "nueva_carpeta".

* **Ejecucion:** despues de interpretar el comando, bash lo pasa el sistema operativo para que lo ejecute. Este realiza la accion solicitada y luego el shell muestra el resultado o el output en la terminal.

* **Retorno de resultados:** tras ejecutar el comando, bash muestra el resultado de la operacion en la terminal.

#### Entrada y salida en bash

La comunicacion entre los procesos se maneja a traves de tres flujos estandar: `stdin` (entrada estandar), `stdout` (salida estandar) y `stderr` (error estandar).

* **stdin:** flujo a traves del cual los cmandos reciben datos. Por defecto, `stdin` proviene del teclado, pero podes redirigir la entrada desde un archivo o desde otro comando.

* **stdout:** flujo a traves del cual los comandos envian datos que deberian mostrarse al usuario. Por defecto, `stdout` es la salida a la terminal, pero se puede redirigir a un archivo o a otro comando.

* **stderr:** flujo a traves del cual los comandos envian mensajes de error. Por defecto, `stderr` tambien es la salida a la termianl, pero se pueden redirigir los mensajes a otro archivo.

# Caracteristicas avanzadas del interprete de comandos.

## Expansiones de terminal

Las expansiones son una caracteristica muy util que permite cambiar algo que escribis por otra cosa antes de ejecutar el comando. Aunque dicha expansion cambia el comando, este reemplazo no se muestra en la terminal de forma explicita.

* **Expansion de variables con $**

Usar `$` seguido del nombre de una variable o alias la expande y reemplaza con su valor. Esto tambien perime ejecutar comandos dentro de otros comandos. Por ejemplo:

```bash
echo "El contenido del archivo es: $(cat archivo.txt)"
```

* **Expansion con !**

El signo `!` reemplaza el texto por el ultimo comando ejecutado que comience con lo que sigue al signo de exclamacion. Esto es util para reutilizar comandos anteriores sin tener que reescribirlos. Por ejemplo:

```bash
!ls
```

* **Expansion con !!**

Expande y ejecuta el ultimo comando completo que fue ejecutado. Es muy uti cuando olvidas anteponer `sudo` a un comando que requiere permisos de root:

```bash
sudo !!
```

* **Expansion con $?**

Esta expansion reemplaza con el codigo de salida del ultimo programa ejecutado

* **Expansion con $@**

Esta variable especial expande cada argumento pasado al script como una cadena separada.

* **Proteccion de expansion con comillas simples y backslashes**

Si no queres que algo se expanda dentro de una cadena, podes usar comillas simples.

```bash
echo 'El valor de $nombre no se expandira'
```

o backslash

```bash
echo \$nombre
```

* **Operaciones aritmeticas:** bash permite realizar operaciones aritmeticas dentro de `(( ))`.


# Redireccion y pipelines

En bash, las redirecciones y los pipelines son herramientas esenciales que te permiten controlar y manipular el flujo de datos entre comandos y archivos.

**Redireccion de salida (> y >>)**

* **Sobreescritura `>`:** Al utilizar `>` despues de un comando seguido de un nombre de archivo, lo que hace es enviar todo lo que el comando imprimiria en la terminal (stdout) al archivo.

```bash
echo "Hello, World!" > saludo.txt
```

* **Sobreescritura `>`:** Al utilizar `>>` realiza una funcion similar, pero el lugar de sobreescribir, agrega el contenido al final del archivo ya existente.

```bash
echo "Hello, World Again!" >> saludo.txt
```

**Nota:** Ambos operadores crearan el archivo si no existe.
