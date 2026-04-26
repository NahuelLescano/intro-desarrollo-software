# Ingeniera de Software

## ¿Qué es la Ingeniería?

En términos generales, se puede definir como el "estudio y aplicación de tecnología", entendida como la suma de técnicas, habilidades, métodos y procesos utilizados para producir bienes, servicios o alcanzar objetivos.

La ingeniería aplica conocimientos científicos, técnicos y empíricos a acciones como la invención, diseño, desarrollo, construcción, optimización y mantenimiento de sistemas, estructuras, procesos y materiales con el fin de resolver problemas prácticos.

## ¿Qué es el Software?

Según el estándar **IEEE 729**, el software es el conjunto de programas de cómputo, procedimientos, reglas, documentación y datos asociados que forman parte de la operación de un sistema de computación.

## ¿Qué es la Ingeniería de Software?

Es la aplicación de la ingeniería al proceso completo de creación de software. Va desde que se identifica una necesidad hasta el despliegue y mantenimiento del sistema.

- Incluye:
    * Comprensión de la necesidad.
    * Organización del desarrollo.
    * Diseño del software.
    * Implementación.
    * Pruebas y validación.
    * Despliegue.
    * Mantenimiento.

Actualmente, la ingeniería de software se concibe como un proceso **iterativo e incremental.**

- Importancia:
    * Gobiernos y empresas dependen de sistemas de software.
    * Sistemas críticos deben ser robustos y tolerantes a fallos.
    * Se requieren sistemas que puedan ser mantenidos y escalados con facilidad.

# Etapas de la Ingeniería de Software

1. **Análisis de Requerimientos**

Su objetivo es **entender qué necesita el cliente o el usuario final**. Esto permite construir el producto adecuado en lugar de simplemente construir bien un producto que no sirve.

- **Preguntas claves:**
    * ¿Cuál es el objetivo del sistema?
    * ¿Cómo se adaptará a las necesidades del usuario?
    * ¿Cómo se utilizará?

- **Actividades de ingeniería de requerimientos:**
    * Indagación.
    * Negociación.
    * Especificación.
    * Validación.

- **Objetivos:**
    * Describir qué quiere el cliente.
    * Establecer la base del diseño.
    * Definir requerimientos verificables.

- **Requerimientos funcionales y no funcionales**
    * **Requerimientos funcionales:** especifican **lo que el sistema debe hacer**. Incluyen funcionalidades, servicios y tareas que el software debe realizar.
    * **Requerimientos no funcionales:** describen **cómo debe comportarse el sistema**, incluyendo restricciones y propiedades de calidad.

2. **Diseño**

A partir de los requerimientos funcionales y no funcionales, se escoge la arquitectura de software más adecuada.

3. **Implementación**

Consiste en transformar los requerimientos en un producto funcional mediante la escritura de código.

4. **Testing y Validación**

- Objetivos:
    * *Validación:* demostrar que el software cumple los requerimientos del cliente.
    * *Verificación:* encontrar errores de funcionamiento.

- Tipos de pruebas:
    * *Pruebas unitarias:* verifican el correcto funcionamiento de componentes o funciones individuales del software.
    * *Pruebas de integración:* evalúan la interacción entre varios módulos o componentes.
    * *Pruebas de aceptación del usuarios (AUT):* realizadas por los usuarios finales para validar que el sistema cumple con sus expectativas.
    * *Pruebas de usabilidad*: evalúan la experiencia del usuario, accesibilidad navegabilidad y faciilidad de uso del sistema.

5. **Despliegue**

El software pasa por diferentes entornos antes de llegar a producción:

* *Development (desarrollo):* ambiente donde los programadores escriben y prueban su código de manera inicial.
* *QA (aseguramiento de calidad):* entorno donde se realizan pruebas exhaustivas para detectar errores de liberar el sistema.
* *Prepoducción / Staging:* replica el entorno de producción y se utiliza para poder realizar validaciones finales antes del lanzamiento.
* *Producción:* entorno donde el software está disponible para los usuarios finales. Debe estar estable, seguro y supervisado.

6. **Mantenimiento**

Una vez desplegado, el software sigue evolucionando:

* Surgen nuevos requerimientos.
* Se descubren errores.
* Cambia el negocio o el contexto.
