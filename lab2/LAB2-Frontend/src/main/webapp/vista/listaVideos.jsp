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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Videos - VideoApp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Lista de Videos</h2>

            <%
                List<Video> videos = (List<Video>)request.getAttribute("videos");
            %>

            <% if (videos != null && !videos.isEmpty()) { %>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Título</th>
                            <th>Autor</th>
                            <th>Fecha</th>
                            <th>Duración</th>
                            <th>Vistas</th>
                            <th>Formato</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(Video v : videos){ %>
                        <tr>
                            <td><%=v.getId()%></td>
                            <td><strong><%=v.getTitulo()%></strong></td>
                            <td><%=v.getAutor()%></td>
                            <td><%=v.getFechaCreacion()%></td>
                            <td><%=v.getDuracion()%></td>
                            <td><%=v.getReproducciones()%></td>
                            <td><%=v.getFormato()%></td>
                            <td>
                                <div class="actions">
                                    <a href="${pageContext.request.contextPath}/servletREST?action=play&id=<%=v.getId()%>" class="btn" style="padding: 0.25rem 0.5rem; font-size: 0.8rem;">Play</a>
                                    <a href="${pageContext.request.contextPath}/servletREST?action=edit&id=<%=v.getId()%>" class="btn btn-secondary" style="padding: 0.25rem 0.5rem; font-size: 0.8rem;">Editar</a>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <% } else { %>
                <p style="color: var(--text-muted); text-align: center; padding: 2rem;">No se encontraron videos.</p>
            <% } %>

            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/vista/busqueda.jsp" class="btn">Nueva Búsqueda</a>
                <a href="${pageContext.request.contextPath}/vista/registroVid.jsp" class="btn btn-secondary">Volver al Menú</a>
                <form action="${pageContext.request.contextPath}/vista/login.jsp" method="post" style="display:inline;">
                    <input type="submit" value="Logout" class="btn btn-secondary" style="background-color: #ef4444;">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
