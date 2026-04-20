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
    <title>Buscar Videos - VideoApp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Buscar Videos</h2>
            <form action="${pageContext.request.contextPath}/servletREST" method="get">
                <input type="hidden" name="action" value="search">
                
                <div class="form-group">
                    <label for="title">Título</label>
                    <input type="text" id="title" name="title" placeholder="Parte del título...">
                </div>
                
                <div class="form-group">
                    <label for="author">Autor</label>
                    <input type="text" id="author" name="author" placeholder="Nombre del autor...">
                </div>
                
                <div class="form-group">
                    <label>Fecha de Creación</label>
                    <div class="duration-inputs">
                        <input type="number" id="day" name="day" min="1" max="31" placeholder="Día">
                        <input type="number" id="month" name="month" min="1" max="12" placeholder="Mes">
                        <input type="number" id="year" name="year" placeholder="Año">
                    </div>
                </div>
                
                <input type="submit" value="Buscar">
            </form>
            
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/vista/registroVid.jsp" class="btn btn-secondary">Volver al Menú</a>
            </div>
        </div>
    </div>
</body>
</html>
