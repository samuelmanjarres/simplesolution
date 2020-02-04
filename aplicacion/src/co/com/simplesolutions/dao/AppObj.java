package co.com.simplesolutions.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JComboBox;

import javax.swing.JOptionPane;

import co.com.simplesolutions.conexion.Conexion;

public class AppObj {

	String id;
	String Name; 
	String idVer;
	String nameVers;
	String idCiclo;
	String nameCiclo;
	String cantidad;
	
	public AppObj(String id, String name, String idVer, String nameVers) {
		super();
		this.id = id;
		Name = name;
		this.idVer = idVer;
		this.nameVers = nameVers;
	
	}
	

	public AppObj(String id, String name) {
		super();
		this.id = id;
		Name = name;
	
	}

	public AppObj(String id, String name, String nameVers) {
		super();
		this.id = id;
		Name = name;
		this.nameVers = nameVers;
	}
	public AppObj(String nameCiclo) {
		this.nameCiclo=nameCiclo;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getIdVer() {
		return idVer;
	}
	public void setIdVer(String idVer) {
		this.idVer = idVer;
	}
	public String getNameVers() {
		return nameVers;
	}
	public void setNameVers(String nameVers) {
		this.nameVers = nameVers;
	}



	public String getIdCiclo() {
		return idCiclo;
	}



	public void setIdCiclo(String idCiclo) {
		this.idCiclo = idCiclo;
	}



	public String getNameCiclo() {
		return nameCiclo;
	}



	public void setNameCiclo(String nameCiclo) {
		this.nameCiclo = nameCiclo;
	}


	public String getCantidad() {
		return cantidad;
	}


	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	} 
	
	


}
