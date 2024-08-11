<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Film Site</title>
</head>
<body>

	<h1>Welcome To The Film Site</h1>

	<!--  TODO form with filmId field and button, action="getFilm.do" -->

	<h2>Film Details</h2>
	<form action="GetFilmById.do" method="GET">
		<label for="filmId">Enter film ID:</label> <input type="text"
			id="filmId" name="filmId">
		<button type="submit">Get film details</button>
	</form>
	<br>
	<br>
	<br>
	<br>
	<h2>Add Film</h2>
	<form action="AddFilm.do" method="POST">
		<label for="filmTitle">Title: (required)</label> 
		<input type="text" id="filmTitle" name="title" required>
			<br> 
			<br> 
		<label for="filmDescription">Description:</label> 
		<input type="text" id="filmDescription" name="description"> 
			<br> 
			<br>
		<label for="filmReleaseYear">Release Year:</label> 
		<input type="number" id="filmReleaseYear" name="releaseYear"> 
			<br> 
			<br>
		<label for="filmLanguageId">Language ID:</label> 
		<input type="number" id="filmLanguageId" name="languageId" value=1> 
			<br> 
			<br>
		<label for="filmLanguage">Language:</label> 
		<input type="text" id="filmLanguage" name="language"> 
			<br> 
			<br> 
	<!-- 	<label for="filmRentalDuration">Rental Duration:</label> 
		<input type="number" id="filmRentalDuration" name="rentalDuration"> 
			<br> 
			<br>
		<label for="filmRentalRate">Rental Rate:</label> 
		<input type="number" id="filmRentalRate" name="rentalRate"> 
			<br> 
			<br>
		<label for="filmLength">Film Length (in minutes):</label> 
		<input type="number" id="filmLength" name="length"> 
			<br> 
			<br> 
		<label for="filmReplacementCost">Replacement Cost:</label> 
		<input type="number" id="filmReplacementCost" name="replacementCost">
			
		<br> 
		<br> 
		<label for="filmRating">Film Rating:</label> 
		<input type="text" id="filmRating" name="rating"> 
			<br> 
			<br>
		<label for="filmSpecialFeatures">Special Features:</label> 
		<input type="text" id="filmSpecialFeatures" name="specialFeatures">
		<br> 
		<br>  -->
	<!-- 	<label for="filmActors">Actors:</label> 
		<input type="text" id="filmActors" name="actors"> 
			<br> 
			<br> -->

		<button type="submit">Add film</button>
	</form>
	<br>
	<br>
	<br>
	<br>
	<h2>Search For Film Using Keyword In Title</h2>
	<form action="GetFilmByKeyword.do" method="GET">
		<label for="keyword">Keyword in title or description:</label> <input
			type="text" id="keyword" name="keyword">
		<button type="submit">Search</button>
	</form>
</body>
</html>
