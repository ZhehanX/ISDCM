<h2>Resultado</h2>

<%
    String mensaje = (String)request.getAttribute("mensaje");
%>

<p><%=mensaje%></p>


<form action="${pageContext.request.contextPath}/vista/registroVid.jsp" method="post">
    <input type="submit" value="Registrar nuevo video">
</form>

<form action="${pageContext.request.contextPath}/vista/login.jsp" method="post">
    <input type="submit" value="Logout">
</form>