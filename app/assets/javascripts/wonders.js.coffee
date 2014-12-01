$(document).ready ->
	$wonderInput = $('#wonderChoosen').find('input')
	if $wonderInput.length == 1
		lat = parseFloat($wonderInput.data('lat'))
		lng = parseFloat($wonderInput.data('lng'))
		map.setCenter new google.maps.LatLng lat, lng
		getPhotos lat, lng, 'medium'

	$('.attributeContainer').on 'keyup', '.dynamicAttributeName', (event) ->
    	nameElem  = $(@)
    	valueElem = nameElem.closest('.row').children('p').children('.text_field')
    	value     = nameElem.val()
    	valueElem.attr('id',          'wonder_properties_' + value       )
    	valueElem.attr('name',        'wonder[properties][' + value + ']')
    	valueElem.attr('placeholder', value + ' için değer giriniz')

   	$('.attributeContainer').on 'click', '.removeRow',  ->
     	$(@).closest('.row').html ''

    $('.addAttribute').on 'click', (e) ->
    	e.preventDefault()
    	contents = "<div class='row'>" + $('.attributeTemplate').html() + '</div>'
    	$(@).before contents
    	$('.showFormButtons').removeClass 'hide'
    $('#wonder_wonder_type_id').change ->
        $('.property').each ->
            if $(@).find('.text_field').data('wtypes').indexOf($('#wonder_wonder_type_id option:selected').text()) != -1
                $(@).removeClass 'hide'
            else
                $(@).addClass 'hide'

    $createMapSearch = $('#createMap')
    if $createMapSearch.length == 1
        markers = []
        input = document.getElementById 'pac-input'
        searchBox = new google.maps.places.SearchBox(input)
        google.maps.event.addListener searchBox, 'places_changed', ->
            places = searchBox.getPlaces()
            if places.length == 0
                return
            if markers.length >0
                for i in [0..markers.length]
                    marker = markers[i]
                    marker.setMap(null)

            markers = []
            bounds = new google.maps.LatLngBounds()
            for i in [0..places.length]
                place = places[i]
                marker = new google.maps.Marker
                    map: @map
                marker.title = place['name']
                console.log place
                marker.position = place['geometry']
                markers.push marker
                bounds.extend(place['geometry'])