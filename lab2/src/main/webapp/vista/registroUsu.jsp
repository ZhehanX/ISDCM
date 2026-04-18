<h2>Registro Usuario</h2>

<form action="${pageContext.request.contextPath}/ServletUsuarios" method="post">

    <input type="hidden" name="accion" value="registro">

    Nombre: <input type="text" name="nombre" required><br>
    Apellidos: <input type="text" name="apellidos" required><br>
    Email: <input type="email" name="email" required><br>
    Username: <input type="text" name="username" required><br>
    Password: <input type="password" name="password" required><br>
    Repetir Password: <input type="password" name="password2" required><br>

    <input type="submit" value="Registrar">

</form>


<form action="${pageContext.request.contextPath}/vista/login.jsp" method="post">
    <input type="submit" value="Login">
</form>