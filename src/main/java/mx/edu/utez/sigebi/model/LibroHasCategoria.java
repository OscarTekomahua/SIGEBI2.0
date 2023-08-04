package mx.edu.utez.sigebi.model;

public class LibroHasCategoria {
    private int id_librohascategoria;
    private Categoria id_categoria;
    private Libro id_libro;

    public LibroHasCategoria() {

    }

    public LibroHasCategoria(int id_librohascategoria, Categoria id_categoria, Libro id_libro) {
        this.id_librohascategoria = id_librohascategoria;
        this.id_categoria = id_categoria;
        this.id_libro = id_libro;
    }

    public int getId_librohascategoria() {
        return id_librohascategoria;
    }

    public void setId_librohascategoria(int id_librohascategoria) {
        this.id_librohascategoria = id_librohascategoria;
    }

    public Categoria getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(Categoria id_categoria) {
        this.id_categoria = id_categoria;
    }

    public Libro getId_libro() {
        return id_libro;
    }

    public void setId_libro(Libro id_libro) {
        this.id_libro = id_libro;
    }
}
