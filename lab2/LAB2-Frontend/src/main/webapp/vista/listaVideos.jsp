<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.frontend.model.Video" %>

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
    <title>Lista de Videos</title>
</head>
<body>

<h2>Lista de Videos</h2>

<%
    List<Video> videos = (List<Video>)request.getAttribute("videos");
%>

<% if (videos != null && !videos.isEmpty()) { %>

<table border="1">

    <tr>
        <th>ID</th>
        <th>Título</th>
        <th>Autor</th>
        <th>Fecha Creación</th>
        <th>Duración</th>
        <th>Reproducciones</th>
        <th>Descripción</th>
        <th>Formato</th>
        <th>Acciones</th>
    </tr>

    <%
        for(Video v : videos){
    %>

    <tr>
        <td><%=v.getId()%></td>
        <td><%=v.getTitulo()%></td>
        <td><%=v.getAutor()%></td>
        <td><%=v.getFechaCreacion()%></td>
        <td><%=v.getDuracion()%></td>
        <td><%=v.getReproducciones()%></td>
        <td><%=v.getDescripcion()%></td>
        <td><%=v.getFormato()%></td>
        <td>
            <a href="${pageContext.request.contextPath}/servletREST?action=play&id=<%=v.getId()%>">Play</a>
        </td>
    </tr>

    <%
        }
    %>

</table>

<% } else { %>
    <p>No se encontraron videos.</p>
<% } %>

<br>

<form action="${pageContext.request.contextPath}/vista/busqueda.jsp" method="get">
    <input type="submit" value="Nueva Búsqueda">
</form>

<form action="${pageContext.request.contextPath}/vista/registroVid.jsp" method="get">
    <input type="submit" value="Volver al Menú">
</form>

<form action="${pageContext.request.contextPath}/vista/login.jsp" method="post">
    <input type="submit" value="Logout">
</form>

</body>
</html>
