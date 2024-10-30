package DAO;

/**
 *
 * @author amali
 */
import Config.DBConnection;
import Modelo.Tanque;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

public class SurtidorDAO {
    
    private final Connection cnn;
    
    public SurtidorDAO() throws SQLException, NamingException {
    this.cnn = DBConnection.getConnection();
    }
    
    public void close() throws SQLException {
        if (this.cnn != null ) DBConnection.closeConnection(this.cnn);
    }
    
    public List<Tanque> getTanques() throws SQLException, NamingException {
        String query =  "{CALL obtenerDetalleProductoConNumeracion()}";
        List<Tanque> tanques = new ArrayList<>();
        try (	Connection cnn = DBConnection.getConnection();
		PreparedStatement ps = cnn.prepareStatement(query)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Tanque tanque = new Tanque(
				
                                rs.getString("descripcion"),
				rs.getFloat("numeracion_a"),							
                                rs.getFloat("numeracion_b"));

                    tanques.add(tanque);
                }
            }
        }
        return tanques;
    }
    
}
