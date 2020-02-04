<%@page import="co.com.simplesolutions.dao.AppDao"%>
<%@page import="co.com.simplesolutions.conexion.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="co.com.simplesolutions.dao.AppDao"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="co.com.simplesolutions.dao.AppObj"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<title>Aplicación Simple Solutions</title>

<script>
	var idApp = function() {
		var id = $("#selectAplicaciones").val();
		console.log("id: " + id);
		$.getJSON("VersionServlet", {
			id : id
		}, function(data, textStatus, jqXHR) {
			$("#selectVersiones").empty();//limpiar el select para agregar nuevos datos
			$.each(data, function(index, item) {
				$("<option/>").attr("value", item.idVersion).text(item.Name)
						.appendTo("#selectVersiones");
			});
		});
	};
	$(document).ready(function() {
		$("#selectAplicaciones").change(idApp);
	});
	
	$('#guardar').click(function() {

	    if ($('#options').val().trim() === '') {
	        alert('Debe seleccionar una opción');

	    } else {
	        alert('Campo correcto');
	    }
	});
</script>

</head>
<body bgcolor="EAD39C">
<%AppDao appDao= new AppDao();

%>
<div id="menu-wrapper">
<ul id="hmenu">
<li><a href="index.jsp">Inicio</a></li>
<li><a href="#">Registros</a>

<ul id="sub-menu">
      <li><a href="intRegistroAPP.jsp">Registro de aplicaciones</a></li>
       <li><a href="intRegistroVersiones.jsp">Registro de versiones</a></li>
        <li><a href="intRegistroCiclos.jsp">Registro de ciclos</a></li>
         <li><a href="intRegistroMetricas.jsp">Registro de métricas</a></li>
</ul>
</li>
<li><a href="#">Gestiones</a>

<ul id="sub-menu">
      <li><a href="gestApp.jsp">Gestión de aplicaciones</a></li>
       <li><a href="gesVersion.jsp">Gestión de versiones</a></li>
</ul>
</li>
<li><a href="resumen.jsp">Resumen</a></li>

</ul>

</div>

<form action="insertCiclos.jsp">
<div>
<h3 align="center">Registro de los ciclos de prueba </h3>
<label  style="padding-left: 45px">ID:</label>
<!-- Muestra la ID generada por la DB -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="idCiclos" style="width: 124px" value="<%out.println( appDao.ConsultarIdCiclos());
				
				System.out.print(appDao.ConsultarIdCiclos());
				%>" readonly="readonly" disabled>
<br>
<br>
<br>

<label  style="padding-left: 45px">Aplicación:</label>
<!-- Se muestra el listado de los nombres de las aplicaciones registradas -->
&nbsp;&nbsp;&nbsp;
<select name="selectAplicaciones" id="selectAplicaciones">
<option value="" selected="selected">Seleccione una aplicación..</option>

<% ArrayList<AppObj> list = appDao.ConsultarAppCiclos();
				for(AppObj app: list){
					out.println("<option value="+app.getId()+">"+app.getName()+"</option>");
				}


%>
	

</select>
<br>
<br>
<br>


<label  style="padding-left: 45px">Versión:</label>
<!-- Se muestra un listado de los nombres de las versiones registradas -->
&nbsp;&nbsp;&nbsp;
<select name="selectVersiones" id="selectVersiones" required="required">
<option value="" selected="selected">Seleccione una versión</option>
<% ArrayList<AppObj> list1 = appDao.ConsultarVersionesCiclos();
				for(AppObj app: list1){
					out.println("<option value="+app.getId()+">"+app.getName()+"</option>");
				}


%>
	
</select>
<br>
<br>
<br>


<label  style="padding-left: 45px">Nombre:</label>
&nbsp;
<!-- el usuario ingresa el nombre del ciclo de prueba a registrar -->
<input type="text" name="nombreCiclo" placeholder="Nombre del ciclo" autofocus="autofocus" style="width: 200px" required="required">
</div>
<br>
<br>
<div style="padding-left: 155px">
<!-- Botón que permite guardar los datos en la DB -->
<button class="boton_guardarCiclo" type="submit" name="guardar" id="guardar">Guardar</button>
<!-- Botón que permite limpiar las cajas de textos y los select -->
<button class="boton_guardarCiclo" type="reset" >Limpiar</button>
</div>

</form>

</body>

<style type="text/css">
  .boton_guardarCiclo{
    text-decoration: none;
    padding: 10px;
    font-weight: 600;
    font-size: 15px;
    color: #ffffff;
    background-color: #7D5E3C;
    border-radius: 6px;
    border: 2px solid #7D5E3C;
    
     .boton_guardarCiclo:hover{
    color: #1883ba;
    background-color: #ffffff;
  }
  }
  
 

body{margin:0;
     font-family: sans-serif;
     font-size: 14px;
}

#menu-wrapper ul{padding:0;
     list-style:none;
     
}

#hmenu > li{
     display: inline-block;
}

#hmenu > li > a{
     display: block;
     padding: 10px 5px;
     width: 90px;
}

li ul{
     position: absolute;
     display: none;
       
}

.sub-menu a{
     display: block;
     padding: 10px 5px;
     width: 130px;
     padding-bottom: 2ex;
}

li:hover ul{
     display: block;
     
}

#menu-wrapper, li ul{
     background: #662225;
}

#hmenu{
     width: 412px;
     margin: 0 auto;
     
}

#hmenu a{
     color: #FFFFFF;
     text-decoration: none;
     font-weight: bold;
     
}

#hmenu li:hover{
     background: #B51D0A;
     text-shadow: 0 0 2px #000;
     
     
}
input:invalid {
  border: 1px solid red;
}

input:valid {
  border: 1px solid green;
}



</style>
</html>