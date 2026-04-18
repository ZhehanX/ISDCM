# Product Requirements Document (PRD) - ISDCM Entrega 2

## 1. Overview
This document outlines the requirements and development plan for "Entrega 2" of the ISDCM Lab. The primary objective is to enhance the existing web application (from Entrega 1) by adding video playback capabilities and migrating video search and view-count update logic to a decoupled, RESTful web service.

## 2. Architecture & Strategy
As defined by the project requirements, the system will adopt a decoupled architecture:
*   **Frontend Web Application (Client):** The existing application in `LAB2` will be updated. The direct database access for video search and playback will be replaced by a controller (`servletREST.class`) that acts as a REST client. It will consume the new REST service.
*   **REST Web Service (Server):** A new Jakarta EE web application will be created within the `LAB2` workspace. This service will contain the business logic, the model (`Video.java`), and direct access to the database (`DB Sistema`).

## 3. Core Features
### 3.1. Video Playback (Frontend)
*   **Player:** Implement a video player on the frontend (`reproduccion.jsp`). A standard HTML5 `<video>` tag will be used for simplicity, though libraries like Video.js can be evaluated as an alternative.
*   **Integration:** The application must allow playing videos listed in the search results.

### 3.2. RESTful Web Service
*   **Search Operations:** Retrieve videos based on:
    *   Title
    *   Author
    *   Creation Date (supporting year, month/year, and day/month/year combinations).
*   **View Count Update:** Increment the reproduction count of a video each time it is played.
*   **Database Access:** The REST service is solely responsible for interacting with the database for video data. The frontend must not access the video tables directly for these operations.

## 4. API Design (Draft)
To satisfy the grading rubric which evaluates the use of **GET**, **POST**, and **PUT** methods, the API will be designed as follows:

*   `GET /api/videos`: Search for videos. Accepts optional query parameters (`title`, `author`, `year`, `month`, `day`). Returns JSON.
*   `POST /api/videos/{id}/play`: Increment the reproduction count for a specific video. (Action-oriented, non-idempotent).
*   `PUT /api/videos/{id}`: Update specific fields of a video (e.g., if we want to pass the exact new reproduction count or other metadata, providing an idempotent update option). 

*Note: The exact usage of POST vs PUT for the view counter will be finalized during implementation to ensure both are meaningfully used in accordance with the rubric.*

## 5. Development Plan & Milestones

### Milestone 1: Project Restructuring & REST Service Setup
*   **Task 1.1:** Restructure the `LAB2` directory to accommodate two logical components (e.g., separating the frontend app and creating a new Maven module for the REST API `LAB2-REST`).
*   **Task 1.2:** Initialize the Jakarta EE 9+ JAX-RS project for the REST service.
*   **Task 1.3:** Configure dependencies (Jersey/Resteasy, JSON binding, DB drivers).
*   **Task 1.4:** Create a basic ping endpoint (`GET /api/ping`) to verify the REST service is running.

### Milestone 2: REST API Implementation (Model & Database)
*   **Task 2.1:** Migrate or replicate the `Video` model to the REST service.
*   **Task 2.2:** Implement database connectivity (JDBC/JPA) within the REST service.
*   **Task 2.3:** Write Data Access Object (DAO) methods for:
    *   Searching videos by dynamic criteria (title, author, date parts).
    *   Updating the reproduction count of a video.

### Milestone 3: REST API Controllers (Endpoints)
*   **Task 3.1:** Implement the `GET /api/videos` endpoint with query parameter parsing for the search logic.
*   **Task 3.2:** Implement the endpoint to update the view count (using `POST` and/or `PUT` to fulfill the rubric).
*   **Task 3.3:** Test the REST API independently using tools like `curl` or Postman.

### Milestone 4: Frontend Updates (Entrega 1 modifications)
*   **Task 4.1:** Create `servletREST.java` in the frontend application to act as the HTTP client that communicates with the REST API.
*   **Task 4.2:** Refactor the search view (`busqueda.jsp` and related servlets) to route requests through `servletREST` instead of querying the DB directly.
*   **Task 4.3:** Implement the video player view (`reproduccion.jsp`).
*   **Task 4.4:** Integrate the view count update trigger when a video is played, calling the appropriate REST endpoint via the controller.

### Milestone 5: Integration, Testing & Documentation
*   **Task 5.1:** Perform end-to-end testing (search -> click video -> play -> verify DB view count updated via REST).
*   **Task 5.2:** Ensure strict separation of concerns (Frontend does not bypass REST for video operations).
*   **Task 5.3:** Draft the required report (`informe.md`/PDF) detailing:
    *   The chosen HTTP methods.
    *   Format and mechanisms of input parameters (URL query params, path variables).
    *   Output formats (JSON).
    *   Architectural decisions and any extra features implemented.
