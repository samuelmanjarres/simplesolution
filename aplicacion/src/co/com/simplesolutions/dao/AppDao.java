package co.com.simplesolutions.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JComboBox;

import co.com.simplesolutions.conexion.Conexion;

public class AppDao {
	Conexion conexion = null;
	
	public boolean registrar(String id, String name) {
		conexion = new Conexion();

		boolean res = true;
		// int resultSet = null;
		Statement ps = null;

		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "INSERT INTO App VALUES ('" + name + "')";

			ps.executeUpdate(sql);
			res = true;

		} catch (SQLException e) {
			e.printStackTrace();
			res = false;
		}

		return res;
	}

	public boolean registrarVersion(String id, String name) {
		conexion = new Conexion();

		boolean res = true;
		// int resultSet = null;
		Statement ps = null;

		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "INSERT INTO Version VALUES ('" + name + "')";

			ps.executeUpdate(sql);
			res = true;

		} catch (SQLException e) {
			e.printStackTrace();
			res = false;
		}

		return res;
	}

	public boolean registrarCiclos(String id, String name) {
		conexion = new Conexion();

		boolean res = true;
		// int resultSet = null;
		Statement ps = null;

		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "INSERT INTO Ciclos VALUES ('" + name + "')";

			ps.executeUpdate(sql);
			res = true;

		} catch (SQLException e) {
			e.printStackTrace();
			res = false;
		}

		return res;
	}

	public boolean registrarMetricas(String id, String name, Float cantidad) {
		conexion = new Conexion();

		boolean res = true;
		// int resultSet = null;
		Statement ps = null;

		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "INSERT INTO Metrica VALUES ('" + name + "', '" + cantidad + "')";

			ps.executeUpdate(sql);
			res = true;

		} catch (SQLException e) {
			e.printStackTrace();
			res = false;
		}

		return res;
	}

	public ArrayList<AppObj> ConsultarAppVersion() {
		conexion = new Conexion();
		ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		AppObj appObj = null; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "select a.Id, a.nombre, v.Id, v.nombre from App a, Version v where a.Id = v.IdApp;  ";
			

			
			resultSet = st.executeQuery(sql);
			while (resultSet.next()) {
				appObj = new AppObj(resultSet.getString(0), resultSet.getString(1), resultSet.getString(2), resultSet.getString(3));
				list.add(appObj);
				System.out.println("*****************************************"+resultSet.getString(0)+" - "+ resultSet.getString(1)+" - "+ resultSet.getString(2)+" - "+ resultSet.getString(3));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public void ConsultarNombreAPP() {
		JComboBox<String> comNombresAPP= new JComboBox<String>();
		conexion = new Conexion();
		
		

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "select nombre from APP ORDER BY nombre ASC";
			

			
			resultSet = st.executeQuery(sql);
			while (resultSet.next()) {
				comNombresAPP.addItem(resultSet.getString("nombre"));
			
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	
	}
}
