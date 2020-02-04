<!-- Permite relacionar el nombre del ciclo de prueba junto con la ID de la versión seleccionada -->
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
String id = request.getParameter("selectVersiones"); 
String nombre = request.getParameter("nombreCiclo"); 

appDao.registrarCiclos(id, nombre); 


%>

<script type="text/javascript">
alert("Registrado exitosamente");
window.history.go(-1);
window.location('intRegistroCiclos.jsp');
</script>
</body>
</html>