# Entrega 2: Reproducción de vídeos y servicio Web REST

**Alumno/a:** [Nombre del Alumno 1]
**Alumno/a:** [Nombre del Alumno 2]

---

# Contenido

1.  [Introducción](#introducción)
2.  [Decisiones de diseño](#decisiones-de-diseño)
3.  [Repositorios de código consultados](#repositorios-de-código-consultados)
4.  [Bibliografía consultada](#bibliografía-consultada)

---

# Introducción

Este informe describe el desarrollo y la arquitectura final de la segunda entrega del proyecto de la asignatura ISDCM. En esta fase, se ha transformado la aplicación monolítica inicial en un sistema distribuido y desacoplado, compuesto por una aplicación frontend y un servicio web RESTful independiente.

Los objetivos principales alcanzados han sido:
- Implementación de un servicio web basado en REST para la gestión de vídeos.
- Integración de búsqueda avanzada de vídeos (por título, autor y fechas dinámicas) a través de la API.
- Funcionalidad de reproducción de vídeos en el navegador con actualización automática del contador de visualizaciones.
- Desacoplamiento total del frontend respecto a la persistencia de datos de vídeos.

---

# Decisiones de diseño

## Arquitectura del Sistema
Se ha adoptado una arquitectura cliente-servidor basada en microservicios ligeros, organizada mediante un proyecto Maven multimódulo:

1.  **Módulo `LAB2-REST` (Servidor)**: 
    - Actúa como el núcleo de datos y lógica de negocio para los vídeos.
    - Utiliza **JAX-RS (Jakarta RESTful Web Services)** para exponer los recursos.
    - Implementa un patrón **DAO (Data Access Object)** para interactuar con la base de datos de forma segura mediante `PreparedStatement`.
    - La búsqueda por fecha se ha diseñado para ser dinámica, permitiendo filtrar por cualquier combinación de año, mes y día mediante la construcción programática de consultas SQL.

2.  **Módulo `LAB2-Frontend` (Cliente)**:
    - Gestiona la interfaz de usuario y la experiencia del alumno (registro de usuarios, login, etc.).
    - Para las operaciones de vídeo, delega toda la responsabilidad en el servicio REST a través del controlador `servletREST.java`.
    - Utiliza `java.net.http.HttpClient` para realizar llamadas síncronas a la API, gestionando las respuestas en formato JSON.

## API RESTful
Se han implementado los siguientes métodos HTTP para cumplir con la rúbrica y las buenas prácticas:

- **GET `/api/videos`**: Recupera la lista de vídeos. Acepta parámetros de consulta (`title`, `author`, `year`, `month`, `day`). La salida es un array JSON.
- **POST `/api/videos/{id}/play`**: Incrementa el contador de reproducciones. Se ha elegido `POST` porque la operación no es idempotente (cada llamada produce un efecto secundario incremental).
- **PUT `/api/videos/{id}`**: Permite la actualización de metadatos del vídeo (título, autor y descripción), garantizando la idempotencia requerida por el estándar REST. Se ha implementado tanto en el servicio REST como en el frontend, permitiendo una gestión completa del ciclo de vida de los datos.

## Interfaz y Reproducción
- **Reproductor HTML5**: Se ha optado por la etiqueta nativa `<video>` por su ligereza y compatibilidad universal sin necesidad de librerías externas pesadas.
- **Flujo de Navegación**: Desde `listaVideos.jsp`, el usuario selecciona un vídeo. Esto dispara una petición al `servletREST` que, a su vez, notifica al servicio REST (`POST`) antes de redirigir a la vista de reproducción (`reproduccion.jsp`), asegurando que las estadísticas sean precisas.

---

# Repositorios de código consultados

- **Eclipse Jersey Documentation**: Consultada para la configuración del contenedor de servlets y el registro de la aplicación JAX-RS.
- **Java 11 HttpClient Guide**: Referencia utilizada para implementar el consumo de la API REST desde el backend del frontend (servlets).
- **Ejemplos de Jakarta JSON Binding (JSON-B)**: Para la correcta serialización y deserialización de objetos Java a JSON.

---

# Bibliografía consultada

- **Material docente de ISDCM**: Diapositivas y guías sobre Servicios Web RESTful y arquitectura de aplicaciones web.
- **Oracle Java EE Tutorial**: Especialmente las secciones referentes a JAX-RS y servlets.
- **MDN Web Docs (HTML5 Video)**: Documentación técnica para la implementación del reproductor multimedia y manejo de formatos de vídeo.
