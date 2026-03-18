package controlador;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import model.Video;

@WebServlet("/ServletVideos")
public class ServletVideos extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/vista/login.jsp");
            return;
        }

        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String fecha = request.getParameter("fecha");
        String horasStr = request.getParameter("duracion_horas");
        String minutosStr = request.getParameter("duracion_minutos");
        String segundosStr = request.getParameter("duracion_segundos");
        String descripcion = request.getParameter("descripcion");
        String formato = request.getParameter("formato");



        // Server-side validation: empty fields
        if (titulo == null ||
            autor == null ||
            fecha == null ||
            horasStr == null ||
            minutosStr == null ||
            segundosStr == null ||
            descripcion == null ||
            formato == null ) {


            request.setAttribute("mensaje", "Todos los campos son obligatorios");
            RequestDispatcher rd = request.getRequestDispatcher("/vista/resultado.jsp");
            rd.forward(request, response);
            return;
        }

        int horas, minutos, segundos;
        try {
            horas = Integer.parseInt(horasStr);
            minutos = Integer.parseInt(minutosStr);
            segundos = Integer.parseInt(segundosStr);
        } catch (NumberFormatException e) {
            request.setAttribute("mensaje", "La duración debe contener números válidos");
            RequestDispatcher rd = request.getRequestDispatcher("/vista/resultado.jsp");
            rd.forward(request, response);
            return;
        }

        String duracion = String.format("%02d:%02d:%02d", horas, minutos, segundos);

        boolean ok = Video.registrar(
                titulo, autor, fecha, duracion, descripcion, formato);

        if (ok)
            request.setAttribute("mensaje", "Video registrado correctamente");
        else
            request.setAttribute("mensaje", "Error: el video ya existe o hubo un error al registrar");

        RequestDispatcher rd = request.getRequestDispatcher("/vista/resultado.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/vista/login.jsp");
            return;
        }

        ArrayList<String[]> lista = Video.listar();

        request.setAttribute("videos", lista);

        RequestDispatcher rd = request.getRequestDispatcher("/vista/listaVideos.jsp");
        rd.forward(request, response);
    }
}