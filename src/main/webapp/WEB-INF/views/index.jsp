<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
</head>
<body>
	<h1>Index Page</h1>
	

	<c:forEach var="movie" items="${movielist }">
		${movie.title}<br />
	</c:forEach>
	
		<h2>${movie.original_title }</h2>
<form method="post" action="/index">
	Rating: <input type="text" name="rating"/>
    Length: <input type="text" name="Length"/>
    Genre: <input type="text" name="Genre"/>

   <input type="submit">
</form>


		
	

</body>
</html>