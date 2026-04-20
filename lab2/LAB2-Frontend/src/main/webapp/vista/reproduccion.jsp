<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect(request.getContextPath() + "/vista/login.jsp");
        return;
    }
    String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reproducción - VideoApp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Reproduciendo Video ID: <%=id%></h2>
            
            <div class="video-container">
                <video controls>
                    <source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4">
                    Tu navegador no soporta el tag de video.
                </video>
            </div>

            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/vista/busqueda.jsp" class="btn">Volver a Búsqueda</a>
                <a href="${pageContext.request.contextPath}/vista/registroVid.jsp" class="btn btn-secondary">Volver al Menú</a>
            </div>
        </div>
    </div>
</body>
</html>
