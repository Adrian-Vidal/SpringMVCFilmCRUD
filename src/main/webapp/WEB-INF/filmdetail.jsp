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
			<style>
     			table {
     				width: 100%;
     				border-collapse: collapse;
     				}
     			th, td {
     				border: 1px solid;
     				text-align: center;
     				vertical-align: top;
     				}
     			th, td {
     				width: auto;
     				}
     		</style>
        <table>
        <tbody>
			<tr>
       			<td><strong>Film ID:</strong> ${film.id}</td>
       			<td><strong>Title:</strong> ${film.title}</td>
       			<td><strong>Description:</strong> ${film.description}</td>
       			<td><strong>Release Year:</strong> ${film.releaseYear}</td>
       			<td><strong>Language ID:</strong> ${film.languageId}</td>
       			<td><strong>Language:</strong> ${film.language}</td>
       			<td><strong>Rental Duration:</strong> ${film.rentalDuration}</td>
       			<td><strong>Rental Rate:</strong> ${film.rentalRate}</td>
       			<td><strong>Length:</strong> ${film.length}</td>
       			<td><strong>Replacement Cost:</strong> ${film.replacementCost}</td>
       			<td><strong>Rating:</strong> ${film.rating}</td>
       			<td><strong>Special Features:</strong> ${film.specialFeatures}</td>
       			<td><strong>Actors:</strong> ${film.actors}</td>
       			</tr>
       			</tbody>
       			</table>
			</c:when>
			<c:otherwise>
				<p>No film details available. Please check to see if film ID is correct and try again.</p>
			</c:otherwise>
			</c:choose>
			<br>
			<br>
			<form action="DeleteFilm.do" method="POST">
    			<input type="hidden" name="filmId" value="${film.id}" />
    				<button type="submit">Delete Film</button>
			</form>
			<br>
			<br>
			<form action="UpdateFilm.do" method="POST">
    			<input type="hidden" name="filmId" value="${film.id}" />
    				<button type="submit">Edit Film</button>
			</form>
			<br>
			<br>
			<a href="index.do">Back to Home</a>

</body>
</html>