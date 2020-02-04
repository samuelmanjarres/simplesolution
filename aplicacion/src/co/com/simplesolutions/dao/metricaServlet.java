package co.com.simplesolutions.dao;

import java.io.IOException;
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
import javax.swing.JOptionPane;
import javax.ws.rs.core.MediaType;

import org.apache.jasper.tagplugins.jstl.core.Out;

@WebServlet(urlPatterns = "/metricaServlet")
public class metricaServlet extends HttpServlet {
	
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AppDao appDao = new AppDao(); 
		String IdCiclo = req.getParameter("auxCiclo"); 
		String Name = req.getParameter("nameM"); 
		String Valor = req.getParameter("valor"); 
		//ArrayList<AppObj> Ciclos = appDao.ConsultarCicloXIdVersion(idVersion);
		System.out.println("Entro en el Servlet Metricas" +IdCiclo +" - "+Name+" - "+Valor);
		if (appDao.registrarMetricas(IdCiclo, Name, Valor)) {
		
			resp.setContentType(MediaType.TEXT_PLAIN);
			resp.getWriter().append("success: yes ");
		}
		
	//	JsonArrayBuilder arrayBuilder = Json.createArrayBuilder(); 
		
//		Ciclos.stream().map((AppObj)-> Json.createObjectBuilder()
//				.add("idCiclo", AppObj.getId())
//				.add("nameCiclo", AppObj.getName())
//				.build()).forEach((ciclos) -> {arrayBuilder.add(ciclos);
//				
//				});
	
		//resp.setContentType(MediaType.APPLICATION_JSON);
	
	
	}
}

