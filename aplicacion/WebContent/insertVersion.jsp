<!-- Permite relacionar el nombre de la versión junto con la ID de la aplicación seleccionada -->
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
String id = request.getParameter("appVersion"); 
String nombre = request.getParameter("nombreVersion"); 

appDao.registrarVersion(id, nombre); 


%>

<script type="text/javascript">
alert("Registrada exitosamente");
window.history.go(-1);
window.location('intRegistroVersiones.jsp');
</script>
</body>
</html>