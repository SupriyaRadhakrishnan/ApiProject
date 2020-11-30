<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
<h1>Details</h1>
<table>
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
</tr>
</tbody>
</table>
<h4>Summary:</h4><br />
<div>${movie.overview }</div><br /><br />
<a href="/watchlist">
    <input type="button" value="Back" />
</a>
</body>
</html>