<%@page import="co.com.simplesolutions.conexion.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@page import="co.com.simplesolutions.dao.AppDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.com.simplesolutions.dao.AppObj"%>
<%@ page pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<title>Aplicación Simple Solutions</title>
<%
		AppDao appDao = new AppDao();
	%>
<script>
	var idApp = function() {
		var id = $("#apps").val();
		console.log("id: " + id);
		$.getJSON("VersionServlet", {
			id : id
		}, function(data, textStatus, jqXHR) {
			$("#SelectVersion").empty();//limpiar el select para agregar nuevos datos
			$.each(data, function(index, item) {
				$("#SelectVersion").val('0');
				$("<option/>").attr("value", item.idVersion).text(item.Name)
						.appendTo("#SelectVersion");
				$("#SelectVersion").val('0');
			});
		});
	};
	$(document).ready(function() {
		$("#apps").change(idApp);
	});
</script>

<script>
	var idVersion = function() {
		var id = $("#SelectVersion").val();
		console.log("id: " + id);
		$.getJSON("CicloServlet", {
			id : id
		}, function(data, textStatus, jqXHR) {
		$("#selectCiclos").empty();//limpiar el select para agregar nuevos datos
			$.each(data, function(index, item) {
				$("#selectCiclos").val('0');
				$("<option/>").attr("value", item.idCiclo).text(item.nameCiclo)
						.appendTo("#selectCiclos");
				$("#selectCiclos").val('0');
			});
		});
	};
	$(document).ready(function() {
		$("#SelectVersion").change(idVersion);
	});
</script>



<script>

function limpiarTabla() {
	$("#resumenTabla tbody").empty();
}
</script>
<script type="text/javascript">
$(document).ready(function(){
   
    	var idCiclo = function() {
    		var id = $("#selectCiclos").val();
    		console.log("id: " + id);
    		$.getJSON("resumenServlet", {
    			id : id
    		}, function(data, textStatus, jqXHR) {
    		$("#resumenTabla tbody").empty();//limpiar el select para agregar nuevos datos
    			$.each(data, function(index, item) {
    				
    				   $('#resumenTabla').append('<tr><td>' + item.idMetrica + '</td><td>' + item.nameMetrica + '</td><td>' + item.cantidad + '</td></tr>');
    		            console.log(item.idMetrica + ' ' + item.nameMetrica + ' ' + item.cantidad);
    			
    			});
    		});
    	};
    	$(document).ready(function() {
    	//	$("#selectCiclos").change(idCiclo);
    	});
        
  
});

</script>

<script type="text/javascript">
$(document).ready(function(){
   
    	var idVersionDos = function() {
    		var id = $("#SelectVersion").val();
    		console.log("id: " + id);
    		$.getJSON("resumenServletDos", {
    			id : id
    		}, function(data, textStatus, jqXHR) {
    		$("#resumenTablaDos tbody").empty();//limpiar el select para agregar nuevos datos
    			$.each(data, function(index, item) {
    				
    				   $('#resumenTablaDos').append('<tr><td>' + item.idMetrica + '</td><td>' + item.nameMetrica + '</td><tr>' );
    		            console.log(item.idMetrica + ' ' + item.nameMetrica + ' ' + item.cantidad);
    		        /*     var numDatos= $("#resumenTablaDos tr").length-1;    		            
    		            var suma = 0;
    		            $('#resumenTablaDos tr').each(function(){ //filas con clase 'dato', especifica una clase, asi no tomas el nombre de las columnas
    		             suma += parseFloat($(this).find('td').eq(2).text()||0,10) //numero de la celda 3
    		            })
    		            $("#valorTotal").val(suma/numDatos); */
    		           
    			});
    		});
    	};
    	$(document).ready(function() {
    		//$("#SelectVersion").change(idVersionDos);
    	});
        
  
});


</script>


<script type="text/javascript">
$(document).ready(function(){
   
    	var idValorMetrica = function() {
    		var id = $("#SelectVersion").val();
    		console.log("id: " + id);
    		$.getJSON("valorMetricaServlet", {
    			id : id
    		}, function(data, textStatus, jqXHR) {
    		$("#resumenNombresVersiones tbody").empty();//limpiar el select para agregar nuevos datos
    			$.each(data, function(index, item) {
    				
    				   $('#resumenNombresVersiones').append('<tr><td>' + item.nombreCiclo + '</td><td>' + item.valorMetrica + '</td><tr>');
    		            console.log(item.nombreCiclo + ' ' + item.valorMetrica);
    		        /*     var numDatos= $("#resumenTablaDos tr").length-1;    		            
    		            var suma = 0;
    		            $('#resumenTablaDos tr').each(function(){ //filas con clase 'dato', especifica una clase, asi no tomas el nombre de las columnas
    		             suma += parseFloat($(this).find('td').eq(2).text()||0,10) //numero de la celda 3
    		            })
    		            $("#valorTotal").val(suma/numDatos); */
    		           
    			});
    		});
    	};
    	$(document).ready(function() {
    		//$("#SelectVersion").change(idValorMetrica);
    	});
        
  
});


</script>


<!-- <script type="text/javascript">
$(document).ready(function(){
   
    	var idSoloNombres = function() {
    		var id = $("#SelectVersion").val();
    		console.log("id: " + id);
    		$.getJSON("soloNombresServlet", {
    			id : id
    		}, function(data, textStatus, jqXHR) {
    		$("#soloNombres tbody").empty();//limpiar el select para agregar nuevos datos
    			$.each(data, function(index, item) {
    				
    				   $('#soloNombres').append('<tr><td>' + item.nameMetricas + '</td><tr>');
    		            console.log(item.nameMetricas);
    		        /*     var numDatos= $("#resumenTablaDos tr").length-1;    		            
    		            var suma = 0;
    		            $('#resumenTablaDos tr').each(function(){ //filas con clase 'dato', especifica una clase, asi no tomas el nombre de las columnas
    		             suma += parseFloat($(this).find('td').eq(2).text()||0,10) //numero de la celda 3
    		            })
    		            $("#valorTotal").val(suma/numDatos); */
    		           
    			});
    		});
    	};
    	$(document).ready(function() {
    		$("#SelectVersion").change(idSoloNombres);
    	});
        
  
});


</script> -->

<script type="text/javascript">
/* $(document).ready(function(){
   
    	var idPromedioMetrica = function() {
    		var id = $("#SelectVersion").val();
    		console.log("id: " + id);
    		$.getJSON("promedioServlet", {
    			id : id
    		}, function(data, textStatus, jqXHR) {
    		$("#soloNombres tbody").empty();//limpiar el select para agregar nuevos datos
    			$.each(data, function(index, item) {
    				
    				 $('#soloNombres').append('<tr><td>' + item.nombreMetrica + '</td><td>' + item.nombreCiclo + '</td><td>'+ item.cantidad + '</td><tr>');
 		            console.log(item.nombreMetrica + ' ' + item.nombreCiclo +  ' ' + item.cantidad );
    		           
    			});
    		});
    	};
    	$(document).ready(function() {
    		$("#SelectVersion").change(idPromedioMetrica);
    	});
        
  
});
 */

/*  $(document).ready(function(){
	 var promedio = function() {
		 var id=  $("#SelectVersion").val();
	 }
	 $.ajax({
	     url: "promedioServlet.java/LLamaProcedimiento",
	     data: {}, // no hace nada 
	     type: "POST",
	     contentType: "application/json; charset=utf-8",
	     dataType: "json",
	     success: function(data){
	      var respuesta = data;
	     },
	     error: function (result) {
	         MensajeError("ERROR " + result.status + ' ' + result.statusText);
	     }
	 });
	 }) */
</script>


</head>
<body bgcolor="EAD39C">


	<div id="menu-wrapper">
		<ul id="hmenu">
			<li><a href="index.jsp">Inicio</a></li>
			<li><a href="#">Registros</a>

				<ul id="sub-menu">
					<li><a href="intRegistroAPP.jsp">Registro de aplicaciones</a></li>
					<li><a href="intRegistroVersiones.jsp">Registro de
							versiones</a></li>
					<li><a href="intRegistroCiclos.jsp">Registro de ciclos</a></li>
					<li><a href="intRegistroMetricas.jsp">Registro de métricas</a></li>
				</ul></li>
			<li><a href="#">Gestiones</a>

				<ul id="sub-menu">
					<li><a href="gestApp.jsp">Gestión de aplicaciones</a></li>
					<li><a href="intRegistroVersiones.jsp">Gestión de
							versiones</a></li>
				</ul></li>
			<li><a href="resumen.jsp">Resumen</a></li>

		</ul>

	</div>

	<form id="formEjemplo" method="get" action="mostrarTabla.jsp">

		<div>

			<h3 align="center">Presentación de resumenes</h3>

<br>
<br>
<br>
   <h4 align="center">Seleccione una aplicación y una versión correspondiente para observar el resumen</h4>
	






			<label style="padding-left: 45px">Aplicación:</label>
			<!-- Se muestra el listado de los nombres de las aplicaciones registradas -->
			&nbsp;&nbsp;&nbsp; <select name="apps" id="apps">
				<option>Elija una aplicación...</option>
				<%
					ArrayList<AppObj> list = appDao.ConsultarAppCiclos();
					for (AppObj app : list) {
						out.println("<option value=" + app.getId() + ">" + app.getName() + "</option>");
					}
				%>

			</select> <br> <br> <br> <label style="padding-left: 45px">Versión:</label>
			<!-- Se muestra un listado de los nombres de las versiones registradas -->
			&nbsp;&nbsp;&nbsp; <select name="SelectVersion" id="SelectVersion">
				<option value="0">Elija una versión...</option>
			</select> <br> <br> <br> 
			<!-- Se muestra un listado de los ciclos de prueba registrados -->
			&nbsp;&nbsp;&nbsp;  <br> <br> <br>






		</div>
		<br> <br>
		<div style="padding-left: 115px">
			<button class="boton_guardarMetrica" type="submit" id="btnLimpiar"
				onclick="limpiarTabla();">Buscar</button>
			
				
				


		</div>



	</form>
</body>



<style type="text/css">
.boton_guardarMetrica {
	text-decoration: none;
	padding: 10px;
	font-weight: 600;
	font-size: 15px;
	color: #ffffff;
	background-color: #7D5E3C;
	border-radius: 6px;
	border: 2px solid #7D5E3C; .
	boton_guardarMetrica: hover{
    color: #1883ba;
	background-color: #ffffff;
}

}
body {
	margin: 0;
	font-family: sans-serif;
	font-size: 14px;
}

#menu-wrapper ul {
	padding: 0;
	list-style: none;
}

#hmenu>li {
	display: inline-block;
}

#hmenu>li>a {
	display: block;
	padding: 10px 5px;
	width: 90px;
}

li ul {
	position: absolute;
	display: none;
}

.sub-menu a {
	display: block;
	padding: 10px 5px;
	width: 130px;
	padding-bottom: 2ex;
}

li:hover ul {
	display: block;
}

#menu-wrapper, li ul {
	background: #662225;
}

#hmenu {
	width: 412px;
	margin: 0 auto;
}

#hmenu a {
	color: #FFFFFF;
	text-decoration: none;
	font-weight: bold;
}

#hmenu li:hover {
	background: #B51D0A;
	text-shadow: 0 0 2px #000;
}
</style>
</html>