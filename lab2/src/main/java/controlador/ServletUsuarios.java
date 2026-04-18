package controlador;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.Usuario;

@WebServlet("/ServletUsuarios")
public class ServletUsuarios extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("registro".equals(accion)) {

            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String password2 = request.getParameter("password2");

            // Server-side validation: empty fields
            if (nombre == null ||
                apellidos == null ||
                email == null ||
                username == null ||
                password == null ||
                password2 == null ) {

                request.setAttribute("mensaje", "Todos los campos son obligatorios");
                RequestDispatcher rd = request.getRequestDispatcher("/vista/resultado.jsp");
                rd.forward(request, response);
                return;
            }

            // Validate passwords match
            if (!password.equals(password2)) {
                request.setAttribute("mensaje", "Las contraseñas no coinciden");
                RequestDispatcher rd = request.getRequestDispatcher("/vista/resultado.jsp");
                rd.forward(request, response);
                return;
            }

            boolean ok = Usuario.registrar(
                    nombre, apellidos, email, username, password);

            if (ok)
                request.setAttribute("mensaje", "Usuario registrado correctamente");
            else
                request.setAttribute("mensaje", "Error: el usuario ya existe");

            RequestDispatcher rd = request.getRequestDispatcher("/vista/resultado.jsp");
            rd.forward(request, response);
        }

        if ("login".equals(accion)) {

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Server-side validation: empty fields
            if (username == null ||
                password == null ) {

                request.setAttribute("mensaje", "Usuario y contraseña son obligatorios");
                RequestDispatcher rd = request.getRequestDispatcher("/vista/resultado.jsp");
                rd.forward(request, response);
                return;
            }

            boolean ok = Usuario.login(username, password);

            if (ok) {

                HttpSession session = request.getSession();
                session.setAttribute("usuario", username);

                response.sendRedirect(request.getContextPath() + "/vista/registroVid.jsp");
                return;

            } else {

                request.setAttribute("mensaje", "Login incorrecto");

                RequestDispatcher rd = request.getRequestDispatcher("/vista/resultado.jsp");
                rd.forward(request, response);
            }
        }
    }
}
