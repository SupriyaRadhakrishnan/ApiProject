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
</head>
<body>
<h1>Display</h1>
<c:choose>
<c:when test="${fn:length(movielist) >0}">
<table>
<thead>
<tr>
<th>Movie Title</th>
<th></th>
</tr>
</thead>
<tbody>
<c:forEach var="movie" items="${ movielist}">
<tr>
<td><a href="/details/${movie.getId()}">${movie.getTitle() }</a></td>
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