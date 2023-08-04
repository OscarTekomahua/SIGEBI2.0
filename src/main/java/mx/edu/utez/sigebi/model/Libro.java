package mx.edu.utez.sigebi.model;

import java.io.Serializable;

public class Libro implements Serializable {
    private int id_libro;
    private String titulo;
    private String autor;
    private int ejemplares;
    private String isbn;
    private String imagen;

    public Libro() {
    }

    public Libro(int id_libro, String titulo, String autor, int ejemplares, String isbn, String imagen) {
        this.id_libro = id_libro;
        this.titulo = titulo;
        this.autor = autor;
        this.ejemplares = ejemplares;
        this.isbn = isbn;
        this.imagen = imagen;
    }
    public Libro( String titulo, String autor, int ejemplares, String isbn, String imagen) {

        this.titulo = titulo;
        this.autor = autor;
        this.ejemplares = ejemplares;
        this.isbn = isbn;
        this.imagen = imagen;
    }

    public int getId_libro() {
        return id_libro;
    }

    public void setId_libro(int id_libro) {
        this.id_libro = id_libro;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public int getEjemplares() {
        return ejemplares;
    }

    public void setEjemplares(int ejemplares) {this.ejemplares = ejemplares;}

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

}
