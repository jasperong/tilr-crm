$(document).ready(function() {
// Live search form
  $('.contacts-search input').keyup(function(e) {
    e.preventDefault();
    $.get($('.contacts-search').attr('action'), $('.contacts-search').serialize(), null, 'script');
  });
});
