$(document).on('ready page:load', function() { //need 'ready page:load' and not .ready so that tourbolinks works and responds with ajax requests to the server
  // $("#new_link").click(function(event) {
  //   event.preventDeafault();
  //   $('#login_user').show()
  // })


 // 	$('#user_log_in').click(function(event) {
 //  	event.preventDeafault();
	// 	$("#login_user").show();
	// 	$("#user_log_in").hide()
	// });



  //incase the browser takes a while saving the comment we disable the button temorarily.
  $('#new_review').on('ajax:beforeSend', function() {
    $('input[type=submit]').val('Saving....').attr('disabled', 'disabled');
  });

  //re-enable the submit button after saving
  $('#new_review').on('ajax:complete', function() {
    $('input[type=submit]').val('Create Review').removeAttr('disabled');
  });
  
  $(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
  });


  $('#search-form').submit(function(event) {
    event.preventDeafault();
    var searchValue = $('#search').val();

    $.getScript('/hairdressers?search=' + searchValue);
      
  });
  
});



// $(document).on("change", 'input[type="radio"]', function(){
//     if($(this).val = "1") { 
//          $("#button1").slideUp("slow");
//     }else{
//        	 $("#button2").slideUp("slow");
//     };
// });

// I want to connect ruby function and Javascript.
// Can we change another page status by using Javascript? 