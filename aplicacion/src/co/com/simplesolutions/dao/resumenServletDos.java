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

@WebServlet(urlPatterns = "/resumenServletDos")
public class resumenServletDos extends HttpServlet {
	
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AppDao appDao = new AppDao(); 
		String idVersionDos = req.getParameter("id"); 
		ArrayList<AppObj> ResumenDos = appDao.ConsultarMetricasXIdVersion(idVersionDos);
		System.out.println("Entro en el Servlet de resumen");
		
		JsonArrayBuilder arrayBuilder = Json.createArrayBuilder(); 
		
		ResumenDos.stream().map((AppObj)-> Json.createObjectBuilder()
				.add("idMetrica", AppObj.getId())
				.add("nameMetrica", AppObj.getName())
				.add("cantidad", AppObj.getNameVers())
				.build()).forEach((resumenDos) -> {arrayBuilder.add(resumenDos);
				
				});
	
		resp.setContentType(MediaType.APPLICATION_JSON);
	
		try(JsonWriter jsonWriter = Json.createWriter(resp.getOutputStream())){
				jsonWriter.writeArray(arrayBuilder.build());
		}
	}
}
