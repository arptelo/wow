# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

map = {}
counter = 0
wonderCounter = 0
timerId = 0

initialize = () ->
	mapOptions =
		center: new google.maps.LatLng(50, 15),
		zoom: 4,
		panControl: false,
		zoomControl: false,
		mapTypeControl: false,
		scaleControl: false,
		streetViewControl: false,
		overviewMapControl: false
	map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions)
	google.maps.event.addListener map, 'click', (event) ->
		placeMarker event.latLng
		clearInterval timerId
		getPhotos event.latLng.lat(), event.latLng.lng()

google.maps.event.addDomListener window, 'load', initialize

getRandomInRange = (from, to, fixed) ->
    return (Math.random() * (to - from) + from).toFixed(fixed) * 1

placeMarker = (location) ->
	marker = new google.maps.Marker
		position: location,
		map: map

changeBgImage = (data) ->
	if counter == data.photos.length
		counter = 0
		clearInterval timerId
		nextWonder()
	$('.foto').css 'background', 'url(' + data.photos[counter].photo_file_url + ')'
	$('.foto').css 'background-repeat', 'no-repeat'
	$('.foto').css 'background-size', 'cover'
	$('.foto').css '-webkit-background-size', 'cover'
	$('.foto').css '-moz-background-size', 'cover'
	$('.foto').css '-o-background-size', 'cover'
	$('.foto').css 'background-position', 'center bottom'
	counter++

getPhotos = (lat, lng) ->
	url = 'http://www.panoramio.com/map/get_panoramas.php?set=public&from=0&to=3&minx=' + lng + '&miny=' + lat + '&maxx=' + (lng+0.005) + '&maxy=' + (lat+0.005) + '&callback=?&size=original&mapfilter=false'
	$.getJSON(url, {format: 'jsonp'})
		.done (data) ->
			console.log data.photos.length
			changeBgImage data
			timerId = setInterval ->
				changeBgImage data
			, 10000
		.fail ->
			console.log "Error"

nextWonder = ->
	$wonderInput = $('#info-div').find('input').eq(wonderCounter)
	if wonderCounter == 1
		wonderCounter = 0
	else
		wonderCounter = 1
	console.log $wonderInput.data('lat')
	getPhotos $wonderInput.data('lat'), $wonderInput.data('lng')

$(document).ready ->
	nextWonder()