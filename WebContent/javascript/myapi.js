function initAutocomplete() {
	var cLat = 43.653439000;
	var cLng = -79.388245600;
	
	var company = {
		lat : cLat,
		lng : cLng
	};
	getWeather(cLat, cLng);
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

	var markers = [];
	// Listen for the event fired when the user selects a prediction 
	// and retrieve more details for that place.
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
		var placeName, placeAddr, placeUrl;
		var lat, lng, weather;

		places.forEach(function(place) {
			if (!place.geometry) {
				console.log("Returned place contains no geometry");
				return;
			}

			placeName = place.name.toUpperCase();
			placeAddr = place.formatted_address.split(',');
			placeUrl = place.url;
			
			lat = place.geometry.location.lat();
			lng = place.geometry.location.lng();
			
			var formatedAddr = '';
			
			for(let i=0; i<placeAddr.length; i++) {
				formatedAddr += placeAddr[i] + '<br/>';
			}
			 
			
			infowindow = new google.maps.InfoWindow({
				content : '<h3>' + placeName + '</h3>' + 
							'<p>' + formatedAddr + '</p>' + 
							'<a href="' + placeUrl + '" target="_blank">View on Google Maps</a>'
			});

			var myMarker = new google.maps.Marker({
				map : map,
				title : place.name,
				position : place.geometry.location,
				address : place.formatted_address
			});

			myMarker.addListener('click', function() {
				infowindow.open(map, myMarker);
				weather = getWeather(lat, lng);
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

const weatherImg = document.querySelector('#weatherImg');
const unsplashReq = 'https://source.unsplash.com/random?weather,';

function getWeather(lat, lng) {
	const appid = '47b174982f04ffa1ea5cb631aba10bb7';
	const url = 'https://api.openweathermap.org/data/2.5/weather?lat='+lat+'&lon='+lng+'&appid='+appid;
	
	
	fetch(url)
		.then(function(response) {
			return response.json();
		})
		.then(function(data) {
		  
		var weather = data.weather[0].main;
		console.log(unsplashReq + weather);
		weatherImg.src = unsplashReq + weather;
	});
}

const backBtn = document.querySelector('#goBackFromApi');
backBtn.addEventListener('click', function() {
	window.location.href = "admin.jsp";
});