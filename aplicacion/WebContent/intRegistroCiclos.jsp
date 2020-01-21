<%@page import="co.com.simplesolutions.dao.AppDao"%>
<%@page import="co.com.simplesolutions.conexion.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aplicaci�n Simple Solutions</title>
</head>
<body bgcolor="EAD39C">

<div id="menu-wrapper">
<ul id="hmenu">
<li><a href="index.jsp">Inicio</a></li>
<li><a href="#">Registros</a>

<ul id="sub-menu">
      <li><a href="intRegistroAPP.jsp">Registro de aplicaciones</a></li>
       <li><a href="intRegistroVersiones.jsp">Registro de versiones</a></li>
        <li><a href="intRegistroCiclos.jsp">Registro de ciclos</a></li>
         <li><a href="intRegistroMetricas.jsp">Registro de m�tricas</a></li>
</ul>
</li>
<li><a href="#">Resumen</a></li>
<li><a href="#">Tutorial</a></li>
</ul>

</div>

<form action="insertCiclos.jsp">
<div>
<h3 align="center">Registro de los ciclos de prueba </h3>
<label  style="padding-left: 45px">ID:</label>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="idCiclos" style="width: 124px" >
<br>
<br>
<br>

<label  style="padding-left: 45px">Aplicaci�n:</label>

&nbsp;&nbsp;&nbsp;
<select >
<option>Elija una aplicaci�n...</option>
</select>
<br>
<br>
<br>


<label  style="padding-left: 45px">Versi�n:</label>

&nbsp;&nbsp;&nbsp;
<select <% AppDao appDao= new AppDao();
appDao.ConsultarAppVersion();
%> >
<option>Elija una versi�n de la APP...</option>
</select>
<br>
<br>
<br>


<label  style="padding-left: 45px">Nombre:</label>
&nbsp;
<input type="text" name="nombreCiclo" placeholder="Nombre del ciclo" autofocus="autofocus" style="width: 200px">
</div>
<br>
<br>
<div style="padding-left: 155px">
<button class="boton_guardarVersion" type="submit">Guardar</button>

</div>

</form>

</body>

<style type="text/css">
  .boton_guardarVersion{
    text-decoration: none;
    padding: 10px;
    font-weight: 600;
    font-size: 15px;
    color: #ffffff;
    background-color: #7D5E3C;
    border-radius: 6px;
    border: 2px solid #7D5E3C;
    
     .boton_guardarVersion:hover{
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