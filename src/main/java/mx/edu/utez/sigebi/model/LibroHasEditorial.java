package mx.edu.utez.sigebi.model;

public class LibroHasEditorial {
    private int id_librohaseditorial;
    private Editorial id_editorial;
    private Libro id_libro;

    public LibroHasEditorial() {

    }

    public LibroHasEditorial(int id_librohaseditorial, Editorial id_editorial, Libro id_libro) {
        this.id_librohaseditorial = id_librohaseditorial;
        this.id_editorial = id_editorial;
        this.id_libro = id_libro;
    }

    public int getId_librohaseditorial() {
        return id_librohaseditorial;
    }

    public void setId_librohaseditorial(int id_librohaseditorial) {
        this.id_librohaseditorial = id_librohaseditorial;
    }

    public Editorial getId_editorial() {
        return id_editorial;
    }

    public void setId_editorial(Editorial id_editorial) {
        this.id_editorial = id_editorial;
    }

    public Libro getId_libro() {
        return id_libro;
    }

    public void setId_libro(Libro id_libro) {
        this.id_libro = id_libro;
    }
}
