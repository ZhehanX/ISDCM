# Informe Técnico — LAB 2: Aplicación Web Decoplada con Servicios REST

**Asignatura:** ISDCM  
**Fecha:** 18 de abril de 2026

---

## 1. Introducción

En esta segunda entrega del LAB 2, se ha evolucionado la aplicación de gestión de vídeos hacia una arquitectura desacoplada. El objetivo principal ha sido migrar la lógica de búsqueda y actualización de vídeos a un servicio web RESTful independiente, eliminando el acceso directo a la base de datos por parte de la aplicación frontend para estas operaciones.

Además, se ha incorporado la funcionalidad de reproducción de vídeos mediante el uso de etiquetas estándar HTML5 y la actualización automática del contador de reproducciones.

---

## 2. Arquitectura del Sistema

El sistema se ha dividido en dos módulos Maven diferenciados bajo un proyecto padre:

1.  **`LAB2-Frontend`**: Aplicación web que actúa como cliente. Gestiona la interfaz de usuario (JSPs), la autenticación de usuarios y el registro de nuevos vídeos (manteniendo la lógica de la Entrega 1 para el registro). Para la búsqueda y reproducción, consume el servicio REST.
2.  **`LAB2-REST`**: Servicio web Jakarta EE que expone una API RESTful para la gestión de datos de vídeos. Es el único componente con acceso a las tablas de vídeos para búsqueda y actualización de contadores.

---

## 3. Servicio Web REST (`LAB2-REST`)

Implementado utilizando **JAX-RS (Jakarta RESTful Web Services)** y **JSON-B (Jakarta JSON Binding)** para la serialización.

### 3.1 Endpoints de la API

| Método | Endpoint | Descripción | Parámetros |
|---|---|---|---|
| **GET** | `/api/videos` | Búsqueda dinámica de vídeos. | `title`, `author`, `year`, `month`, `day` (Query Params) |
| **POST** | `/api/videos/{id}/play` | Incrementa el contador de reproducciones. | `id` (Path Variable) |
| **PUT** | `/api/videos/{id}` | Actualización de metadatos del vídeo. | `id` (Path Variable) + JSON Body |

### 3.2 Decisiones Técnicas en el Servicio

- **Búsqueda Dinámica**: Se ha implementado un DAO (`VideoDAO`) que construye la consulta SQL de forma dinámica en función de los parámetros recibidos, permitiendo filtrar por fragmentos del título, autor o partes específicas de la fecha (año, mes, día).
- **Serialización JSON**: Se utiliza JSON-B para transformar automáticamente los objetos `Video` en formato JSON. Se ha empleado la anotación `@JsonbProperty("fecha_creacion")` para mapear correctamente los campos de la base de datos a los estándares de nomenclatura de Java.

---

## 4. Aplicación Frontend (`LAB2-Frontend`)

### 4.1 Cliente REST (`servletREST.java`)

Se ha creado un nuevo controlador, `servletREST.java`, que centraliza todas las comunicaciones con el servicio API. Utiliza la clase `java.net.http.HttpClient` (introducida en Java 11) para realizar peticiones asíncronas y síncronas de forma eficiente.

- **Mecanismo de Búsqueda**: El servlet captura los parámetros del formulario de `busqueda.jsp`, construye la URL con los query parameters codificados y solicita los datos al servicio REST.
- **Procesamiento de Respuesta**: El servlet recibe el JSON, lo deseriaiza en una lista de objetos `Video` (utilizando JSON-B en el lado del cliente) y los envía a la vista `listaVideos.jsp`.

### 4.2 Reproducción de Vídeo (`reproduccion.jsp`)

La vista de reproducción integra un reproductor HTML5:
- Al hacer clic en "Play" en la lista de vídeos, se invoca a `servletREST` con la acción `play`.
- El servlet realiza una petición **POST** al servicio REST para incrementar el contador en la DB.
- Tras la confirmación del servicio, se redirige al usuario a `reproduccion.jsp`, donde se muestra el vídeo.

---

## 5. Formato de Intercambio de Datos

Se ha estandarizado el uso de **JSON** para todas las comunicaciones entre el frontend y el backend:

- **Entrada (Búsqueda)**: Query parameters en la URL.
- **Salida (Búsqueda)**: Array de objetos JSON con la estructura del modelo `Video`.
- **Actualización**: El método PUT acepta un objeto JSON completo representando el nuevo estado del recurso.

---

## 6. Conclusiones y Cumplimiento de Rúbrica

Esta entrega cumple con todos los requisitos técnicos exigidos:
- **Uso de métodos HTTP**: Se emplean GET (lectura), POST (acción no idempotente de incrementar contador) y PUT (actualización).
- **Desacoplamiento**: El frontend no tiene conocimiento de la base de datos de vídeos para las funciones de búsqueda y reproducción.
- **Integración REST**: Uso de JAX-RS, JSON-B y HttpClient.
- **Funcionalidad**: Búsqueda avanzada por fecha y reproducción funcional.
