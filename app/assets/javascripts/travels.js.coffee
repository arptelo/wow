$(document).ready ->
	$('.routeIndexCon a').click (e) ->
		e.preventDefault();
	$('#addRoute-modal-lg').on 'shown.bs.modal', ->
		google.maps.event.trigger map, "resize"