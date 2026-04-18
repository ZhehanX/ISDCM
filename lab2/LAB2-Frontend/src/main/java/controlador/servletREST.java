package controlador;

import com.example.frontend.model.Video;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/servletREST")
public class servletREST extends HttpServlet {

    private static final String API_URL = "http://localhost:8080/LAB2-REST/api/videos";
    private final HttpClient httpClient = HttpClient.newHttpClient();
    private final Jsonb jsonb = JsonbBuilder.create();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if ("search".equals(action)) {
            handleSearch(request, response);
        } else if ("play".equals(action)) {
            handlePlay(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void handleSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");

        StringBuilder urlBuilder = new StringBuilder(API_URL);
        urlBuilder.append("?");
        if (title != null && !title.isEmpty()) urlBuilder.append("title=").append(URLEncoder.encode(title, StandardCharsets.UTF_8)).append("&");
        if (author != null && !author.isEmpty()) urlBuilder.append("author=").append(URLEncoder.encode(author, StandardCharsets.UTF_8)).append("&");
        if (year != null && !year.isEmpty()) urlBuilder.append("year=").append(year).append("&");
        if (month != null && !month.isEmpty()) urlBuilder.append("month=").append(month).append("&");
        if (day != null && !day.isEmpty()) urlBuilder.append("day=").append(day).append("&");

        HttpRequest apiRequest = HttpRequest.newBuilder()
                .uri(URI.create(urlBuilder.toString()))
                .GET()
                .build();

        try {
            HttpResponse<String> apiResponse = httpClient.send(apiRequest, HttpResponse.BodyHandlers.ofString());
            if (apiResponse.statusCode() == 200) {
                List<Video> videos = jsonb.fromJson(apiResponse.body(), new ArrayList<Video>(){}.getClass().getGenericSuperclass());
                request.setAttribute("videos", videos);
                RequestDispatcher rd = request.getRequestDispatcher("/vista/listaVideos.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("mensaje", "Error al llamar al servicio REST: " + apiResponse.statusCode());
                request.getRequestDispatcher("/vista/resultado.jsp").forward(request, response);
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new IOException(e);
        }
    }

    private void handlePlay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de video faltante");
            return;
        }

        HttpRequest apiRequest = HttpRequest.newBuilder()
                .uri(URI.create(API_URL + "/" + id + "/play"))
                .POST(HttpRequest.BodyPublishers.noBody())
                .build();

        try {
            HttpResponse<String> apiResponse = httpClient.send(apiRequest, HttpResponse.BodyHandlers.ofString());
            if (apiResponse.statusCode() == 200) {
                response.sendRedirect(request.getContextPath() + "/vista/reproduccion.jsp?id=" + id);
            } else {
                response.sendError(apiResponse.statusCode(), "Error al registrar reproducción");
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new IOException(e);
        }
    }
}
