<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="co.com.simplesolutions.dao.AppDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Actualización de App</title>
</head>
<body>
<%
AppDao appDao = new AppDao(); 
int IDaplic = Integer.parseInt(request.getParameter("IDAPPs")); 
String nombreApp = request.getParameter("nombreAppMod"); 
System.out.print(""+IDaplic);
if(appDao.actualizarApp(IDaplic, nombreApp)){
	System.out.print("Actualizado");
	out.write("<script> alert('Actualizada exitosamente') </script>");
}else{

	System.out.print("NO Actualizado");
	out.write("<script> alert('No Actualizada') </script>");
}


%>

<script type="text/javascript">
window.history.go(-1);
window.location('gestApp.jsp');
</script>
</body>
</html>