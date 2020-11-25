<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	th{text-align: left;}
	div {
  max-width: 800px;
  min-width: 100px;
}
</style>
</head>
<body>
<h1>Details</h1>
<table>
<thead>
<tr>
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