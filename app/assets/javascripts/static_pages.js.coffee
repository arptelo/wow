# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@map = {}
marker = {}
counter = 0
wonderCounter = 0
timerId = 0

@initialize = () ->
	mapOptions =
		center: new google.maps.LatLng(50, 15),
		zoom: 4,
		panControl: false,
		zoomControl: false,
		mapTypeControl: false,
		scaleControl: false,
		streetViewControl: false,
		overviewMapControl: false
	@map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions)
	marker = new google.maps.Marker
		map: @map
	google.maps.event.addListener @map, 'click', (event) ->
		placeMarker event.latLng.lat(), event.latLng.lng()
		clearInterval timerId
		getPhotos event.latLng.lat(), event.latLng.lng(), $('.foto'), $('#info-div'), true
		$('#wonder_lat').val(event.latLng.lat())
		$('#wonder_lng').val(event.latLng.lng())

@placeMarker = (lat, lng) ->
	location = new google.maps.LatLng(lat, lng)
	marker.setPosition location
	@map.setCenter new google.maps.LatLng location.lat(), location.lng()

changeBgImage = ($fotoDiv, $infoDiv, data) ->
	if counter == data.photos.length
		counter = 0
		nextWonder()
	else
		$fotoDiv.css 'background-image', 'url(' + data.photos[counter].photo_file_url + ')'
		$infoDiv.find('#pOwner').html($infoDiv.find('input').eq(wonderCounter-1).data('name') + "<br>" + data.photos[counter].photo_title + "<br>Fotoğraf Sahibi: " + data.photos[counter].owner_name)
		counter++

@getPhotos = (lat, lng, $fotoDiv, $infoDiv, putMarker = false) ->
	url = 'http://www.panoramio.com/map/get_panoramas.php?set=public&from=0&to=3&minx=' + lng + '&miny=' + lat + '&maxx=' + (lng+0.005) + '&maxy=' + (lat+0.005) + '&callback=?&size=original&mapfilter=false'
	$.getJSON(url, {format: 'jsonp'})
		.done (data) ->
			if putMarker
				placeMarker lat, lng
			changeBgImage $fotoDiv, $infoDiv, data
			clearInterval timerId
			timerId = setInterval ->
				changeBgImage $fotoDiv, $infoDiv, data
			, 10000
		.fail ->
			console.log "Error"

nextWonder = ->
	$wonderInput = $('#info-div').find('input')
	if $wonderInput.length > 0
		getPhotos parseFloat($wonderInput.eq(wonderCounter).data('lat')), parseFloat($wonderInput.eq(wonderCounter).data('lng')), $('.foto'), $('#info-div'), true
		if wonderCounter == $wonderInput.length-1
			wonderCounter = 0
		else
			wonderCounter++

$(document).ready ->
	initialize()
	nextWonder()