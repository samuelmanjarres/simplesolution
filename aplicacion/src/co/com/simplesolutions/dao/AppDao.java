package co.com.simplesolutions.dao;

import java.awt.List;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.concurrent.Callable;
import java.sql.CallableStatement;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JComboBox;

import co.com.simplesolutions.conexion.Conexion;

public class AppDao {
	Conexion conexion = null;
	
	//Permite el registro o la inserción de las aplicaciones
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

	//Permite el registro o la inserción de las versiones de cada una de las aplicaciones. Las cuales aparecen en un select.
	public boolean registrarVersion(String idApp, String name) {
		conexion = new Conexion();

		boolean res = true;
		// int resultSet = null;
		Statement ps = null;

		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "INSERT INTO Version VALUES ('" + name + "', "+idApp+")";

			ps.executeUpdate(sql);
			res = true;

		} catch (SQLException e) {
			e.printStackTrace();
			res = false;
		}

		return res;
	}

	//Permite el registro o la inserción de los ciclos de prueba. Estos se crean de acuerdo a la aplicación y su versión.
	public boolean registrarCiclos(String IdVersion, String name) {
		conexion = new Conexion();

		boolean res = true;
		// int resultSet = null;
		Statement ps = null;

		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "INSERT INTO Ciclos VALUES ('" + name + "',"+IdVersion+")";

			ps.executeUpdate(sql);
			res = true;

		} catch (SQLException e) {
			e.printStackTrace();
			res = false;
		}

		return res;
	}

	//Permite el registro o la inserción de las métricas de cada APP con su versión y ciclo de prueba.
	public boolean registrarMetricas(String IdCiclos, String nameMetrica, String cantidad) {
		conexion = new Conexion();

		boolean res = true;
		// int resultSet = null;
		Statement ps = null;

		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "INSERT INTO Metrica VALUES ('" + nameMetrica + "', '" + cantidad + "', "+IdCiclos+")";

			ps.executeUpdate(sql);
			res = true;

		} catch (SQLException e) {
			e.printStackTrace();
			res = false;
		}

		return res;
	}
	
	
	
		
//Consulta una lista de las aplicaciones mediante un select. Esta lista está en la ventana de inserción de versiones
	public ArrayList<AppObj> ConsultarAppVersion() {
		conexion = new Conexion();
		ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		AppObj appObj = null; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "select IdApp, nombreApp from App;  ";
			

			
			resultSet = st.executeQuery(sql);
			while (resultSet.next()) {
				appObj = new AppObj(resultSet.getString(1), resultSet.getString(2));
				list.add(appObj);
				System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	//Consulta una lista de las aplicaciones mediante un select. Esta lista está en la ventana de inserción de ciclos
	public ArrayList<AppObj> ConsultarAppCiclos() {
		conexion = new Conexion();
		ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		AppObj appObj = null; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "select IdApp, nombreApp from App;  ";
			

			
			resultSet = st.executeQuery(sql);
			while (resultSet.next()) {
				appObj = new AppObj(resultSet.getString(1), resultSet.getString(2));
				list.add(appObj);
				System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	//Consulta una lista de las aplicaciones mediante un select. Esta lista está en la ventana de inserción de ciclos
		public ArrayList<AppObj> ConsultarAppResumen() {
			conexion = new Conexion();
			ArrayList<AppObj> list = new ArrayList<AppObj>(); 
			AppObj appObj = null; 

			ResultSet resultSet = null;
			Statement st = null;

			try {
				st = conexion.cargarDatos().createStatement();
				
				String sql = "select IdApp, nombreApp from App;  ";
				

				
				resultSet = st.executeQuery(sql);
				while (resultSet.next()) {
					appObj = new AppObj(resultSet.getString(1), resultSet.getString(2));
					list.add(appObj);
					System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2));
					
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return list;
		}


	//Consulta una lista de las versiones mediante un select. Esta lista está en la ventana de inserción de ciclos
	public ArrayList<AppObj> ConsultarVersionesCiclos() {
		conexion = new Conexion();
		ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		AppObj appObj = null; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "select IdVersion, nombreVersion from Version;  ";
			

			
			resultSet = st.executeQuery(sql);
			while (resultSet.next()) {
				appObj = new AppObj(resultSet.getString(1), resultSet.getString(2));
				list.add(appObj);
				System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	//Consulta una lista de las versiones mediante un select. Esta lista está en la ventana de inserción de ciclos
	public ArrayList<AppObj> ConsultarVersionesResumen() {
		conexion = new Conexion();
		ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		AppObj appObj = null; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "select IdVersion, nombreVersion from Version;  ";
			

			
			resultSet = st.executeQuery(sql);
			while (resultSet.next()) {
				appObj = new AppObj(resultSet.getString(1), resultSet.getString(2));
				list.add(appObj);
				System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	//Consulta una lista de los ciclos mediante un select. Esta lista está en la ventana de inserción de métricas
	public ArrayList<AppObj> ConsultarCiclosMetricas() {
		conexion = new Conexion();
		ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		AppObj appObj = null; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "select IdCiclo, nombreCiclo from Ciclos;  ";
			

			
			resultSet = st.executeQuery(sql);
			while (resultSet.next()) {
				appObj = new AppObj(resultSet.getString(1), resultSet.getString(2));
				list.add(appObj);
				System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	

	//Muestra en una caja de texto la ID de la aplicación, generada automáticamente por la DB
	public String ConsultarIdAPP() {
		conexion = new Conexion();
		//ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		//AppObj appObj = null; 
		String res = ""; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "SELECT TOP 1 a.IdApp from App a order by a.IdApp desc;";
			

			
			resultSet = st.executeQuery(sql);
			if (resultSet.next()) {
				res = ""+ (Integer.parseInt(resultSet.getString(1)) + 1); 
				
				
			}else {
				res = "1"; 
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}
	
	//Muestra en una caja de texto la ID de la versión, generada automáticamente por la DB
	public String ConsultarIdVersion() {
		conexion = new Conexion();
		//ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		//AppObj appObj = null; 
		String res = ""; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "SELECT TOP 1 v.IdVersion from Version v order by v.IdVersion desc;";
			

			
			resultSet = st.executeQuery(sql);
			if (resultSet.next()) {
				res = ""+ (Integer.parseInt(resultSet.getString(1)) + 1); 
				
				
			}else {
				res = "1"; 
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}
	
	//Muestra en una caja de texto la ID de los ciclos, generada automáticamente por la DB
	public String ConsultarIdCiclos() {
		conexion = new Conexion();
		//ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		//AppObj appObj = null; 
		String res = ""; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "SELECT TOP 1 c.IdCiclo from Ciclos c order by c.IdCiclo desc;";
			

			
			resultSet = st.executeQuery(sql);
			if (resultSet.next()) {
				res = ""+ Integer.parseInt(resultSet.getString(1)) + 1; 
				
				
			}else {
				res = "1"; 
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}
	
	//Muestra en una caja de texto la ID de métricas, generada automáticamente por la DB
	public String ConsultarIdMetricas() {
		conexion = new Conexion();
		//ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		//AppObj appObj = null; 
		String res = ""; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "SELECT TOP 1 m.IdMetrica from Metrica m order by m.IdMetrica desc;";
			

			
			resultSet = st.executeQuery(sql);
			if (resultSet.next()) {
				res = ""+ Integer.parseInt(resultSet.getString(1)) + 1; 
				
				
			}else {
				res = "1"; 
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}
	
	public ArrayList<AppObj> ConsultarVersionXIdApp(String idApp) {
		conexion = new Conexion();
		ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		AppObj appObj = null; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "select IdVersion, nombreVersion from Version where IdApp_FK = "+idApp+";  ";
			

			
			resultSet = st.executeQuery(sql);
			while (resultSet.next()) {
				appObj = new AppObj(resultSet.getString(1), resultSet.getString(2));
				list.add(appObj);
				System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	public ArrayList<AppObj> ConsultarVersionXIdApp2(String idApp2) {
		conexion = new Conexion();
		ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		AppObj appObj = null; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "select IdVersion, nombreVersion from Version where IdApp_FK = "+idApp2+";  ";
			

			
			resultSet = st.executeQuery(sql);
			while (resultSet.next()) {
				appObj = new AppObj(resultSet.getString(1), resultSet.getString(2));
				list.add(appObj);
				System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	
	public ArrayList<AppObj> ConsultarCicloXIdVersion(String idVersion) {
		conexion = new Conexion();
		ArrayList<AppObj> list = new ArrayList<AppObj>(); 
		AppObj appObj = null; 

		ResultSet resultSet = null;
		Statement st = null;

		try {
			st = conexion.cargarDatos().createStatement();
			
			String sql = "select IdCiclo, nombreCiclo from Ciclos where IdVersion_FK= "+idVersion+";  ";
			

			
			resultSet = st.executeQuery(sql);
			while (resultSet.next()) {
				appObj = new AppObj(resultSet.getString(1), resultSet.getString(2));
				list.add(appObj);
				System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	//Permite la eliminación de una aplicación
	public boolean eliminarApp(int IDAPP) {
		conexion = new Conexion();

		boolean res = true;
		// int resultSet = null;
		Statement ps = null;

		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "Delete from App where App.IdApp="+IDAPP+"; ";

			ps.executeUpdate(sql);
			res = true;

		} catch (SQLException e) {
			e.printStackTrace();
			res = false;
		}

		return res;
	}
	
	//Permite la actualizacion de una aplicación

	public boolean actualizarApp(int IDAPPs, String name) {
		conexion = new Conexion();

		boolean res = true;
		// int resultSet = null;
		Statement ps = null;

		try {
			ps = conexion.cargarDatos().createStatement();
			String sql = "UPDATE App set App.nombreApp='" + name +"' where App.IdApp='"+IDAPPs+"'";

			ps.executeUpdate(sql);
			res = true;

		} catch (SQLException e) {
			e.printStackTrace();
			res = false;
		}

		return res;
	}
	
	//Permite la eliminación de una version
		public boolean eliminarVersion(int IDVersion) {
			conexion = new Conexion();

			boolean res = true;
			// int resultSet = null;
			Statement ps = null;

			try {
				ps = conexion.cargarDatos().createStatement();
				String sql = "Delete from Version where Version.IdVersion="+IDVersion+"; ";

				ps.executeUpdate(sql);
				res = true;

			} catch (SQLException e) {
				e.printStackTrace();
				res = false;
			}

			return res;
		}
		
		//Permite la actualizacion de una aplicación

		public boolean actualizarVersion(int IDVersions, String name) {
			conexion = new Conexion();

			boolean res = true;
			// int resultSet = null;
			Statement ps = null;

			try {
				ps = conexion.cargarDatos().createStatement();
				String sql = "UPDATE Version set Version.nombreVersion='" + name +"' where Version.IdVersion='"+IDVersions+"'";

				ps.executeUpdate(sql);
				res = true;

			} catch (SQLException e) {
				e.printStackTrace();
				res = false;
			}

			return res;
		}
		
		
		public ArrayList<AppObj> ConsultarMetricasXIdCiclo(String idCiclo) {
			conexion = new Conexion();
			ArrayList<AppObj> list = new ArrayList<AppObj>(); 
			AppObj appObj = null; 

			ResultSet resultSet = null;
			Statement st = null;

			try {
				st = conexion.cargarDatos().createStatement();
				
				String sql = "select IdMetrica, nombreMetrica, cantidad from Metrica where IdCiclos_FK = "+idCiclo+";  ";
				

				
				resultSet = st.executeQuery(sql);
				while (resultSet.next()) {
					appObj = new AppObj(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3));
					list.add(appObj);
					System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2)+" - "+ resultSet.getString(3));
					
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return list;
		}
		
		
		public ArrayList<AppObj> ConsultarMetricasXIdVersion(String idVersion) {
			conexion = new Conexion();
			ArrayList<AppObj> list = new ArrayList<AppObj>(); 
			AppObj appObj = null; 

			ResultSet resultSet = null;
			Statement st = null;

			try {
				st = conexion.cargarDatos().createStatement();
				
				String sql = "select Metrica.IdMetrica, Metrica.nombreMetrica, Metrica.cantidad from Metrica, Ciclos where\r\n" + 
						"Metrica.IdCiclos_FK=Ciclos.IdCiclo and Ciclos.IdVersion_FK = (select IdVersion from Version where Version.IdVersion="+idVersion+"); ";
				

				
				resultSet = st.executeQuery(sql);
				while (resultSet.next()) {
					appObj = new AppObj(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3));
					list.add(appObj);
					System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2)+" - "+ resultSet.getString(3));
					
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return list;
		}
		
		
		public ArrayList<AppObj> ConsultarValorXIdVersion(String idVersion) {
			conexion = new Conexion();
			ArrayList<AppObj> list = new ArrayList<AppObj>(); 
			AppObj appObj = null; 

			ResultSet resultSet = null;
			Statement st = null;

			try {
				st = conexion.cargarDatos().createStatement();
				
				String sql = "select Ciclos.nombreCiclo, Metrica.cantidad from Metrica, Ciclos where\r\n" + 
						"Metrica.IdCiclos_FK=Ciclos.IdCiclo and Ciclos.IdVersion_FK = (select IdVersion from Version where Version.IdVersion="+idVersion+")"; 
				

				
				resultSet = st.executeQuery(sql);
				while (resultSet.next()) {
					appObj = new AppObj(resultSet.getString(1), resultSet.getString(2));
					list.add(appObj);
					System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2));
					
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return list;
		}
		
		
		public ArrayList<AppObj> ConsultarValorXPromedio(String idVersion) {
			conexion = new Conexion();
			ArrayList<AppObj> list = new ArrayList<AppObj>(); 
			AppObj appObj = null; 

		

			try {
				
				CallableStatement cst= conexion.cargarDatos().prepareCall("{call dbo.repo("+idVersion+")}");
			
			
			cst.registerOutParameter(1, java.sql.Types.NVARCHAR);
			cst.registerOutParameter(2, java.sql.Types.NVARCHAR);
			cst.registerOutParameter(3, java.sql.Types.NVARCHAR);
	cst.execute();
				
					appObj = new AppObj(cst.getString(1)+" - "+ cst.getString(2)+" - "+ cst.getString(3));
					list.add(appObj);
					System.out.println("*****************************************"+cst.getString(1)+" - "+ cst.getString(2)+" - "+ cst.getString(3));
					
				

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return list;
		}
		
		
		public ArrayList<AppObj> ConsultarCiclosXIdVersion(String idVersion) {
			conexion = new Conexion();
			ArrayList<AppObj> list = new ArrayList<AppObj>(); 
			AppObj appObj = null; 

			ResultSet resultSet = null;
			Statement st = null;

			try {
				st = conexion.cargarDatos().createStatement();
				
				String sql = "select Ciclos.nombreCiclo from Ciclos, Version where \r\n" + 
						"Ciclos.IdVersion_FK=Version.IdVersion and Version.idVersion="+idVersion+"; ";
				

				
				resultSet = st.executeQuery(sql);
				while (resultSet.next()) {
					appObj = new AppObj(resultSet.getString(1));
					list.add(appObj);
					System.out.println("*****************************************"+resultSet.getString(1));
					
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return list;
		}
		
		//Consulta una lista de los ciclos mediante un select. Esta lista está en la ventana de inserción de métricas
		public ArrayList<AppObj> ConsultarMetricasResumen() {
			conexion = new Conexion();
			ArrayList<AppObj> list = new ArrayList<AppObj>(); 
			AppObj appObj = null; 

			ResultSet resultSet = null;
			Statement st = null;

			try {
				st = conexion.cargarDatos().createStatement();
				
				String sql = "select IdMetrica, nombreMetrica, cantidad from Metrica;  ";
				

				
				resultSet = st.executeQuery(sql);
				while (resultSet.next()) {
					appObj = new AppObj(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3));
					list.add(appObj);
					System.out.println("*****************************************"+resultSet.getString(1)+" - "+ resultSet.getString(2)+" - "+ resultSet.getString(3));
					
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return list;
		}

		//Muestra en una caja de texto la ID de la versión, generada automáticamente por la DB
		public String ConsultarNombresMetricas() {
			conexion = new Conexion();
			//ArrayList<AppObj> list = new ArrayList<AppObj>(); 
			//AppObj appObj = null; 
			String res = ""; 

			ResultSet resultSet = null;
			Statement st = null;

			try {
				st = conexion.cargarDatos().createStatement();
				
				String sql = "select Metrica.nombreMetrica from Metrica;";
				

				
				resultSet = st.executeQuery(sql);
				if (resultSet.next()) {
					res = resultSet.getString(1); 
					
					
				}else {
					res = "1"; 
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return res;
		}
		


		//Consulta una lista de los ciclos mediante un select. Esta lista está en la ventana de inserción de métricas
		public ArrayList<AppObj> consultarSoloNumeros() {
			conexion = new Conexion();
			ArrayList<AppObj> list = new ArrayList<AppObj>(); 
			AppObj appObj = null; 

			ResultSet resultSet = null;
			Statement st = null;

			try {
				st = conexion.cargarDatos().createStatement();
				
				String sql = "select Metrica.nombreMetrica from Metrica group by Metrica.nombreMetrica having count(*)>1; ";
				

				
				resultSet = st.executeQuery(sql);
				while (resultSet.next()) {
					appObj = new AppObj(resultSet.getString(1));
					list.add(appObj);
					System.out.println("*****************************************"+resultSet.getString(1));
					
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return list;
		}

		
		public ArrayList<String[]> tablaResult(String idVersion ) {
			conexion = new Conexion();
			 ResultSet resul = null;
			CallableStatement cst = null;
			ArrayList<String[]> arrayLists = new ArrayList<String[]>(); 
			 //vamos a construir una matriz n x m, donde n son la columna y m las filas
			/*
			 * 1.	extraemos las cabeceras, es lo que hacemos en el primer for
			 * 2.	recorremos la camtidad de fias que tenemos, 
			 * 3.	asociamos a cada columna su posicion con las fila por eso el doble for para armar la matriz 
			 * 4.	Llenaremos la matriz con una estructura de datos, sea un vector o listas (mejor listas, los vectores tienes que darle tamano)
			 * como no conocemos las cantidad de datos que nos arroja tenemo que agragar cada uno independiente
			 * */
					
			try
			{
				cst = conexion.cargarDatos().prepareCall("{call dbo.repo('" + idVersion + "')}");
				resul = cst.executeQuery();

				// cabeceras
				// las cabeceras siempre son las primeras
				String[] aux = new String[resul.getMetaData().getColumnCount()]; 
				System.out.println("Total: "+resul.getMetaData().getColumnCount());
				for (int i = 1; i <= resul.getMetaData().getColumnCount(); i++) {
					System.out.println(resul.getMetaData().getColumnName(i));
					aux[(i-1)] = resul.getMetaData().getColumnName(i); 
					System.out.println("i-1:"+(i-1));
					
				}
				arrayLists.add(aux);

				// como nosabemos cuantos datos pueden venir, no podemos darle un tamanio
				// presiso
				
				String[] aux2 = null; 
				while (resul.next()) {
					aux2 = new String[resul.getMetaData().getColumnCount()]; 
					for (int j = 1; j <= resul.getMetaData().getColumnCount(); j++) {
						System.out.println(resul.getString(j));
						aux2[(j-1)] = resul.getString(j);

					}
					arrayLists.add(aux2); 

				}

			}catch(
			SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return arrayLists;

		}
}
