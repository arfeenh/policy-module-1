<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% final String KEY = "AIzaSyBNWWOyq-ZuQG04HIN2rRXaM5I2-pkwHgM"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My APIs</title>
<style>
#apiPage {
	text-align: center;
}
#map {
	height: 100%;
}
#mapApiSection {
	width: 800px;
	height: 500px;
	margin: 0 auto;
	padding: 0;
}
#searchInput {
	font-size: 12pt;
	width: 500px;
	padding: 5px 10px;
}
</style>
</head>
<body>
	<div id="apiPage">
		<div id="mapApiSection">
			<h1>Search on the map</h1>
			<input type="text" id="searchInput" placeholder="Search here...">
			<div id="map"></div>
		</div>
	</div>
	<script src="../javascript/myapi.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=<%= KEY %>&libraries=places&callback=initAutocomplete"
    async defer></script>
</body>
</html>