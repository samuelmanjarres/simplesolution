package co.com.simplesolutions.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import co.com.simplesolutions.conexion.Conexion;

public class AppDao {
	Conexion conexion = null;

	public boolean registrar(String id, String name) {
		conexion  = new Conexion(); 
		
		boolean res = true;
	//	int resultSet = null;
		Statement ps = null;
		
		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "INSERT INTO App VALUES ('"+name+"')";
			
			ps.executeUpdate(sql);
			res = true;
			

		} catch (SQLException e) {
			e.printStackTrace();
			res = false; 
		}

		return res;
	}
	
	public boolean registrarVersion(String id, String name) {
		conexion  = new Conexion(); 
		
		boolean res = true;
	//	int resultSet = null;
		Statement ps = null;
		
		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "INSERT INTO Version VALUES ('"+name+"')";
			
			ps.executeUpdate(sql);
			res = true;
			

		} catch (SQLException e) {
			e.printStackTrace();
			res = false; 
		}

		return res;
	}
	
	
	public boolean registrarCiclos(String id, String name) {
		conexion  = new Conexion(); 
		
		boolean res = true;
	//	int resultSet = null;
		Statement ps = null;
		
		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "INSERT INTO Ciclos VALUES ('"+name+"')";
			
			ps.executeUpdate(sql);
			res = true;
			

		} catch (SQLException e) {
			e.printStackTrace();
			res = false; 
		}

		return res;
	}
	
	public boolean registrarMetricas(String id, String name, Float cantidad) {
		conexion  = new Conexion(); 
		
		boolean res = true;
	//	int resultSet = null;
		Statement ps = null;
		
		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "INSERT INTO Metrica VALUES ('"+name+"', '"+cantidad+"')";
			
			ps.executeUpdate(sql);
			res = true;
			

		} catch (SQLException e) {
			e.printStackTrace();
			res = false; 
		}

		return res;
	}
}
