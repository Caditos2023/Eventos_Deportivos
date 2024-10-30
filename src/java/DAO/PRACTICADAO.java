package DAO;


 import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;

public class PRACTICADAO {
    private Connection connection;

    public PRACTICADAO(Connection connection) {
        this.connection = connection;
    }

    public void guardarCliente(String nombre, int limite_crediticio, int tolerancia) throws SQLException {
    try (CallableStatement statement = connection.prepareCall("{CALL sp_cliente(?, NULL, ?, ?, ?)}")) {
        statement.setString(1, "insert");
        statement.setString(2, nombre);
        statement.setInt(3, limite_crediticio);
        statement.setInt(4, tolerancia);
        statement.execute();
    }
}

    public void editarCliente(int idcliente, String nombre, int limite_crediticio, int tolerancia) throws SQLException {
        try (CallableStatement statement = connection.prepareCall("{CALL sp_cliente(?, ?, ?, ?, ?)}")) {
            statement.setString(1, "update");
            statement.setInt(2, idcliente);
            statement.setString(3, nombre);
            statement.setInt(4, limite_crediticio);
            statement.setInt(5, tolerancia);
            statement.execute();
        }
    }

    public void eliminarCliente(int idcliente) throws SQLException {
        try (CallableStatement statement = connection.prepareCall("{CALL sp_cliente(?, ?, NULL, NULL, NULL)}")) {
            statement.setString(1, "delete");
            statement.setInt(2, idcliente);
            statement.execute();
        }
    }
}
