<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Film</title>
</head>
<body>
	<h2>Edit Film</h2>
	<form action="updateFilm.do" method="post">
		<input type="hidden" name="id" value="${film.id}">
		<label for="title">Title:</label> 
		<input type="text" id="title" name="title" value="${film.title}">
		<!-- Add other form fields similarly, using the film object for values -->
		<input type="submit" value="Update Film">
	</form>
</body>
</html>
