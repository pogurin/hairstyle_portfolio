$(document).on('ready page:load', function() { //need 'ready page:load' and not .ready so that tourbolinks works and responds with ajax requests to the server

  //incase the browser takes a while saving the comment we disable the button temorarily.
  $('#new_review').on('ajax:beforeSend', function() {
  	$('input[type=submit]').val('Saving....').attr('disabled', 'disabled');
  });

  $('#new_review').on('ajax:complete', function() {
  	$('input[type=submit]').val('Create Review').removeAttr('disabled');
  });
  
  $("#webcam").scriptcam();

 });