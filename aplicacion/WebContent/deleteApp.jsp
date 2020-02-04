<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="co.com.simplesolutions.dao.AppDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminación de App</title>
</head>
<body>
<%
AppDao appDao = new AppDao(); 
int IDaplic = Integer.parseInt(request.getParameter("IDAPP")); 
System.out.print(""+IDaplic);
if(appDao.eliminarApp(IDaplic)){
	System.out.print("Eliminado");
	out.write("<script> alert('Eliminada exitosamente') </script>");
}else{

	System.out.print("NO Eliminado");
	out.write("<script> alert('No eliminada') </script>");
}


%>

<script type="text/javascript">
window.history.go(-1);
window.location('gestApp.jsp');
</script>
</body>
</html>