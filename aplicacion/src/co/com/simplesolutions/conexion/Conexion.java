package co.com.simplesolutions.conexion;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {

	public Connection cargarDatos() {
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		 Connection connection = null;
		try {
        String connectionUrl =
                "jdbc:sqlserver://localhost:1433;"
                        + "database=Test;"
                        + "user=user;"
                        + "password=user;"
                        + "encrypt=true;"
                       
                        + "trustServerCertificate=true;"
                        ;

        Class.forName(driver);
		connection = DriverManager.getConnection(connectionUrl);
		
		
           System.out.println("conectado");
        }
        // Handle any errors that may have occurred.
        catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error");
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return connection; 
    }

}
