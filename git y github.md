# Git y Github

Git es un software muy importante a la hora de desarrollar, ya que nos permite controlar las versiones de los archivos de nuestro proyecto. Siendo una **versión** el estado del archivo después de realizar un conjunto de cambios. 

Incluso nos permite trabajar con control de versiones de manera local, sin necesidad de estar conectado a un servidor remoto. Esto significa que podemos mantener un registro detallado y organizado de todo lo que ocurre en nuestros archivos, asegurando que cada cambio esté documentado y pueda ser recuperado en cualquier momento.

Por otro lado, Github es una **plataforma** de alojamiento de repositorios Git y colaboración en línea que **utiliza Git** como sistema de control de versiones. Permite a los desarrolladores almacenar y gestionar sus proyectos en línea, facilitando la colaboración y la integración continua. Los usuarios pueden crear repositorios remotos que pueden ser accesibles por otros miembros del equipo o por cualquier usuario en general, dependiendo de la configuración de privacidad del repositorio.

## Repositorios en Git

Un **repositorio** en Git es un espacio donde se almacena todo el historial de cambios de un proyecto. Actúa como una base de datos que contiene toda la información necesaria para reconstruir el proyecto en cualquier estado previo.

## ¿Qué es un Repositorio?

Un repositorio en Git es un contenedor que guarda el código fuente de un proyecto, junto con todos sus archivos y directorios, así como el historial de versiones de esos archivos. Existen dos tipos de repositorios en Git:

* **Repositorio local:** es la versión del repositorio que residis en tu propia computadora. Incluye todos los archivos del proyecto y el historial completo de commits. Podes realizar cambios, hacer commits y gestionar ramas localmente sin necesidad de estar conectado a un servidor remoto.
* **Repositorio remoto:** es la versión del repositorio que se encuentra en un servidor accesibles a través de Internet o una red local. Los repositorios remotos permiten colaborar con otros desarrolladores, compartir cambios y mantener una copia centralizada del proyecto. Los ejemplos más comunes incluyen plataformas como Github, Gitlab y Bitbucket.

## Seguimiento de cambios con commits en Git

### ¿Qué es un commit?

Un **commit** en Git es una instantánea del estado de los archivos en tu repositorio en un momento específico. Cuando realizas un commit, Git guarda la información sobre todos los archivos que has modificado, agregado o elimiado, junto con un mensaje descriptivo que explica los cambios realizados. Cada commit tiene un identificador único (hash) que lo distingue de otros commits en el historial.

Es muy importante que el mensaje que esté dentro del commit sea **descriptivo, claro y útil,** ya que esto ayudará a que todo aquel que participe del proyecto comprenda claramente cuál fue el cambio realizado en los archivos del mismo. 

## Colaborando en repositorios remotos

### Issues

Es una herramienta utilizada para registrar, rastrear y gestionar tareas, errores o solicitudes de nuevas funcionalidades en un proyecto. Cada issue puede contener una descripción detallada, etiquetas, asignaciones y comentarios, son útiles para organizar el trabajo, coordinar el desarrollo, alertar de errores y planificar cambios o arreglos. Generalmente se resuelven en un pull request, donde también puede marcarse su cierre.

### Pull requests (PR)

Es una solicitud para fusionar cambios de una rama (branch) a otra (generalmente la rama "main" o "master") en un repositorio remoto. Cuando creas una PR, estás pidiendo que revisen y, si es aprobado, integren los cambios que realizaste en una rama a una rama principal. Las PR permiten revisar el código, discutir los cambios y asegurarse de que son apropiados para el proyecto antes de integrar las modificaciones.

### Branches (ramas)

Nos permiten trabajar en diferentes versiones del proyecto simultáneamente. Al crear una rama, se pueden desarrollar nuevas funcionalidades o realizar cambios sin afectar a la rama principal del proyecto. Una vez que los cambios a realizar en la rama estén listos, pueden fusionarse usando un PR. Es importante utilizarlas ya que evitan interferir el trabajo de otros y desarrollar nuevos features o efectuar modificaciones de manera organizada y sin posibilidad de "romper" la rama principal.

### Merge conflicts

Ocurre cuando Git no puede fusionar automáticamente los cambios de dos ramas porque hay conflictos entre las modificaciones realizadas en cada rama. Para resolver un merge conflict, necesitas abrir el archivo en conflicto en un editor de texto y resolver manualmente las diferencias entre las versiones en conflicto. Esto implica decidir qué cambios mantener, qué cambios descartar y cómo combinar los cambios de manera coherente.

## Archivos `.gitignore`

Un archivo `.gitignore` es un archivo especial en un repositorio que se utiliza para especificar patrones de archivos o directorios que Git debe ignorar. Esto significa que los archivos y directorios que coincidan con los patrones con los patrones especificados en el archivo `.gitignore` no se incluirán en los cambios que Git rastrea o en los commits que se realizan en el repositorio.

## Estados de un archivo

El concepto de "estados" se refiere a las diferentes etapas en las que puede encontrarse un archivo a medida que se trabaja en un repositorio.

1. **Untracked (No Rastreado)**
El archivo está en el directorio de trabajo, pero Git no lo está siguiendo. Es decir, Git no tiene conocimiento de este archivo y no está incluido en el historial del repositorio.

2. **Tracked (Rastreado)**
El archivo fue añadido al repositorio en un commit. Git lo está siguiendo y su estado puede ser:
     * *Unmodified (Sin Modificar):* el archivo ha sido rastrado previamente y no se han realizado cambios desde el último commit.
     * *Modified (Modificado):* el archivo ha sido cambiado después del último commit. Los cambios aún no han sido añadidos al staging area.
     * *Staged (En Área de Staging):* el archivo ha sido modificado y sus cambios han sido añadidos al área de staging (preparado para el próximo commit).

3. **Staged (En Área de Staging)**
El archivo está en el área de staging, lo que significa que los cambios han sido preparados para ser incluidos en el próximo commit. Es decir, Git ha marcado los cambios para que se incluyan en el historial del repositorio.

## Transición entre Estados
* De **Untracked** a **Staged**:
`git add` para añadir archivos no rastreados al área de staging.

* De **Modified** a **Staged**:
`git add` para añadir los cambios en archivos modificados al área de staging.

* De **Staged** a **Committed**:
`git commit` para hacer un commit de los archivos en el área de staging. Esto confirma los cambios en el repositorio.

* De **Staged** a **Unstaged**:
`git reset` para retirar archivos del área de staging, devolviéndolos al estado de modificados.

## Comandos básicos de Git por tema

1. *Configuración Inicial*

* `git config --global user.name "Tu Nombre"`: Configura tu nombre de usuario de manera global.
* `git config --global user.email "tu.email@dominio.com"`: Configura tu correo electrónico globalmente.
* `git config --list`: Muestra la configuración actual.

2. *Inicialización de Repositorio*

* `git init`: Inicializa un nuevo repositorio Git en el directorio actual.

3. *Rastrear Archivos*

* `git add <archivo>`: Añade un archivo al staging area.
* `git add .`: Añade todos los archivos al staging area.
* `git status`: Muestra el estado de los archivos en el repositorio (rastreado, modificados, en staging, etc.).
* `git rm --cached <archivo>`: Elimina un archivo del área de staging sin eliminarlo del directorio de trabajo.

4. *Stash (Guardar Cambios Temporales)*

* `git stash`: Guarda los cambios no confirmados temporalmente.
* `git stash -u`: Guarda los cambios no confirmados y archivos no rastreados.
* `git stash list`: Muestra la lista de stashes guardados.
* `git stash apply`: Aplica el último stash guardado sin eliminarlo de la lista.
* `git stash pop`: Aplica el último stash y lo elimina de la lista.
* `git stash drop`: Elimina el último stash guardado.
* `git stash clear`: Elimina todos los stashes guardados.

5. *Confirmación de Cambios (Commits)*

* `git commit -m "<mensaje>"`: Guarda los cambios en el repositorio con un mensaje descriptivo.
* `git commit --amend`: Modifica el último commit realizado.

6. *Historial*

* `git log`: Muestra el historial de commits.
* `git log --oneline`: Muestra el historial de commits en una sola línea por commit.

7. *Sincronización con Repositorios Remotos*

* `git remote add origin <url>`: Asocia el repositorio local con uno remoto.
* `git push origin <nombre-rama>`: Sube los cambios locales en la rama actual al repositorio remoto.
* `git pull origin <nombre-rama>`: Trae los cambios de una rama remota al local y los fusiona.

8. *Ramas (Branches)*

* `git branch`: Muestra las ramas actuales.
* `git branch <nombre-rama>`: Crea una nueva rama.
* `git checkout <nombre-rama>`: Cambia a una rama diferente.
* `git checkout -b <nombre-rama>`: Crea y cambia a una nueva rama.
* `git merge <nombre-rama>`: Fusiona la rama especificada con la rama actual. (Por ejemplo, el main con la branch actual)
* `git branch --set-upstream-to=origin/<rama>`: Establece la rama remota de seguimiento para la rama actual.

9. *Restaurar Cambios (Restore)*

* `git restore <archivo>`: Deshace los cambios locales no confirmados en el archivo, restaurándolo a la versión del último commit.
* `git restore --staged <archivo>`: Quita un archivo del área de preparación sin perder los cambios locales.
* `git restore --source=<commit> <archivo>`: Restaura un archivo a su estado en un commit específico.
* `git restore .`: Deshace los cambios no confirmados en todos los archivos del directorio actual.

10. *Deshacer Cambios*

* `git reset <archivo>`: Elimina un archivo del área de preparación.
* `git reset --hard`: Revierte el repositorio al último commit, descartando todos los cambios.
* `git checkout -- <archivo>`: Deshace los cambios en un archivo que aún no ha sido añadido al área de preparación.

11. *Clonación*

* `git clone <url>`: Clona un repositorio remoto en el directorio local.

12. *Etiquetas (Tags)*

* `git tag <nombre-etiqueta>`: Crea una nueva etiqueta.
* `git tag`: Muestra todas las etiquetas.
* `git push origin <nombre-etiqueta>`: Sube una etiqueta al repositorio remoto.

13. *Ver Cambios*

* `git diff`: Muestra las diferencias entre los archivos modificados pero no preparados para commit.
* `git diff --staged`: Muestra las diferencias entre los archivos preparados para commit y el último commit.
