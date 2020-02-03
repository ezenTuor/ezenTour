<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="UTF-8">

<!-- 지도에 보여지는 결과를 보고 싶으면 주석단 css교체 -->

<style type="text/css">
	#map{
		height: 100%;
		margin-top: 40px;
		width: 440px;
		visibility: hidden; /*visible*/
	}
	html, body{
		height: 100%;
		margin: 0;
		padding: 0;
	}
	body{
		padding: 0 !important;
	}
	table{
		font-size: 12px;
	}
	.hotel-search{
		-webkit-box-align: center;
		-ms-flex-align: center;
		align-items: center;
		background: #fff;
		display: -webkit-box;
		display: -ms-flexbox;
		display: flex;
		left: 0;
		position: absolute;
		top: 0;
		width: 440px;
		z-index: 1;
	}
	#listing{
		position: absolute;
		width: 440px; /*200px*/
		height: 470px; /*100%*/
		overflow: auto;
		left: 0px; /*442px*/
		top: 20px; /*0px*/
		cursor: pointer;
		overflow-x: hidden;
		/*margin-top:223px;*/
	}
	#findhotels{
		font-size: 14px;
	}
	#locationField{
		-webkit-box-flex: 1 1 190px;
		-ms-flex: 1 1 190px;
		flex: 1 1 190px;
		margin: 0 8px;
	}
	#controls{
		-webkit-box-flex: 1 1 140px;
		-ms-flex: 1 1 140px;
		flex: 1 1 140px;
	}
	#autocomplete{
		width: 100%;
	}
	#country{
		width: 100%;
	}
	.placeIcon{
		width: 20px;
		height: 34px;
		margin: 4px;
	}
	.hotelIcon{
		width: 24px;
		height: 24px;
	}
	#resultsTable{
		border-collapse: collapse;
		width: 440px; /*240px*/
	}
	#rating{
		font-size: 13px;
		font-family: Arial Unicode MS;
	}
	.iw_table_row{
		height: 18px;
	}
	.iw_attribute_name{
		font-weight: bold;
		text-align: right;
	}
	.iw_table_icon{
		text-align: right;
	}
</style>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDigNPpU6BKFnXsX1Ai-YNTQpVT-z2nlIU" async defer></script>
<script type="text/javascript">
	var map, places, infoWindow;
	var markers=[];
	var autocomplete;
	var countryRestrict={'country' : 'kr'};
	var MARKER_PATH='https://developers.google.com/maps/documentation/javascript/images/marker_green';
	var hostnameRegexp=new RegExp('^https?://.+?/');
	
	//각 지역 위치
	var countries={
		'kr':{
			center:{lat: 35.3, lng:127.8},
			zoom: 6
		},
		'au':{
			center:{lat: -25.3, lng: 133.8},
			zoom: 4
		},
		'br':{
			center:{lat: -14.2, lng: -51.9},
			zoom: 3
		},
		'ca':{
			center:{lat: 62, lng: -110.0},
			zoom: 3
		},
		'fr':{
			center:{lat: 46.2, lng: 2.2},
			zoom: 5
		},
		'de':{
			center:{lat: 51.2, lng: 10.4},
			zoom: 5
		},
		'mx':{
			center:{lat: 23.6, lng: -102.5},
			zoom: 4
		},
		'nz':{
			center:{lat: -40.9, lng: 174.9},
			zoom: 5
		},
		'it':{
			center:{lat: 41.9, lng: 12.6},
			zoom: 5
		},
		'za':{
			center:{lat: -30.6, lng: 22.9},
			zoom: 5
		},
		'es':{
			center:{lat: 40.5, lng: -3.7},
			zoom: 5
		},
		'pt':{
			center:{lat: 39.4, lng: -8.2},
			zoom: 6
		},
		'us':{
			center:{lat: 37.1, lng: -95.7},
			zoom: 3
		},
		'uk':{
			center:{lat: 54.8, lng: -4.6},
			zoom: 5
		}
	};

	//맵 생성과 설정
	function initMap(){
		map = new google.maps.Map(document.getElementById('map'), {
			zoom: countries['kr'].zoom,
			center: countries['kr'].center,
			mapTypeControl: false,
			panControl: false,
			zoomControl: false,
			streetViewControl: false
		});

		infoWindow = new google.maps.InfoWindow({
			content: document.getElementById('info-content')
		});

		autocomplete = new google.maps.places.Autocomplete((document.getElementById('autocomplete')), {
			  types: ['(cities)'], componentRestrictions: countryRestrict
		});
		places = new google.maps.places.PlacesService(map);

		autocomplete.addListener('place_changed', onPlaceChanged);

		document.getElementById('country').addEventListener('change', setAutocompleteCountry);
	}

	//변경되는 위치 정보
	function onPlaceChanged(){
		var place = autocomplete.getPlace();
		if(place.geometry){
			map.panTo(place.geometry.location);
			map.setZoom(15);
			search();
		}else{
			document.getElementById('autocomplete').placeholder = 'Enter a city';
		}
	}

	//해당지역 숙박업소 찾기
	function search(){
		var search={
			bounds: map.getBounds(),
			types: ['lodging']
		};

		places.nearbySearch(search, function(results, status){
			if(status === google.maps.places.PlacesServiceStatus.OK){
				clearResults();
				clearMarkers();
				for(var i=0; i<results.length; i++){
					var markerLetter = String.fromCharCode('A'.charCodeAt(0)+(i%26));
					var markerIcon = MARKER_PATH+markerLetter+'.png';
					markers[i] = new google.maps.Marker({
						position: results[i].geometry.location,
						animation: google.maps.Animation.DROP,
						icon: markerIcon
					});
					markers[i].placeResult = results[i];
					google.maps.event.addListener(markers[i], 'click', showInfoWindow);
					setTimeout(dropMarker(i), i*100);
					addResult(results[i], i);
				}
			}
		});
	}

	//마커 지우기
	function clearMarkers(){
		for (var i=0; i<markers.length; i++){
			if(markers[i]){
				markers[i].setMap(null);
			}
		}
		markers=[];
	}

	//변경되는 위치 값
	function setAutocompleteCountry(){
		var country = document.getElementById('country').value;
			if(country == 'all'){
				autocomplete.setComponentRestrictions({'country' : []});
				map.setCenter({lat: 15, lng: 0});
				map.setZoom(2);
			}else{
				autocomplete.setComponentRestrictions({'country' : country});
				map.setCenter(countries[country].center);
				map.setZoom(countries[country].zoom);
			}
		clearResults();
		clearMarkers();
	}

	//마커 뿌리기
	function dropMarker(i){
		return function(){
			markers[i].setMap(map);
		};
	}

	//검색 후 list에 뿌리기
	function addResult(result, i){
		var results = document.getElementById('results');
		var markerLetter = String.fromCharCode('A'.charCodeAt(0)+(i%26));
		var markerIcon = MARKER_PATH+markerLetter+'.png';
		
		var tr = document.createElement('tr');
		tr.style.backgroundColor = (i%2 === 0 ? '#F0F0F0' : '#FFFFFF');
		tr.onclick = function(){
			google.maps.event.trigger(markers[i], 'click');
		};
		
		var iconTd = document.createElement('td');
		var nameTd = document.createElement('td');
		var icon = document.createElement('img');
		icon.src = markerIcon;
		icon.setAttribute('class', 'placeIcon');
		icon.setAttribute('className', 'placeIcon');
		var name = document.createTextNode(result.name);
		iconTd.appendChild(icon);
		nameTd.appendChild(name);
		tr.appendChild(iconTd);
		tr.appendChild(nameTd);
		results.appendChild(tr);
	}

	//list값 지우기
	function clearResults(){
		var results = document.getElementById('results');
		while(results.childNodes[0]){
			results.removeChild(results.childNodes[0]);
		}
	}

	//리스트에서 클릭하면, 맵에 상세정보 보여주기
	function showInfoWindow(){
		var marker = this;
		places.getDetails({placeId: marker.placeResult.place_id}, function(place, status){
			if(status!==google.maps.places.PlacesServiceStatus.OK){
				return;
			}
			infoWindow.open(map, marker);
			buildIWContent(place);
			
			/* document.getElementById('results').innerHTML='<a href="'+place.url+'">'+place.name+'</a>'; */
			location.href=place.url;
		});
	}

	//상세정보
	function buildIWContent(place){
		document.getElementById('iw-icon').innerHTML='<img class="hotelIcon" '+'src="'+place.icon+'"/>';
		document.getElementById('iw-url').innerHTML='<b><a href="'+place.url+'">'+place.name+'</a></b>';
		document.getElementById('iw-address').textContent = place.vicinity;

		if(place.formatted_phone_number){
			document.getElementById('iw-phone-row').style.display='';
			document.getElementById('iw-phone').textContent = place.formatted_phone_number;
		}else{
			document.getElementById('iw-phone-row').style.display='none';
		}
	
		if(place.rating){
			var ratingHtml='';
			for(var i=0; i<5; i++){
				if(place.rating<(i+0.5)){
					ratingHtml+='&#10025;';
				}else{
					ratingHtml+='&#10029;';
				}
				document.getElementById('iw-rating-row').style.display='';
				document.getElementById('iw-rating').innerHTML = ratingHtml;
			}
		}else{
			document.getElementById('iw-rating-row').style.display='none';
		}
	
		if(place.website){
			var fullUrl = place.website;
			var website = hostnameRegexp.exec(place.website);
			if(website === null){
				website = 'http://'+place.website+'/';
				fullUrl = website;
			}
			document.getElementById('iw-website-row').style.display='';
			document.getElementById('iw-website').textContent = website;
		}else{
			document.getElementById('iw-website-row').style.display='none';
		}
	}
</script>

</head>

<body>
	<div class="hotel-search">
		<div id="findhotels">
			Find hotels in:
		</div>
		
		<div id="locationField">
			<input id="autocomplete" placeholder="Enter a city" type="text" />
		</div>
		
		<div id="controls">
			<select id="country">
				<option value="all">All</option>
				<option value="kr" selected>Korea</option>
				<option value="au">Australia</option>
				<option value="br">Brazil</option>
				<option value="ca">Canada</option>
				<option value="fr">France</option>
				<option value="de">Germany</option>
				<option value="mx">Mexico</option>
				<option value="nz">New Zealand</option>
				<option value="it">Italy</option>
				<option value="za">South Africa</option>
				<option value="es">Spain</option>
				<option value="pt">Portugal</option>
				<option value="us">U.S.A.</option>
				<option value="uk">United Kingdom</option>
			</select>
		</div>
	</div>

	<div id="map"></div>

	<div id="listing">
		<table id="resultsTable">
			<tbody id="results"></tbody>
		</table>
	</div>

	<div style="display: none">
		<div id="info-content">
			<table>
				<tr id="iw-url-row" class="iw_table_row">
					<td id="iw-icon" class="iw_table_icon"></td>
					<td id="iw-url"></td>
				</tr>
				<tr id="iw-address-row" class="iw_table_row">
					<td class="iw_attribute_name">Address:</td>
					<td id="iw-address"></td>
				</tr>
				<tr id="iw-phone-row" class="iw_table_row">
					<td class="iw_attribute_name">Telephone:</td>
					<td id="iw-phone"></td>
				</tr>
				<tr id="iw-rating-row" class="iw_table_row">
					<td class="iw_attribute_name">Rating:</td>
					<td id="iw-rating"></td>
				</tr>
				<tr id="iw-website-row" class="iw_table_row">
					<td class="iw_attribute_name">Website:</td>
					<td id="iw-website"></td>
				</tr>
			</table>
		</div>
	</div>
  </body>
</html>