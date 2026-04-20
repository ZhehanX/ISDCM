<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado - VideoApp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Resultado de la Operación</h2>
            <div style="padding: 1.5rem; background-color: #f0fdf4; border: 1px solid #bbf7d0; border-radius: 0.5rem; color: #166534; margin-bottom: 1.5rem;">
                <%= request.getAttribute("mensaje") %>
            </div>
            
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/vista/registroVid.jsp" class="btn">Volver al menú</a>
                <a href="${pageContext.request.contextPath}/vista/login.jsp" class="btn btn-secondary">Volver al login</a>
            </div>
        </div>
    </div>
</body>
</html>
