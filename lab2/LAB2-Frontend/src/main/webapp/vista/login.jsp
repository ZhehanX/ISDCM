<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - VideoApp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Login de Usuarios</h2>
            <form action="${pageContext.request.contextPath}/ServletUsuarios" method="post">
                <input type="hidden" name="accion" value="login">
                
                <div class="form-group">
                    <label for="username">Usuario</label>
                    <input type="text" id="username" name="username" placeholder="Nombre de usuario" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="password" placeholder="Tu contraseña" required>
                </div>
                
                <input type="submit" value="Entrar">
            </form>
            
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/vista/registroUsu.jsp" class="btn btn-secondary">Registrar nuevo usuario</a>
            </div>
        </div>
    </div>
</body>
</html>
