<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/spacelab/bootstrap.min.css" integrity="sha384-F1AY0h4TrtJ8OCUQYOzhcFzUTxSOxuaaJ4BeagvyQL8N9mE4hrXjdDsNx249NpEc" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Movie Details</title>
<style>
	div {
  max-width: 800px;
  min-width: 100px;
}
#poster{
  border: 1px solid #ddd; /* Gray border */
  border-radius: 4px;  /* Rounded border */
  padding: 5px; /* Some padding */
  width: 150px; /* Set a small width */
}
</style>
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
        <a class="nav-link" href="/watchlist">Watchlist</a>
      </li>
    </ul>
    <form method="post" action="/searchbymoviename" class="form-inline my-2 my-lg-0">
      <input name="moviename" class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>


<br />

<table rules="all" border=1px solid>
<thead>
<tr>
<th>Poster</th>
<th>Title</th>
<th>Rating</th>
<th>Released</th>
<th>Genre</th>
<th>Run-time</th>
<th>Watch Later?</th>
</tr>
</thead>
<tbody>
<tr>
<td><img id="poster" src="https://image.tmdb.org/t/p/w500/${ movie.poster_path} "></td>
<td>${ movie.title }</td>
<td>${movie.vote_average } /10</td>
<td>${ movie.release_date }</td>
<td><c:forEach var="genre" items="${movie.genres }">${genre.getName() }, </c:forEach></td>
<td>${ movie.runtime } mins</td>
<td><a href="/addtowatchlist/${movie.getId()}">
    <input type="button" value="Add to WatchList" />
</a></td>
</tr>
</tbody>
</table>
<h4>Summary:</h4><br />
<div>${movie.overview }</div>
</body>
</html>