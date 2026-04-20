package com.example.rest.dao;

import com.example.rest.db.DBConnection;
import com.example.rest.model.Video;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VideoDAO {

    public List<Video> search(String title, String author, Integer year, Integer month, Integer day) {
        List<Video> videos = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM videos WHERE 1=1");
        
        if (title != null && !title.isEmpty()) {
            sql.append(" AND LOWER(titulo) LIKE ?");
        }
        if (author != null && !author.isEmpty()) {
            sql.append(" AND LOWER(autor) LIKE ?");
        }
        if (year != null) {
            sql.append(" AND YEAR(fecha_creacion) = ?");
        }
        if (month != null) {
            sql.append(" AND MONTH(fecha_creacion) = ?");
        }
        if (day != null) {
            sql.append(" AND DAY(fecha_creacion) = ?");
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            
            int paramIndex = 1;
            if (title != null && !title.isEmpty()) {
                ps.setString(paramIndex++, "%" + title.toLowerCase() + "%");
            }
            if (author != null && !author.isEmpty()) {
                ps.setString(paramIndex++, "%" + author.toLowerCase() + "%");
            }
            if (year != null) {
                ps.setInt(paramIndex++, year);
            }
            if (month != null) {
                ps.setInt(paramIndex++, month);
            }
            if (day != null) {
                ps.setInt(paramIndex++, day);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                videos.add(mapResultSetToVideo(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return videos;
    }

    public boolean incrementReproductions(int id) {
        String sql = "UPDATE videos SET reproducciones = reproducciones + 1 WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean update(Video video) {
        String sql = "UPDATE videos SET titulo = ?, autor = ?, descripcion = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, video.getTitulo());
            ps.setString(2, video.getAutor());
            ps.setString(3, video.getDescripcion());
            ps.setInt(4, video.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Video findById(int id) {
        String sql = "SELECT * FROM videos WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToVideo(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Video mapResultSetToVideo(ResultSet rs) throws SQLException {
        Video v = new Video();
        v.setId(rs.getInt("id"));
        v.setTitulo(rs.getString("titulo"));
        v.setAutor(rs.getString("autor"));
        v.setFechaCreacion(rs.getString("fecha_creacion"));
        v.setDuracion(rs.getString("duracion"));
        v.setReproducciones(rs.getInt("reproducciones"));
        v.setDescripcion(rs.getString("descripcion"));
        v.setFormato(rs.getString("formato"));
        return v;
    }
}
