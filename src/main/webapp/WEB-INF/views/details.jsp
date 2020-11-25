<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Details</h1>
<table>
<thead>
<tr>
<th>Movie Title</th>
<th>
</tr>
</thead>
<tbody>
<tr>
<td>${ movie.title }</td>
<td><a href="/addtowatchlist/${movie.getId()}">
    <input type="button" value="Add to WatchList" />
</a></td>
</tr>
</tbody>
</table>
</body>
</html>