<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	th{text-align: left;
	border: 1px solid;}
	td{text-align: left;
	border: 1px solid;}
	div {
  max-width: 800px;
  min-width: 100px;
}
img {
  border: 1px solid #ddd; /* Gray border */
  border-radius: 4px;  /* Rounded border */
  padding: 5px; /* Some padding */
  width: 150px; /* Set a small width */
}
</style>
</head>
<body>
<a href="/">HomePage</a><br /><br /><br />
<h1>Details</h1>
<table rules="all" border=1px solid>
<thead>
<tr>
<th>Poster</th>
<th>Title</th>
<th>Rating</th>
<th>Released</th>
<th>Genre</th>
<th>Run-time</th>
<th></th>
</tr>
</thead>
<tbody>
<tr>
<td><img src="https://image.tmdb.org/t/p/w500/${ movie.poster_path} "></td>
<td>${ movie.title }</td>
<td>${movie.vote_average }</td>
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