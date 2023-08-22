package mx.edu.utez.sigebi.model.DAO;

import mx.edu.utez.sigebi.model.Sala;
import mx.edu.utez.sigebi.model.SalaConsulta;
import mx.edu.utez.sigebi.utils.MysqlConector;
import java.sql.*;
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
    public void update(int id_sala, boolean updatedStatus) {
        try {
            String query = "UPDATE sala SET estado = ? WHERE id_sala = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setBoolean(1, updatedStatus);
            stmt.setInt(2, id_sala);

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<SalaConsulta> salasBiblio() {
        List<SalaConsulta> salas = new ArrayList<>();

        try {
            String query = "SELECT s.nombre AS sala_nombre,s.capacidad_maxima AS sala_capacidad,p.hora_inicio,p.hora_fin,p.estado AS prestamo_estado,p.extras,per.nombres AS usuario_nombres,per.apellido1 AS usuario_apellido1,per.apellido2 AS usuario_apellido2 FROM prestamosala p JOIN sala s ON p.id_sala = s.id_sala JOIN usuario u ON p.id_usuario = u.id_usuario JOIN persona per ON u.id_persona = per.id_persona";
            PreparedStatement statement = con.prepareStatement(query);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String salaname = resultSet.getString("sala_nombre");
                int capacidad = resultSet.getInt("sala_capacidad");
                String username = resultSet.getString("usuario_nombres");
                String apellidoP = resultSet.getString("usuario_apellido1");
                String apellidoM = resultSet.getString("usuario_apellido2");
                String estado = resultSet.getString("prestamo_estado");
                String horaInicio = resultSet.getString("hora_inicio");
                String horaFin = resultSet.getString("hora_fin");
                String extras = resultSet.getString("extras");

                SalaConsulta salaConsulta = new SalaConsulta(salaname, capacidad, username, apellidoP, apellidoM, estado, horaInicio, horaFin, extras);
                salas.add(salaConsulta);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return salas;

    }

    public List<SalaConsulta> disponibilidadSalas() {
        List<SalaConsulta> disponibilidadSalas = new ArrayList<>();

        try {
            String query = "SELECT * FROM vista_salas_reservadas_prestadas";
            PreparedStatement statement = con.prepareStatement(query);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String nombreSala = resultSet.getString("nombre_sala");
                String salaState = resultSet.getString("estado");
                String horadeInicio = resultSet.getString("hora_inicio");
                String horadeFin = resultSet.getString("hora_fin");

                SalaConsulta salas = new SalaConsulta(nombreSala, 0, "", "", "", salaState, horadeInicio, horadeFin, "");
                disponibilidadSalas.add(salas);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return  disponibilidadSalas;
    }

}
