package model;

import java.sql.*;
import java.util.ArrayList;

public class Video {

    public static boolean registrar(
            String titulo,
            String autor,
            String fecha,
            int duracion,
            String descripcion,
            String formato) {

        try (Connection conn = DBConnection.getConnection()) {

            // Check for duplicate video title
            String check = "SELECT * FROM videos WHERE titulo=?";
            PreparedStatement psCheck = conn.prepareStatement(check);
            psCheck.setString(1, titulo);
            ResultSet rs = psCheck.executeQuery();
            if (rs.next()) {
                return false;
            }

            String sql = "INSERT INTO videos (titulo, autor, fecha_creacion, duracion, reproducciones, descripcion, formato) VALUES (?,?,?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, titulo);
            ps.setString(2, autor);
            ps.setDate(3, Date.valueOf(fecha));
            ps.setInt(4, duracion);
            ps.setInt(5, 0);
            ps.setString(6, descripcion);
            ps.setString(7, formato);

            ps.executeUpdate();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static ArrayList<String[]> listar() {

        ArrayList<String[]> lista = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT * FROM videos";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                String[] v = new String[8];

                v[0] = rs.getString("id");
                v[1] = rs.getString("titulo");
                v[2] = rs.getString("autor");
                v[3] = rs.getString("fecha_creacion");
                v[4] = rs.getString("duracion");
                v[5] = rs.getString("reproducciones");
                v[6] = rs.getString("descripcion");
                v[7] = rs.getString("formato");

                lista.add(v);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
}