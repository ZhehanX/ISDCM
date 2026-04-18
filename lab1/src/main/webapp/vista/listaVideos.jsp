<%@ page import="java.util.ArrayList" %>

<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect(request.getContextPath() + "/vista/login.jsp");
        return;
    }
%>

<h2>Lista de Videos</h2>

<%
    ArrayList<String[]> videos = (ArrayList<String[]>)request.getAttribute("videos");
%>

<% if (videos != null && !videos.isEmpty()) { %>

<table border="1">

    <tr>
        <th>ID</th>
        <th>Titulo</th>
        <th>Autor</th>
        <th>Fecha Creacion</th>
        <th>Duracion</th>
        <th>Reproducciones</th>
        <th>Descripcion</th>
        <th>Formato</th>
    </tr>

    <%
        for(String[] v : videos){
    %>

    <tr>
        <td><%=v[0]%></td>
        <td><%=v[1]%></td>
        <td><%=v[2]%></td>
        <td><%=v[3]%></td>
        <td><%=v[4]%></td>
        <td><%=v[5]%></td>
        <td><%=v[6]%></td>
        <td><%=v[7]%></td>
    </tr>

    <%
        }
    %>

</table>

<% } else { %>
    <p>No hay videos registrados.</p>
<% } %>

<br>

<form action="${pageContext.request.contextPath}/vista/registroVid.jsp" method="post">
    <input type="submit" value="Registrar nuevo video">
</form>

<form action="${pageContext.request.contextPath}/vista/login.jsp" method="post">
    <input type="submit" value="Logout">
</form>