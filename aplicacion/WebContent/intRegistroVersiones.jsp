<%@page import="co.com.simplesolutions.dao.AppObj"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.com.simplesolutions.conexion.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="co.com.simplesolutions.dao.AppDao"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aplicación Simple Solutions</title>
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
					<li><a href="intRegistroVersiones.jsp">Registro de
							versiones</a></li>
					<li><a href="intRegistroCiclos.jsp">Registro de ciclos</a></li>
					<li><a href="intRegistroMetricas.jsp">Registro de métricas</a></li>
				</ul></li>
				<li><a href="#">Gestiones</a>

<ul id="sub-menu">
      <li><a href="gestApp.jsp">Gestión de aplicaciones</a></li>
       <li><a href="gesVersion.jsp">Gestión de versiones</a></li>
</ul>
</li>
			<li><a href="resumen.jsp">Resumen</a></li>
			
		</ul>

	</div>

	<form action="insertVersion.jsp">
		<div>
			<h3 align="center">Registro de las versiones de las aplicaciones</h3>
			<label style="padding-left: 45px">ID:</label>
		
		
<!-- Muestra la ID generada por la DB -->
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<input
				type="text" name="idVersion"  style="width: 124px" value="<%out.println( appDao.ConsultarIdVersion());
				
				System.out.print(appDao.ConsultarIdVersion());
				%>" readonly="readonly" disabled> <br>
							<br> <br> <label style="padding-left: 45px">Aplicación:</label>
							
<!-- Muestra un listado con los nombres de las aplicaciones registradas -->
			&nbsp;&nbsp;&nbsp; 
			<select id="appVersion" name="appVersion" required="required">
				<option value="" selected="selected">Elija una aplicación...</option>
						<% ArrayList<AppObj> list = appDao.ConsultarAppVersion();
				for(AppObj app: list){
					out.println("<option value="+app.getId()+">"+app.getName()+"</option>");
				}


%>
	

<!-- el usuario ingresa el nombre de la versión a registrar -->
			</select> <br> <br> <br> <label style="padding-left: 45px">Nombre:</label>
			&nbsp; <input type="text" name="nombreVersion"
				placeholder="Nombre de la version" autofocus="autofocus"
				style="width: 200px" required="required">
		</div>
		<br> <br>
		<div style="padding-left: 155px">
		<!-- Botón que permite guardar los datos en la DB -->
			<button class="boton_guardarVersion" type="submit" name="guardar" id="guardar">Guardar</button>
			<!-- Botón que permite limpiar las cajas de textos y los select -->
<button class="boton_guardarVersion" type="reset" >Limpiar</button>
		</div>
		

	</form>


</body>
<script type="text/javascript">
$('#guardar').click(function() {

    if ($('#options').val().trim() === '') {
        alert('Debe seleccionar una opción');

    } else {
        alert('Campo correcto');
    }
});

function appId(){
var sel = document.getElementById("appVersion").value;


alert(""+sel);}

</script>

<style type="text/css">
.boton_guardarVersion {
	text-decoration: none;
	padding: 10px;
	font-weight: 600;
	font-size: 15px;
	color: #ffffff;
	background-color: #7D5E3C;
	border-radius: 6px;
	border: 2px solid #7D5E3C; .
	boton_guardarVersion: hover{
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

input:invalid {
  border: 1px solid red;
}

input:valid {
  border: 1px solid green;
}
</style>

</html>

