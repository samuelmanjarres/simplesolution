<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="co.com.simplesolutions.dao.AppDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table class="table">


		<%
AppDao appDao = new AppDao(); 
String id = request.getParameter("SelectVersion"); 
System.out.print("Id: "+id); 
ArrayList<String[]> stringsList = appDao.tablaResult(id); 
 String[] Colum = stringsList.get(0); 
out.write("<tr>");
for(String aux2: Colum){
	out.write("<th>"+aux2+"</th>");
}
out.write("<th>Promedio</th>");
out.write("</tr>");


for(int i=1;i < stringsList.size(); i++){
	out.write("<tr>");
	String[] aux = stringsList.get(i);
	for(String aux2: aux){
		out.write("<td>"+aux2+"</td>");
	}
	float sum = 0;
	for(int j=1;j < aux.length; j++){
		if(aux[j] != null){
		 sum = sum + Float.parseFloat(aux[j]); 
			
		}
		
		
	}
	System.out.println("aux: "+sum/(aux.length-1)); 
	out.write("<td>"+sum/(aux.length-1)+"</td>");
	out.write("</tr>"); 
}



%>
	</table>
	<br>
	<br>
	<br>
	&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
	<input type="button" class="boton_guardarMetrica" onclick="history.back()" name="volver atrás" value="Volver Atrás">

<style>
<!--
table {
   width: 100%;
   border: 1px solid #000;
   
}
th, td {
   width: 25%;
   text-align: center;
   vertical-align: top;
   border: 1px solid #000;
   border-collapse: collapse;
}
caption {
   padding: 0.3em;
   color: #fff;
    background: #000;
}
th {
   background: #4D64B4;
   
}

td {
   background: #9BA9D8;
   
}

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
-->
</style>
</body>
</html>