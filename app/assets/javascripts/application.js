// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require foundation
//= require jquery.lettering.min.js
//= require jquery.textillate.js
//= require cocoon
//= require best_in_place
//= require masonry/jquery.masonry
//= require masonry/box-maker
//= require masonry/jquery.loremimages.min
//= require_tree .

// require_tree calls every javascript files.

$(function(){ $(document).foundation(); });

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();


  /* Activate animation */
 //  $('.more').on('click', function(e) {
	// 	e.preventDefault();
	// 	var href = $(this).attr('href');
	// 	if ($('#searchContainer').is(':visible')) {
	// 		$('#searchContainer').css({ displa	y:'block' }).animate({ height:'0' }).empty();
	// 	}
	// 	$('#searchContainer').css({ display:'block' }).animate({ height:'200px' },function() {
	// 		$('#searchContainer').load('http://example.com/slide-fade-content.html ' + href, function() {
	// 			$('#searchContainer').hide().fadeIn('slow'));
	// 		});
	// 	});
	// });
});

