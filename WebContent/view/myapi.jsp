<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% final String KEY = "AIzaSyBNWWOyq-ZuQG04HIN2rRXaM5I2-pkwHgM"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Google Map</title>
<style>
#map {
	height: 90vh;
	width: 70vw;
	margin: 20px;
	text-align: center;
}
#mapApiSection {
	height: 90vh;
	width: 90vw;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}
#search {
	width: 50vw;
	height: 85vh;
	margin: 20px 0;
	padding: 0 20px 20px 20px;
	display: flex;
 	flex-direction: column;
 	align-items: center;
}
#searchInput {
	text-align: left;
	font-size: 12pt;
	height: 25px;
	width: 400px;
	padding: 5px 20px;
	margin: 0 auto;
}
#weatherImg {
	width: 350px;
	height: 350px;
	margin: 30px auto;
}
#goBackFromApi {
	height: 40px;
	width: 80px;
	margin: 30px auto;
}
</style>
</head>
<body>
	<div id="mapApiSection">
		<div id="map"></div>
		<div id="search">
			<input type="text" id="searchInput" placeholder="Entering your search here ..." autofocus>
			<img id="weatherImg" src=""></img>
			<button id="goBackFromApi" type="button">Go Back</button>
		</div>
	</div>
	<script src="../javascript/myapi.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=<%= KEY %>&libraries=places&callback=initAutocomplete"
    async defer></script>
</body>
</html>