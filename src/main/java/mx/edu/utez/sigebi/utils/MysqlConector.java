package mx.edu.utez.sigebi.utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class MysqlConector {
    final String DBNAME = "sigebi", USER = "admin", PASSWORD = "sigebiadmin", TIMEZONE = "America/Mexico_City", USESSL = "false", PUBLICKEY = "true",
            DDLAUTO = "true", HOST = "sigebidatabase.chxlqnozfdcv.us-east-1.rds.amazonaws.com";

    public Connection connect() {
        String dataSource =
                String.format("jdbc:mysql://%s:3306/%s?user=%s&password=%s&serverTimezone=%s&useSSL=%s&allowPublicKeyRetrieval=%s&createDatabaseIfNotExist= %s", HOST, DBNAME, USER, PASSWORD, TIMEZONE, USESSL, PUBLICKEY, DDLAUTO);
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            return DriverManager.getConnection(dataSource);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
