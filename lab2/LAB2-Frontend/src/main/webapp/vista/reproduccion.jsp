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
    <title>Reproducción de Video</title>
</head>
<body>
    <h2>Reproduciendo Video ID: <%=id%></h2>
    
    <div style="text-align: center;">
        <video width="640" height="360" controls>
            <!-- In a real scenario, the src would be a link to the video file -->
            <source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4">
            Tu navegador no soporta el tag de video.
        </video>
    </div>

    <br>
    <form action="${pageContext.request.contextPath}/vista/busqueda.jsp" method="get">
        <input type="submit" value="Volver a Búsqueda">
    </form>
</body>
</html>
