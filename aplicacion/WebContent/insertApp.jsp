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
String id = request.getParameter("idAPP"); 
String nombre = request.getParameter("nombreAPP"); 

appDao.registrar(id, nombre); 


%>

<script type="text/javascript">
alert("Registrada exitosamente");
window.history.go(-1);
window.location('intRegistroAPP.jsp');
</script>
</body>
</html>