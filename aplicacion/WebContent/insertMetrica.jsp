<!-- Permite relacionar el nombre de la métrica junto con la ID del ciclo seleccionado -->
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
<%
AppDao appDao = new AppDao(); 
String id = request.getParameter("selectCiclos"); 
String nombre = request.getParameter("auxMetrica"); 
String cantidad=request.getParameter("auxValor");
appDao.registrarMetricas(id, nombre, cantidad);


%>

<script type="text/javascript">
alert("Registrada exitosamente");
window.history.go(-1);
window.location('intRegistroMetricas.jsp');
</script>
</body>
</html>