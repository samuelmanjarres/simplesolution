
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>}
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
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
       <li><a href="intRegistroVersiones.jsp">Registro de versiones</a></li>
        <li><a href="intRegistroCiclos.jsp">Registro de ciclos</a></li>
         <li><a href="intRegistroMetricas.jsp">Registro de métricas</a></li>
</ul>
</li>
<li><a href="#">Gestiones</a>

<ul id="sub-menu">
      <li><a href="gestApp.jsp">Gestión de aplicaciones</a></li>
       <li><a href="intRegistroVersiones.jsp">Gestión de versiones</a></li>
</ul>
</li>
<li><a href="resumen.jsp">Resumen</a></li>

</ul>

</div>



<!-- ????  Para que  -->

<h3 align="center">Gestión de las versiones</h3>

<%
Conexion conexion = null;

ResultSet resultSet = null;
Statement st = null;

try{
	conexion = new Conexion();
	st = conexion.cargarDatos().createStatement();
	
	String sql = "Select * from Version ";
	
	resultSet = st.executeQuery(sql);
 } catch (SQLException e) {
	e.printStackTrace();
} 

%>

<div>
<table style="padding-left: 95px">
  
  <tr>
    <th>Id</th>
    <th>Nombre</th>
  </tr>
  <tr>
  <%
 while(resultSet.next()){
	 
  %>
  <tr>
  <td><%= resultSet.getInt("IdVersion") %> </td>
  <td><%= resultSet.getString("nombreVersion") %> </td>
  </tr>
  <%} %>
</table>
</div>


<br>
<br>


<script type="text/javascript">

</script>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<div style="padding-left: 155px">
<!-- Botón que permite guardar los datos en la DB -->
<form action="deleteVersion.jsp">
<input type="number" name="IDVersion" id="IDVersion" placeholder="Ingrese el Id de la version" pattern="\d+">
<button class="boton_guardarAPP" type="submit" name="eliminarVersion" id="eliminarVersion" >Eliminar</button>
</form>

<form action="actualizarVersion.jsp">
<input type="number" name="IDVersions" id="IDVersions" placeholder="Ingrese el Id de la versión" pattern="\d+">
<input type="text" name="nombreVersionMod" id="nombreVersionMod" placeholder="Ingrese el nuevo nombre de la versión" style="width: 260px">
<button class="boton_guardarAPP" type="submit" name="actualizarVersion" id="actualizarVersion" >Actualizar</button>
</form>
</div>
</body>


<style type="text/css">
  .boton_guardarAPP{
    text-decoration: none;
    padding: 10px;
    font-weight: 600;
    font-size: 15px;
    color: #ffffff;
    background-color: #7D5E3C;
    border-radius: 6px;
    border: 2px solid #7D5E3C;
    
     .boton_guardarAPP:hover{
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



</style>

</html>