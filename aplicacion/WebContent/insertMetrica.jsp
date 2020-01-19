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
String id = request.getParameter("idMetricas"); 
String nombre = request.getParameter("nombreMetrica"); 
Float cantidad=Float.parseFloat(request.getParameter("cantidadMetrica"));
appDao.registrarMetricas(id, nombre, cantidad); 


%>

<script type="text/javascript">
window.location('intRegistroMetricas.jsp');
</script>
</body>
</html>