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
import javax.ws.rs.core.MediaType;

@WebServlet(urlPatterns = "/soloNombresServlet")
public class soloNombresServlet extends HttpServlet {
	
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AppDao appDao = new AppDao(); 
		String idSoloNombres = req.getParameter("id"); 
		ArrayList<AppObj> SoloNombres = appDao.consultarSoloNumeros();
		System.out.println("Entro en el Servlet de nombres ciclos");
		
		JsonArrayBuilder arrayBuilder = Json.createArrayBuilder(); 
		
		SoloNombres.stream().map((AppObj)-> Json.createObjectBuilder()
			
				.add("nameMetricas", AppObj.getNameCiclo())
			
				.build()).forEach((solonombres) -> {arrayBuilder.add(solonombres);
				
				});
	
		resp.setContentType(MediaType.APPLICATION_JSON);
	
		try(JsonWriter jsonWriter = Json.createWriter(resp.getOutputStream())){
				jsonWriter.writeArray(arrayBuilder.build());
		}
	}
}
