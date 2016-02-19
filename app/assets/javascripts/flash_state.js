var showState = function(content) {
  $(content)
    .appendTo('#state')
    .fadeIn('slow')
    .delay(1000)
    .fadeOut('fast', function() {
      $(this).remove();
    });
}
