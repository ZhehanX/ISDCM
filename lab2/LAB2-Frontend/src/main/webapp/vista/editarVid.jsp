<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.frontend.model.Video" %>

<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect(request.getContextPath() + "/vista/login.jsp");
        return;
    }
    Video v = (Video) request.getAttribute("video");
    if (v == null) {
        response.sendRedirect(request.getContextPath() + "/vista/busqueda.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Video - VideoApp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Editar Metadatos del Vídeo</h2>

            <form action="${pageContext.request.contextPath}/servletREST" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= v.getId() %>">

                <div class="form-group">
                    <label for="titulo">Título</label>
                    <input type="text" id="titulo" name="titulo" value="<%= v.getTitulo() %>" required>
                </div>

                <div class="form-group">
                    <label for="autor">Autor</label>
                    <input type="text" id="autor" name="autor" value="<%= v.getAutor() %>" required>
                </div>

                <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <textarea id="descripcion" name="descripcion" rows="4" required><%= v.getDescripcion() %></textarea>
                </div>

                <input type="submit" value="Actualizar Datos">
            </form>

            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/vista/busqueda.jsp" class="btn btn-secondary">Cancelar</a>
            </div>
        </div>
    </div>
</body>
</html>
