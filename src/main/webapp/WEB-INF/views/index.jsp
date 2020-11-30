<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

<style>
#poster {
	border: 1px solid #ddd; /* Gray border */
	border-radius: 4px; /* Rounded border */
	padding: 5px; /* Some padding */
	width: 150px; /* Set a small width */
}
</style>
<link href="/css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/spacelab/bootstrap.min.css" integrity="sha384-F1AY0h4TrtJ8OCUQYOzhcFzUTxSOxuaaJ4BeagvyQL8N9mE4hrXjdDsNx249NpEc" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Index</title>
</head>
<body>
<img src="https://drive.google.com/uc?id=1rRPPhEy0mEZq1ttXDxiTv6xuJt2IfjXE"/>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/watchlist">My Watchlist</a>
      </li>
    </ul>
    <form method="post" action="/searchbymoviename" class="form-inline my-2 my-lg-0">
      <input name="moviename" class="form-control mr-sm-2" type="text" placeholder="Search by movie name">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
	<br />
	<img src="https://drive.google.com/uc?id=1OB26pWZ9R6Kpa6WiS24CqaKCIQvxUw1O" />
	<br />

<form method="post" action="/search">
<table>
<tbody>
	<tr> <td> <label for="rating">Rating: </label></td> <td><input id="rating" type="number" name="rating" value=0 required/></td></tr>
    <tr> <td><label for="length">Length: </label></td> <td> <input id="length" type="number" name="length" value=0 required/></td></tr>
   <tr><td> <label for="genre">Genre: </label> </td> <td>
      <select id="genre" name="genre">
       <option value=""></option>
      <c:forEach var="gen" items="${genre}">
    <option value="${gen.id}">${gen.name}</option>
</c:forEach>
 </select></td></tr>
   <tr><td></td><td><input value="Search" type="submit"></td></tr>
   </tbody>
</table>
</form>

<br /><br />
<img src="https://drive.google.com/uc?id=1JpO6LiNVtyREKF89Bb2aA6qxAfvkDKHQ" />

	<c:choose>
		<c:when test="${fn:length(movielist) >0}">

			<table>
				<thead>
					<tr>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="movie" items="${ movielist}">
						<tr>
							<c:choose>
								<c:when test="${not empty movie.poster_path}">
									<td><img id="poster"
										src="https://image.tmdb.org/t/p/w500/${ movie.poster_path}"></td>
										<td> <a id="moviename" href="/details/${movie.getId()}">${movie.getTitle() }</a><br />Rating: ${movie.getVote_average() }/10 </td>
								</c:when>
								<c:otherwise>
									<td><img id="poster" src="images/No Image to Display.png"></td>
									<td><a id="moviename" href="/details/${movie.getId()}">${movie.getTitle() } </a><br />Rating: ${movie.getVote_average() }/10</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</c:when>
		<c:otherwise>
No Movie to Display
</c:otherwise>
	</c:choose>
		
	

</body>
</html>