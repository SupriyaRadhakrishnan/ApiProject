<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
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
        <a class="nav-link" href="/watchlist">Watchlist</a>
      </li>
    </ul>
    <form method="post" action="/searchbymoviename" class="form-inline my-2 my-lg-0">
      <input name="moviename" class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

	<h1>Search Criteria : </h1>
	<br />
	
<form method="post" action="/search">
	<label for="rating">Rating: </label> <input id="rating" type="number" name="rating" value=0 required/><br />
    <label for="length">Length: </label> <input id="length" type="number" name="length" value=0 required/><br />
    <label for="genre">Genre </label>
      <select id="genre" name="genre">
       <option value=""></option>
      <c:forEach var="gen" items="${genre}">
    <option value="${gen.id}">${gen.name}</option>
</c:forEach>

 </select>
 <br />
   <input value="Search" type="submit">
</form>


		
	

</body>
</html>