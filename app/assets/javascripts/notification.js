$(document).ready(function() {
  setTimeout(function() {
    $('#notice-wrapper').fadeOut('slow', function() {
      $(this).remove();
    });
  }, 4500);
  setTimeout(function() {
    $('#alert-wrapper').fadeOut('slow', function() {
      $(this).remove();
    });
  }, 4500);
});
