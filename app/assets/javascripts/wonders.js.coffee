$(document).ready ->
	initialize()
	$wonderInput = $('#wonderChoosen').find('input')
	if $wonderInput.length == 1
		map.setZoom 19
		map.setMapTypeId google.maps.MapTypeId.SATELLITE
		lat = parseFloat($wonderInput.data('lat'))
		lng = parseFloat($wonderInput.data('lng'))
		map.setCenter new google.maps.LatLng lat, lng
		getPhotos lat, lng, $('.foto'), $('#fotoInfo'), false, 'medium'