<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
img {
	border: 1px solid #ddd; /* Gray border */
	border-radius: 4px; /* Rounded border */
	padding: 5px; /* Some padding */
	width: 150px; /* Set a small width */
}
</style>
</head>
<body>
	<a href="/">HomePage</a>
	<br />
	<br />
	<br />
	<h1>Welcome</h1>
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
					<tr>
						<c:forEach var="movie" items="${ movielist}">
							<td><img
								src="https://image.tmdb.org/t/p/w500/${ movie.poster_path}">
								<br /> <a id="moviename" href="/details/${movie.getId()}">${movie.getTitle() }</a></td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
No Movie to Display
</c:otherwise>
	</c:choose>
</body>
<script>
	
</script>
</html>