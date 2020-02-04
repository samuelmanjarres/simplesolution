<%@page import="javax.swing.text.Document"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="co.com.simplesolutions.dao.AppDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Actualización de Version</title>
</head>
<body>
<%
AppDao appDao = new AppDao(); 
int IDVersions = Integer.parseInt(request.getParameter("IDVersions")); 
String nombreVersions = request.getParameter("nombreVersionMod"); 
System.out.print(""+IDVersions);
if(appDao.actualizarVersion(IDVersions, nombreVersions)){
	System.out.print("Actualizado");
	out.write("<script> alert('Actualizada exitosamente') </script>");
	 
}else{

	System.out.print("NO Actualizado");
	out.write("<script> alert('No Actualizada') </script>");
}


%>

<script type="text/javascript">
window.history.go(-1);
window.location('gesVersion.jsp');
</script>
</body>
</html>