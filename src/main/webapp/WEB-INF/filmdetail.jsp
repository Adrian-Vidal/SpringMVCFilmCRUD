<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Details</title>
</head>
<body>
	<c:choose>
		<c:when test="${! empty film}">
			<ul>
				<li><strong>Title: </strong> ${film.title}</li>
				<li><strong>Film ID: </strong> ${film.id}</li>
				<li><strong>Description: </strong> ${film.description}</li>
				<li><strong>Release Year: </strong> ${film.realeaseYear}</li>
				<li><strong>Language ID: </strong> ${film.languageId}</li>
				<li><strong>Language: </strong> ${film.Language}</li>
				<li><strong>Rental Duration: </strong> ${film.rentalDuration}</li>
				<li><strong>Rental Rate: </strong> ${film.rentalRate}</li>
				<li><strong>Length: </strong> ${film.length}</li>
				<li><strong>Replacement Cost: </strong> ${film.}</li>
				<li><strong>Rating: </strong> ${film.rating}</li>
				<li><strong>Special Features: </strong> ${film.specialFeatures}</li>
				<li><strong>Actors: </strong> ${film.actors}</li>
			</ul>
			</c:when>
			<c:otherwise>
				<p>No film details available. Please check to see if film ID is correct and try again.</p>
			</c:otherwise>
			</c:choose>
			
			<form action="DeleteFilm.do" method="POST">
    			<input type="hidden" name="filmId" value="${film.id}" />
    				<button type="submit">Delete Film</button>
			</form>
			
			<a href="index.jsp">Back to Home</a>

</body>
</html>