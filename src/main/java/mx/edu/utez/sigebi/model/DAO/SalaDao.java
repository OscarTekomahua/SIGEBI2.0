package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Editorial;
import mx.edu.utez.sigebi.model.Sala;
import mx.edu.utez.sigebi.utils.MysqlConector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SalaDao implements DaoSala {
    private Connection con;
    private List<Sala> listaSalas;
    private Sala sala;
    private boolean resp;

    public SalaDao() {
        this.con = new MysqlConector().connect();
        this.listaSalas = new ArrayList<>();
        this.sala = new Sala();
        this.resp = false;
    }

    @Override
    public List<Sala> findAll() {
        List<Sala> listadesalas = new ArrayList<>();
        String estadoTexto = "";
        try {
            String query = "SELECT * FROM sala";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int idSala = rs.getInt("id_sala");
                String nombreSala = rs.getString("nombre");
                int capacidad = rs.getInt("capacidad_maxima");
                String img = rs.getString("imagen");
                boolean estado = rs.getBoolean("estado");

                if (estado == true) {
                    estadoTexto = "Disponible";
                } else {
                    estadoTexto = "Ocupada";
                }

                Sala sala = new Sala(idSala, nombreSala, capacidad, img, estado, estadoTexto);
                listadesalas.add(sala);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return listadesalas;
    }

    @Override
    public boolean update(int id_sala, Object object) {
        return false;
    }

}
