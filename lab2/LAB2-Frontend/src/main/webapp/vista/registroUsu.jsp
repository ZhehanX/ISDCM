<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - VideoApp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Registro de Nuevo Usuario</h2>
            <form action="${pageContext.request.contextPath}/ServletUsuarios" method="post">
                <input type="hidden" name="accion" value="registro">
                
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" id="nombre" name="nombre" required>
                </div>
                
                <div class="form-group">
                    <label for="apellidos">Apellidos</label>
                    <input type="text" id="apellidos" name="apellidos" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="username">Nombre de usuario</label>
                    <input type="text" id="username" name="username" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <div class="form-group">
                    <label for="password2">Repetir contraseña</label>
                    <input type="password" id="password2" name="password2" required>
                </div>
                
                <input type="submit" value="Registrar">
            </form>
            
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/vista/login.jsp" class="btn btn-secondary">Volver al login</a>
            </div>
        </div>
    </div>
</body>
</html>
