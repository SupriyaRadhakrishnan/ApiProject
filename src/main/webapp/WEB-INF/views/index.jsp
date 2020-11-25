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
	<h1>Search Criteria : </h1>
	<a href="/watchlist" >WatchList</a>
	<br /><br /><br />
	
<form method="post" action="/search">
	Rating: <input type="number" name="rating" value=0 required/><br />
    Length: <input type="number" name="length" value=0 required/><br />
    Genre
      <select id="genre" name="genre">
       <option value=""></option>
      <c:forEach var="gen" items="${genre}">
    <option value="${gen.id}">${gen.name}</option>
</c:forEach>

 </select>
   <input type="submit">
</form>


		
	

</body>
</html>