<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h2>Login de Usuarios</h2>
    <form action="${pageContext.request.contextPath}/ServletUsuarios" method="post">
        <input type="hidden" name="accion" value="login">
        Usuario: <input type="text" name="username" required><br>
        Contraseña: <input type="password" name="password" required><br>
        <input type="submit" value="Entrar">
    </form>
    <br>
    <a href="${pageContext.request.contextPath}/vista/registroUsu.jsp">Registrar nuevo usuario</a>
</body>
</html>
