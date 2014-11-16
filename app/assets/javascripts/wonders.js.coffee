$(document).ready ->
	$wonderInput = $('#wonderChoosen').find('input')
	if $wonderInput.length == 1
		lat = parseFloat($wonderInput.data('lat'))
		lng = parseFloat($wonderInput.data('lng'))
		map.setCenter new google.maps.LatLng lat, lng
		getPhotos lat, lng, $('.foto'), $('#fotoInfo'), false, 'medium'

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

    $('.addAttribute').on 'click', (e) ->
    	e.preventDefault()
    	contents = "<div class='row'>" + $('.attributeTemplate').html() + '</div>'
    	$(this).before(contents)
    	$('.showFormButtons').removeClass 'hide'