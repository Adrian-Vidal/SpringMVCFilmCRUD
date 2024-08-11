<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>

</head>
<body>

<c:choose>
    <c:when test="${not empty films}">
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
            <c:forEach var="film" items="${films}">
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
            </c:forEach>
        </tbody>
        </table>
                
    </c:when>
    <c:otherwise>
        <p>No films found matching your criteria.</p>
    </c:otherwise>
</c:choose>

<a href="index.do">Back to Home</a>

</body>
</html>
