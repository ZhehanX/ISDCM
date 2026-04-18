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
    <title>Registrar Video</title>
</head>
<body>

<h2>Registrar Video</h2>

<form action="${pageContext.request.contextPath}/ServletVideos" method="post">

    Título:
    <input type="text" name="titulo" required><br>

    Autor:
    <input type="text" name="autor" required><br>

    Fecha:
    <input type="date" name="fecha" required><br>

    Duración:<br>
    Horas: <input type="number" name="duracion_horas" min="0" max="99" value="0" required>
    Minutos: <input type="number" name="duracion_minutos" min="0" max="59" value="0" required>
    Segundos: <input type="number" name="duracion_segundos" min="0" max="59" value="0" required><br>

    Descripción:
    <input type="text" name="descripcion" required><br>

    Formato:
    <input type="text" name="formato" required><br>

    <input type="submit" value="Registrar video">

</form>

<br>
<form action="${pageContext.request.contextPath}/ServletVideos" method="get">
    <input type="submit" value="Ver lista vídeos">
</form>

<form action="${pageContext.request.contextPath}/vista/busqueda.jsp" method="get">
    <input type="submit" value="Buscar vídeos">
</form>

<form action="${pageContext.request.contextPath}/vista/login.jsp" method="post">
    <input type="submit" value="Logout">
</form>

</body>
</html>
