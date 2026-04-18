<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultado</title>
</head>
<body>
    <h2>Resultado de la Operación</h2>
    <p><%= request.getAttribute("mensaje") %></p>
    <br>
    <a href="${pageContext.request.contextPath}/vista/registroVid.jsp">Volver al menú</a><br>
    <a href="${pageContext.request.contextPath}/vista/login.jsp">Volver al login</a>
</body>
</html>
