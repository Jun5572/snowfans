// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require semantic-ui
//= require activestorage
//= require turbolinks
//= require jquery.turbolinks
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja
//= require_tree .


	// $('#calendar').fullCalendar({
	// 	// events: '/events.json',
	// 	selectable: 'true',
	// 	selectHelper: 'true',
	// 	dayClick: function(date, jsEvent, view){
	// 		var day = moment(date).format('YYYY/MM/DD');
	// 		console.log(day);
	// 	}
	// });


// fullcalendar関連
// $(document).ready(function(){
//   $('#calendar').fullCalendar({
//   });
// });

// flashメッセージfadeOut
$(function(){
		$('#flash').slideDown('slow');
	setTimeout(function(){
		$('#flash').slideUp('slow');
	}, 2000);
});






