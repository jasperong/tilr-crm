$(document).ready(function() {
  $('.pagination li').on('click','.pagination a', function(e) {
    e.preventDefault();
    $.get($('.pagination a').href, null, null, 'script');
    return false;
  });

  $('.contacts-search input').keyup(function(e) {
    e.preventDefault();
    $.get($('.contacts-search').attr('action'), $('.contacts-search').serialize(), null, 'script');
  });
});
