<h2>Login</h2>

<form action="${pageContext.request.contextPath}/ServletUsuarios" method="post">

    <input type="hidden" name="accion" value="login">

    Usuario:
    <input type="text" name="username" required><br>

    Password:
    <input type="password" name="password" required><br>

    <input type="submit" value="Login">

</form>

<form action="${pageContext.request.contextPath}/vista/registroUsu.jsp" method="post">
    <input type="submit" value="Registrar usuario">
</form>