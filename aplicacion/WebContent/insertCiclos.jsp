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
String id = request.getParameter("idCiclos"); 
String nombre = request.getParameter("nombreCiclo"); 

appDao.registrarCiclos(id, nombre); 


%>

<script type="text/javascript">
window.location('intRegistroCiclos.jsp');
</script>
</body>
</html>