<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Film</title>
</head>
<body>

<c:choose>
    <c:when test="${not empty film}">
        <form action="updateFilm.do" method="POST">
            <input type="hidden" name="filmId" value="${film.id}" />

            <label for="filmTitle">Title:</label>
            <input type="text" id="filmTitle" name="title" value="${film.title}">
            <br>
            <br>
            <label for="filmDescription">Description:</label>
            <input type="text" id="filmDescription" name="description" value="${film.description}">
            <br>
            <br>
            <label for="filmReleaseYear">Release Year:</label>
            <input type="text" id="filmReleaseYear" name="releaseYear" value="${film.releaseYear}">
            <br>
            <br>
            <label for="filmLanguageId">Language ID:</label>
            <input type="text" id="filmLanguageId" name="languageId" value="${film.languageId}">
            <br>
            <br>
            <label for="filmRentalDuration">Rental Duration:</label>
            <input type="text" id="filmRentalDuration" name="rentalDuration" value="${film.rentalDuration}">
            <br>
            <br>
            <label for="filmRentalRate">Rental Rate:</label>
            <input type="text" id="filmRentalRate" name="rentalRate" value="${film.rentalRate}">
            <br>
            <br>
            <label for="filmLength">Length:</label>
            <input type="text" id="filmLength" name="length" value="${film.length}">
            <br>
            <br>
            <label for="filmReplacementCost">Replacement Cost:</label>
            <input type="text" id="filmReplacementCost" name="replacementCost" value="${film.replacementCost}">
            <br>
            <br>
            <label for="filmRating">Rating:</label>
            <input type="text" id="filmRating" name="rating" value="${film.rating}">
            <br>
            <br>
            <label for="filmSpecialFeatures">Special Features:</label>
            <input type="text" id="filmSpecialFeatures" name="specialFeatures" value="${film.specialFeatures}">
            <br>
            <br>
            <label for="filmActors">Actors:</label>
            <input type="text" id="filmActors" name="actors" value="${film.actors}">
            <br>
            <br>
            <button type="submit">Update Film</button>
        </form>
    </c:when>
    <c:otherwise>
        <p>No film details available. Please check the film ID and try again.</p>
    </c:otherwise>
</c:choose>

<a href="index.jsp">Back to Home</a>

</body>
</html>
