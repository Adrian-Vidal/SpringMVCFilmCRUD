<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css"> --%>
</head>
<body>
	<h1>Error</h1>
    <p><strong>${message}</strong></p>
    <a href="index.do">Return to Home</a>
   <%--  <a href="${pageContext.request.contextPath}/index.do">Return to Home</a> --%>
</body>
</html>