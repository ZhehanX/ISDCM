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
    <title>Buscar Videos</title>
</head>
<body>
    <h2>Buscar Videos</h2>
    <form action="${pageContext.request.contextPath}/servletREST" method="get">
        <input type="hidden" name="action" value="search">
        
        <label for="title">Título:</label>
        <input type="text" id="title" name="title"><br><br>
        
        <label for="author">Autor:</label>
        <input type="text" id="author" name="author"><br><br>
        
        <label>Fecha de Creación:</label><br>
        <label for="day">Día:</label>
        <input type="number" id="day" name="day" min="1" max="31">
        <label for="month">Mes:</label>
        <input type="number" id="month" name="month" min="1" max="12">
        <label for="year">Año:</label>
        <input type="number" id="year" name="year"><br><br>
        
        <input type="submit" value="Buscar">
    </form>
    
    <br>
    <form action="${pageContext.request.contextPath}/vista/registroVid.jsp" method="get">
        <input type="submit" value="Volver">
    </form>
</body>
</html>
