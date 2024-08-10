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
        <ul>
            <c:forEach var="film" items="${films}">
                <li>
                    <h2>${film.title}</h2>
                    <p><strong>Film ID:</strong> ${film.id}</p>
                    <p><strong>Description:</strong> ${film.description}</p>
                    <p><strong>Release Year:</strong> ${film.releaseYear}</p>
                    <p><strong>Language ID:</strong> ${film.languageId}</p>
                    <p><strong>Language:</strong> ${film.language}</p>
                    <p><strong>Rental Duration:</strong> ${film.rentalDuration}</p>
                    <p><strong>Rental Rate:</strong> ${film.rentalRate}</p>
                    <p><strong>Length:</strong> ${film.length}</p>
                    <p><strong>Replacement Cost:</strong> ${film.replacementCost}</p>
                    <p><strong>Rating:</strong> ${film.rating}</p>
                    <p><strong>Special Features:</strong> ${film.specialFeatures}</p>
                    <p><strong>Actors:</strong> ${film.actors}</p>
                </li>
            </c:forEach>
        </ul>
    </c:when>
    <c:otherwise>
        <p>No films found matching your criteria.</p>
    </c:otherwise>
</c:choose>

<a href="index.jsp">Back to Home</a>

</body>
</html>
