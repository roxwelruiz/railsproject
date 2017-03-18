$(document).on('turbolinks:load', function() {

	// code for the index's alerts and notices
  $(".modified-alert").delay(10000).slideUp(500);

  // code for the new comment rating
  $('.rating').raty({path: '/assets', scoreName: 'comment[rating]'});

  // code for the comments already rated
  $('.rated').raty({
  	path: '/assets',
  	readOnly: true,
  	score: function() {
  		return $(this).attr('data-score');
  	}
  });
});
