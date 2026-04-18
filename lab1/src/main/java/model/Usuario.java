package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Usuario {

    public static boolean registrar(
            String nombre,
            String apellidos,
            String email,
            String username,
            String password) {

        try (Connection conn = DBConnection.getConnection()) {

            String check = "SELECT * FROM usuarios WHERE username=?";
            PreparedStatement ps = conn.prepareStatement(check);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return false;
            }

            String sql = "INSERT INTO usuarios (nombre, apellidos, email, username, password) VALUES (?,?,?,?,?)";

            ps = conn.prepareStatement(sql);

            ps.setString(1, nombre);
            ps.setString(2, apellidos);
            ps.setString(3, email);
            ps.setString(4, username);
            ps.setString(5, password);

            ps.executeUpdate();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static boolean login(String username, String password) {

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT * FROM usuarios WHERE username=? AND password=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}