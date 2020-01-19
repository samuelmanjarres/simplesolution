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
<jsp:include page="index.jsp"></jsp:include>

<form action="insertVersion.jsp">
<div>
<h3 align="center">Registro de las versiones de las aplicaciones</h3>
<label  style="padding-left: 45px">ID:</label>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="idVersion" style="width: 124px" >
<br>
<br>
<br>

<label  style="padding-left: 45px">Aplicación:</label>

&nbsp;&nbsp;&nbsp;
<select >
<option>Elija una aplicación...</option>
</select>
<br>
<br>
<br>


<label  style="padding-left: 45px">Nombre:</label>
&nbsp;
<input type="text" name="nombreVersion" placeholder="Nombre de la version" autofocus="autofocus" style="width: 200px">
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
</style>

</html>