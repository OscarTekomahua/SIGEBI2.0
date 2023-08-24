package mx.edu.utez.sigebi.model;

public class ResultadosConsulta {
    private int id_libro;
    private String isbn;
    private String titulo;
    private String autor;
    private String editorial;
    private String categoria;
    private int ejemplares;
    private String imagen;

    public ResultadosConsulta() {

    }

    public ResultadosConsulta(int id_libro, String isbn, String titulo, String autor, String editorial, String categoria, int ejemplares, String imagen) {
        this.id_libro = id_libro;
        this.isbn = isbn;
        this.titulo = titulo;
        this.autor = autor;
        this.editorial = editorial;
        this.categoria = categoria;
        this.ejemplares = ejemplares;
        this.imagen = imagen;
    }

    public int getId_libro() {
        return id_libro;
    }

    public void setId_libro(int id_libro) {
        this.id_libro = id_libro;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
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

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getEjemplares() {
        return ejemplares;
    }

    public void setEjemplares(int ejemplares) {
        this.ejemplares = ejemplares;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }


    public ResultadosConsulta(int id_libro, String isbn, String titulo, String autor, int ejemplares) {
        this.id_libro = id_libro;
        this.isbn = isbn;
        this.titulo = titulo;
        this.autor = autor;
        this.ejemplares = ejemplares;
    }


}