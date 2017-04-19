$(document).on('turbolinks:load ajaxSuccess', function() {
	// code for the index's alerts and notices
  $(".modified-alert").slideDown(500).delay(10000).slideUp(500);

  refreshProductRating();
  validateContactMessage();
  addZoomToProductImage();
});

var refreshProductRating = function() {
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
}

var validateContactMessage = function () {
  $('#contact-button').on('click', function() {
    $('#error_message').html('');
    $('#message').css('border', '');
    $('#email').css('border', '');

    var err_count = 0;
    var inputEmail = $('#email').val();
    var inputMsg = $('#message').val();

    if(inputEmail === '' || inputMsg === '') {
      if(inputMsg === '') {
        $('#message').css('border', '3px solid #c00');
        $('#message').focus();
        err_count += 1;
      }
      if(inputEmail === '') {
        $('#email').css('border', '3px solid #c00');
        $('#email').focus();
        err_count += 1;
      }

      $('#error_message').html("<div id='error_explanation'><h2>" + err_count + " value(s) missing.</h2></div>");
      return false;
    }
    else
      return true;
  });
};

var addZoomToProductImage = function () {
  $('.img-zoom').elevateZoom({
    zoomType: 'inner',
    zoomWindowFadeIn: 500,
    zoomWindowFadeOut: 500,
    cursor: 'crosshair'
  });
};
