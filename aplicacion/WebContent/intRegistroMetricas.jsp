<%@page import="co.com.simplesolutions.conexion.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@page import="co.com.simplesolutions.dao.AppDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.com.simplesolutions.dao.AppObj"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<title>Aplicación Simple Solutions</title>

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






</head>
<body bgcolor="EAD39C">

	<%
		AppDao appDao = new AppDao();
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
					<li><a href="gesVersion.jsp">Gestión de
							versiones</a></li>
				</ul></li>
			<li><a href="resumen.jsp">Resumen</a></li>
		
		</ul>

	</div>

	<form id="formEjemplo" method="get">
		<div>

			<h3 align="center">Registro de las métricas</h3>
			<label style="padding-left: 45px">ID:</label>
			<!-- Muestra la ID generada por la DB -->
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
				type="text" name="idMetricas" style="width: 124px"
				value="<%out.println(appDao.ConsultarIdMetricas());

			System.out.print(appDao.ConsultarIdMetricas());%>"
				readonly="readonly" disabled> <br> <br> <br>

			<label style="padding-left: 45px">Aplicación:</label>
			<!-- Se muestra el listado de los nombres de las aplicaciones registradas -->
			&nbsp;&nbsp;&nbsp; <select name="apps" id="apps">
				<option value="" selected="selected">Elija una aplicación...</option>
				<%
					ArrayList<AppObj> list = appDao.ConsultarAppCiclos();
					for (AppObj app : list) {
						out.println("<option value=" + app.getId() + ">" + app.getName() + "</option>");
					}
				%>

			</select> <br> <br> <br> <label style="padding-left: 45px">Versión:</label>
			<!-- Se muestra un listado de los nombres de las versiones registradas -->
			&nbsp;&nbsp;&nbsp; <select name="SelectVersion" id="SelectVersion">
				<option value="" selected="selected">Elija una versión...</option>
			</select> <br> <br> <br> <label style="padding-left: 45px">Ciclos:</label>
			<!-- Se muestra un listado de los ciclos de prueba registrados -->
			&nbsp;&nbsp;&nbsp; <select id="selectCiclos" name="selectCiclos">
				<option value="" selected="selected">Elija un ciclo de prueba...</option>
				<%
					ArrayList<AppObj> list2 = appDao.ConsultarCiclosMetricas();
					for (AppObj app : list2) {
						out.println("<option value=" + app.getId() + ">" + app.getName() + "</option>");
					}
				%>
			</select> <br> <br> <br>





			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.1/jquery.min.js"></script>
			<!-- Función para calcular el valor de la primera métrica -->
			<script type="text/javascript">
			
		

			
				//funcion para calcular la metrica1
				function cubFuncionalidad() {

					var valor1 = $('#cantidadCasos').val();
					var valor2 = $('#totalFuncionalidades').val();
					valor1 = parseFloat(valor1);
					valor2 = parseFloat(valor2);
					$("#valorMetrica1").val(valor1 / valor2);

				}
				//funcion para calcular la metrica4
				function densidadDefectos() {

					var valor1 = $('#valorMetrica2').val();
					var valor2 = $('#valorMetrica3').val();
					valor1 = parseFloat(valor1);
					valor2 = parseFloat(valor2);
					$("#valorMetrica4").val(valor1 / valor2);

				}

				//funcion para calcular la metrica8
				function solucionFallos() {

					var valor1 = $('#totalFallos').val();
					var valor2 = $('#totalFallosSolucionados').val();
					valor1 = parseFloat(valor1);
					valor2 = parseFloat(valor2);
					$("#valorMetrica8").val(valor1 - valor2);

				}

				//funcion para calcular la metrica9
				function promedioAccesibilidad() {

					var valor1 = $('#cantidadDemos').val();
					var valor2 = $('#cantidadTutoriales').val();
					valor1 = parseFloat(valor1);
					valor2 = parseFloat(valor2);
					$("#valorMetrica9").val((valor1 + valor2) / 2);

				}

				//funcion de mostrar DIV para otra metrica
				function otraMetrica() {
					$("#otraMetrica").show();

				}

				//para limpiar formulario
				$("#btnLimpiar").click(function(event) {
					$("#formEjemplo")[0].reset();
					ocultarMetrica();

				});

				//funcion ocultar DIV para otra metrica
				function ocultarMetrica() {
					$("#otraMetrica").hide();

				}

				var nextinput = 0;
				function AgregarCampos() {
					nextinput++;
					campo = '<li id="rut'+nextinput+'">Nombre:<input type="text" size="20" id="campo' + nextinput + '"&nbsp; name="campo' + nextinput + '"&nbsp; />&nbsp;&nbsp;&nbsp;Valor:<input type="text" size="20" id="campo' + nextinput + '"&nbsp; name="campo' + nextinput + '"&nbsp; /></li><br>';
					$("#campos").append(campo);
				}
				
			
			
			
		
					
			/* 	
        		 $(document).ready(function(){
			         $("#guardarMetrica").click(function(){
			              var arrayMetrica = [];
			             $('input[name="metrica"]').each(function() {
			            	  arrayMetrica.push( $( this ).val() );  //el push pasa el valor al array de cada input con el nombre metricas
			                 console.log(arrayMetrica.join(''));
			              
			           });
			            $.get("metricaServlet",{"arrayMetrica[]":arrayMetrica}, function(index, item){ //aqui se debe pasar la ruta del servlet
			                 alert("Data: " + index + "\nStatus: " + item);
			                });
			             });
			           });
				 */
				 
				 
				 
        		 $(document).ready(function(){
			         $("#guardarMetrica").click(function(){
			            //  var arrayValores =  $('input[name="valor"]');
			              //var arrayMetrica =  $('input[name="metrica"]');
			                var arrayValores =  document.getElementsByName("valor");
			            	var arrayMetrica =   document.getElementsByName("metrica");
			            	
			            	var auxValor =jQuery.makeArray(arrayValores); 
			            	var auxMetrica = jQuery.makeArray(arrayMetrica); 
			            	var auxCiclo =  $( "#selectCiclos option:selected" ).val();
			              
			              for (var i = 0; i < auxValor.length; i++) {
			            	  
			            	  console.log("IDCiclos:"+auxCiclo+" Metrica: "+$(auxMetrica[i]).val()+" Valor: "+$(auxValor[i]).val());
			            	  
			            	  
			            	  
			            	 // var id = $("#SelectVersion").val();
			         			//console.log("id: " + id);
			         			$.get("metricaServlet", {
			         				auxCiclo : auxCiclo, nameM: $(auxMetrica[i]).val(), valor:$(auxValor[i]).val()
			         			}, function(res) {
			         				if (res == "yes") {

			         					console.log("Inserto");
									}
			         		
			         				
			         			});
			            	
						}
			           
			             
			         });
        		 });
				 
			     
			           /*   $('input[name="valor"]').each(function() {
			            	 arrayValores.push( $( this ).val() );  //el push pasa el valor al array de cada input con el nombre metricas
			                 console.log(arrayValores.join(''));
			              
			           });
			            $.get("metricaServlet",{"arrayValores[]":arrayValores}, function(index, item){ //aqui se debe pasar la ruta del servlet
			                 alert("Data: " + index + "\nStatus: " + item);
			                });
			             });
			           }); */
				
			</script>


			<div style="padding-left: 45px">

				<!-- Presentar la primera métrica -->
				<input type="text" name="metrica"
					value="Cubrimiento de funcionalidad" style="width: 400px" disabled>
				<input type="number" id="cantidadCasos"
					placeholder="Cantidad casos de prueba" style="width: 200px"
					onkeyup="cubFuncionalidad();" autofocus="autofocus" pattern="\d+"> <input
					type="number" id="totalFuncionalidades"
					placeholder="Total funcionalidades a probar" style="width: 200px"
					onkeyup="cubFuncionalidad();" pattern="\d+"> <input type="text"
					id="valorMetrica1" name="valor" style="" disabled="disabled">
				<br> <br>
				<!-- Presentar la segunda métrica -->
				<input type="text" name="metrica"
					value="Cantidad de no conformidades encontradas"
					style="width: 400px" disabled> <input type="number"
					id="valorMetrica2" name="valor" placeholder="Valor numérico"
					style="width: 200px" onkeyup="densidadDefectos();" pattern="\d+"> <br>
				<br>
				<!-- Presentar la tercera métrica -->
				<input type="text" name="metrica"
					value="Cantidad de funcionalidades probadas" style="width: 400px"
					disabled> <input type="number" id="valorMetrica3"
					name="valor" placeholder="Valor numérico" style="width: 200px"
					onkeyup="densidadDefectos();" pattern="\d+"> <br> <br>
				<!-- Presentar la cuarta métrica -->
				<input type="text" name="metrica"
					value="Densidad de defectos por funcionalidad" style="width: 400px"
					disabled> <input type="number" id="valorMetrica4"
					name="valor" style="width: 200px" disabled="disabled" pattern="\d+"> <br>
				<br>
				<!-- Presentar la quinta métrica -->
				<input type="text" name="metrica"
					value="Funcionamiento u operación que no provee una salida aceptable"
					style="width: 400px" disabled> <input type="number"
					name="valor" placeholder="Valor entre 0 y 100" min="0" max="100" step="1" style="width: 200px" pattern="\d+">
				<br> <br>
				<!-- Presentar la sexta métrica -->
				<input type="text" name="metrica"
					value="Estabilidad en las especificaciones funcionales"
					style="width: 400px" disabled> <input type="number"
					name="valor" placeholder="Valor entre 0 y 100" min="0" max="100" step="1" style="width: 200px" pattern="\d+">
				<br> <br>
				<!-- Presentar la septima métrica -->
				<input type="text" name="metrica"
					value="Cumplimiento de estándar de interfaz" style="width: 400px"
					disabled> <input type="number" name="valor"
					placeholder="Valor entre 0 y 100" min="0" max="100" step="1" style="width: 200px" pattern="\d+"> <br>
				<br>
				<!-- Presentar la octava métrica -->
				<input type="text" name="metrica"
					value="Grado de solución ante fallos totales" style="width: 400px"
					disabled> <input type="number" id="totalFallos"
					placeholder="Cantidad total de fallos encontrados"
					style="width: 220px" onkeyup="solucionFallos();" pattern="\d+"> <input
					type="number" id="totalFallosSolucionados"
					placeholder="Cantidad total de fallos solucionados"
					style="width: 220px" onkeyup="solucionFallos();" pattern="\d+"> <input
					type="text" id="valorMetrica8" name="valor" style="width: 120px"
					disabled="disabled"> <br> <br>
				<!-- Presentar la novena métrica -->
				<input type="text" name="metrica"
					value="Promedio de accesibilidad al usuario" style="width: 400px"
					disabled> <input type="number" id="cantidadDemos"
					placeholder="Cantidad de demos" style="width: 200px"
					onkeyup="promedioAccesibilidad();" pattern="\d+"> <input type="number"
					id="cantidadTutoriales" placeholder="Cantidad de tutoriales"
					style="width: 200px" onkeyup="promedioAccesibilidad();" pattern="\d+"> <input
					type="text" id="valorMetrica9" name="valor" style="width: 120px"
					disabled="disabled"> <br> <br>
				<!-- Presentar la decima métrica -->
				<input type="text" name="metrica"
					value="Eficiencia de la documentación del usuario"
					style="width: 300px" disabled> <input type="number"
					name="valor" placeholder="Valor entre 0 y 100" min="0" max="100" step="1" style="width: 200px" pattern="\d+">
				<br> <br>



			</div>
		</div>
		<br> <br>
		<div style="padding-left: 155px">
			<!-- Botón que permite guardar los datos en la DB -->
			<button class="boton_guardarMetrica" type="button"
				id="guardarMetrica">Guardar</button>
			<!-- Botón que permite limpiar las cajas de textos y los select -->
			<button class="boton_guardarMetrica" type="reset" id="btnLimpiar"
				onclick="ocultarMetrica();">Limpiar</button>


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

input:invalid {
  border: 1px solid red;
}

input:valid {
  border: 1px solid green;
}
</style>
</html>