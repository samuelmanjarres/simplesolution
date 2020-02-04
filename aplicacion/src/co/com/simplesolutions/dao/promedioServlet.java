package co.com.simplesolutions.dao;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

import co.com.simplesolutions.conexion.Conexion;

@WebServlet(urlPatterns = "/promedioServlet")
public class promedioServlet extends HttpServlet {

/*	static Conexion conexion = new Conexion();
	
	 * static ResultSet resul = null; // CallableStatement cst = null;
	 	//String idVersion = request.getParameter("idAPP"); 
			
	try
	{
		
		 * cst = conexion.cargarDatos().prepareCall("{call dbo.repo(" + idVersion +
		 * ")}"); resul = cst.executeQuery();
		 
		// cabeceras
		// las cabeceras siempre son las primeras
		for (int i = 0; i < resul.getMetaData().getColumnCount(); i++) {
			System.out.println(resul.getMetaData().getColumnClassName(i));
		}

		// como nosabemos cuantos datos pueden venir, no podemos darle un tamanio
		// presiso
		for (int i = 0; i < resul.getRow(); i++) {

			for (int j = 0; j < resul.getMetaData().getColumnCount(); j++) {
				System.out.println(resul.getString(j));

			}

		}

	}catch(
	SQLException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
*/
}
