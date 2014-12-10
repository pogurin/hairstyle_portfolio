$(document).on('ready page:load', function() { //need 'ready page:load' and not .ready so that tourbolinks works and responds with ajax requests to the server
 
  //incase the browser takes a while saving the comment we disable the button temorarily.
  $('#new_review').on('ajax:beforeSend', function() {
    $('input[type=submit]').val('Saving....').attr('disabled', 'disabled');
  });

  //re-enable the submit button after saving
  $('#new_review').on('ajax:complete', function() {
    $('input[type=submit]').val('Create Review').removeAttr('disabled');
  });
  
});


window.onload = function() {
	navigator.getUserMedia = (navigator.getUserMedia ||
		navigator.webkitGetUserMedia ||
		navigator.mozGetUserMedia ||
		navigator.msGetUserMedia);

	if (navigator.getUserMedia) {
		navigator.getUserMedia(
			{
				video: true
			},
			function(localMediaStream) {
				var vid = document.getElementById('camera-stream');
				vid.src = window.URL.createObjectURL(localMediaStream);
			},

			function(err) {
				console.log('The following error occured when trying to use getUserMedia: ' + err);
			}
		);

	} else {
		alert('Sorry, your browser does not support getUserMedia');
	}

}
