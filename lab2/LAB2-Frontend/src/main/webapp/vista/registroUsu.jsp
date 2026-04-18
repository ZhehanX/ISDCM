<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuario</title>
</head>
<body>
    <h2>Registro de Nuevo Usuario</h2>
    <form action="${pageContext.request.contextPath}/ServletUsuarios" method="post">
        <input type="hidden" name="accion" value="registro">
        Nombre: <input type="text" name="nombre" required><br>
        Apellidos: <input type="text" name="apellidos" required><br>
        Email: <input type="email" name="email" required><br>
        Nombre de usuario: <input type="text" name="username" required><br>
        Contraseña: <input type="password" name="password" required><br>
        Repetir contraseña: <input type="password" name="password2" required><br>
        <input type="submit" value="Registrar">
    </form>
    <br>
    <a href="${pageContext.request.contextPath}/vista/login.jsp">Volver al login</a>
</body>
</html>
