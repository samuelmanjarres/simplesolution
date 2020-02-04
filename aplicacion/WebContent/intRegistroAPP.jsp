
<%@page import="co.com.simplesolutions.conexion.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="co.com.simplesolutions.dao.AppDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aplicaci�n Simple Solutions</title>
</head>
<script type="text/javascript">


</script>
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
         <li><a href="intRegistroMetricas.jsp">Registro de m�tricas</a></li>
</ul>
</li>
<li><a href="#">Gestiones</a>

<ul id="sub-menu">
      <li><a href="gestApp.jsp">Gesti�n de aplicaciones</a></li>
       <li><a href="gesVersion.jsp">Gesti�n de versiones</a></li>
</ul>
</li>
<li><a href="resumen.jsp">Resumen</a></li>

</ul>

</div>

<form action="insertApp.jsp">
<div>
<h3 align="center">Registro de las aplicaciones</h3>

<label  style="padding-left: 45px">ID:</label>
<!-- Muestra la ID generada por la DB -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="idAPP" style="width: 124px" value="<%out.println( appDao.ConsultarIdAPP());
				
				System.out.print(appDao.ConsultarIdAPP());
				%>" readonly="readonly" disabled>
<br>
<br>
<br>
<!-- el usuario ingresa el nombre de la aplicaci�n a registrar -->
<label  style="padding-left: 45px">Nombre:</label>
&nbsp;
<input type="text" name="nombreAPP" placeholder="Nombre de la aplicaci�n" autofocus="autofocus" style="width: 200px" required>
</div>
<br>
<br>
<div style="padding-left: 155px">
<!-- Bot�n que permite guardar los datos en la DB -->
<button class="boton_guardarAPP" type="submit"  >Guardar</button>
<!-- Bot�n que permite limpiar las cajas de textos y los select -->
<button class="boton_guardarAPP" type="reset" >Limpiar</button>

</div>




</form>
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

input:invalid {
  border: 1px solid red;
}

input:valid {
  border: 1px solid green;
}


</style>

</html>