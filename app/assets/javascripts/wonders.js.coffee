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

	$('#createMap').find('input').each ->
		console.log $(@).data('lat')
		placeMarker $(@).data('lat'), $(@).data('lng')

	$('.attributeContainer').delegate '.dynamicAttributeName', 'keyup', (event) ->
    	nameElem  = $(@)
    	valueElem = nameElem.closest('.row').children('p').children('.text_field')
    	value     = nameElem.val()
    	valueElem.attr('id',          'wonder_properties_' + value       )
    	valueElem.attr('name',        'wonder[properties][' + value + ']')
    	valueElem.attr('placeholder', value + ' için değer giriniz')

   	$('.attributeContainer').delegate '.removeRow', 'click', ->
     	console.log($(this).closest('.row'))
     	$(this).closest('.row').html('');

    $('.addAttribute').on 'click', ->
     	contents = "<div class='row'>" + $('.attributeTemplate').html() + '</div>'
     	$(this).before(contents)