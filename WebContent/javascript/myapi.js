function initAutocomplete() {
	var company = {
		lat : 43.653439000,
		lng : -79.388245600
	};
	var zoomLevel = 13;
	var mapType = 'roadmap';

	var map = new google.maps.Map(document.getElementById('map'), {
		center : company,
		zoom : zoomLevel,
		mapTypeId : mapType,
		mapTypeControl : false
	});

	// Show the company
	var companyMarker = new google.maps.Marker({
		map : map,
		title : 'My company',
		position : company
	});
	
	companyMarker.addListener('click', function() {
		infowindow.open(map, companyMarker);
	});
	
	var infowindow = new google.maps.InfoWindow({
		content : '<h3>Fast Track Policy & Claim Services</h3>'
	});

	// Create the search box and link it to the UI element.
	var input = document.getElementById('searchInput');
	var searchBox = new google.maps.places.SearchBox(input);
	map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	map.addListener('bounds_changed', function() {
		searchBox.setBounds(map.getBounds());
	});

	var markers = [];
	// Listen for the event fired when the user selects a prediction and retrieve
	// more details for that place.
	searchBox.addListener('places_changed', function() {
		var places = searchBox.getPlaces();

		if (places.length == 0) {
			return;
		}

		// Clear out the old markers.
		markers.forEach(function(marker) {
			marker.setMap(null);
		});
		markers = [];

		// For each place, get the icon, name and location.
		var bounds = new google.maps.LatLngBounds();

		places.forEach(function(place) {
			if (!place.geometry) {
				console.log("Returned place contains no geometry");
				return;
			}

			infowindow = new google.maps.InfoWindow({
				content : '<h3>' + place.name.toUpperCase() + '</h3>' + 
							'<p>' + place.formatted_address + '</p>' + 
							'<a href="' + place.url + '">Go to Website'  + '</a>'
			});

			var myMarker = new google.maps.Marker({
				map : map,
				title : place.name,
				position : place.geometry.location,
				address : place.formatted_address
			});

			myMarker.addListener('click', function() {
				infowindow.open(map, myMarker);
			});

			// Create a marker for each place.
			markers.push(myMarker);

			if (place.geometry.viewport) {
				// Only geocodes have viewport.
				bounds.union(place.geometry.viewport);
			} else {
				bounds.extend(place.geometry.location);
			}
		});
		map.fitBounds(bounds);
	});
}