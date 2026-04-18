package com.example.frontend.model;

import jakarta.json.bind.annotation.JsonbProperty;
import java.io.Serializable;

public class Video implements Serializable {
    private int id;
    private String titulo;
    private String autor;
    private String fechaCreacion;
    private String duracion;
    private int reproducciones;
    private String descripcion;
    private String formato;

    public Video() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public String getAutor() { return autor; }
    public void setAutor(String autor) { this.autor = autor; }

    @JsonbProperty("fecha_creacion")
    public String getFechaCreacion() { return fechaCreacion; }
    public void setFechaCreacion(String fechaCreacion) { this.fechaCreacion = fechaCreacion; }

    public String getDuracion() { return duracion; }
    public void setDuracion(String duracion) { this.duracion = duracion; }

    public int getReproducciones() { return reproducciones; }
    public void setReproducciones(int reproducciones) { this.reproducciones = reproducciones; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public String getFormato() { return formato; }
    public void setFormato(String formato) { this.formato = formato; }
}
