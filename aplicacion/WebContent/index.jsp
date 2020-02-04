
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page import="co.com.simplesolutions.dao.AppDao"%>
<%@page import="java.applet.Applet"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page import="co.com.simplesolutions.conexion.Conexion"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aplicación Simple Solutions</title>
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
         <li><a href="intRegistroMetricas.jsp">Registro de métricas</a></li>
</ul>
</li>
<li><a href="#">Gestiones</a>

<ul id="sub-menu">
      <li><a href="intRegistroAPP.jsp">Gestión de aplicaciones</a></li>
       <li><a href="intRegistroVersiones.jsp">Gestión de versiones</a></li>
</ul>
</li>
<li><a href="resumen.jsp">Resumen</a></li>

</ul>

</div>


<br>
<br>
<br>
<h1 align="center" style="color: #7D5E3C">¡BIENVENIDO!</h1>
<div align="center">
<img src="imagenes/contactanos.png">
</div>


</body>

<style type="text/css">

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
<%!	
public void Llamar(){
	AppDao appDao= new AppDao();
	appDao.ConsultarAppVersion();
	
	
	
} 

%>