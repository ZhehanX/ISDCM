<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect(request.getContextPath() + "/vista/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Video - VideoApp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Registrar Video</h2>

            <form action="${pageContext.request.contextPath}/ServletVideos" method="post">
                <div class="form-group">
                    <label for="titulo">Título</label>
                    <input type="text" id="titulo" name="titulo" required>
                </div>

                <div class="form-group">
                    <label for="autor">Autor</label>
                    <input type="text" id="autor" name="autor" required>
                </div>

                <div class="form-group">
                    <label for="fecha">Fecha</label>
                    <input type="date" id="fecha" name="fecha" required>
                </div>

                <div class="form-group">
                    <label>Duración</label>
                    <div class="duration-inputs">
                        <input type="number" name="duracion_horas" min="0" max="99" value="0" placeholder="HH" required> :
                        <input type="number" name="duracion_minutos" min="0" max="59" value="0" placeholder="MM" required> :
                        <input type="number" name="duracion_segundos" min="0" max="59" value="0" placeholder="SS" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <textarea id="descripcion" name="descripcion" rows="3" required></textarea>
                </div>

                <div class="form-group">
                    <label for="formato">Formato</label>
                    <input type="text" id="formato" name="formato" placeholder="Ej. mp4, avi" required>
                </div>

                <input type="submit" value="Registrar video">
            </form>

            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/ServletVideos" class="btn btn-secondary">Ver lista vídeos</a>
                <a href="${pageContext.request.contextPath}/vista/busqueda.jsp" class="btn btn-secondary">Buscar vídeos</a>
                <form action="${pageContext.request.contextPath}/vista/login.jsp" method="post" style="display:inline;">
                    <input type="submit" value="Logout" class="btn btn-secondary" style="background-color: #ef4444;">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
