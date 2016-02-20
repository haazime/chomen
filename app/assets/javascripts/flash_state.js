var showState = function() {
  $('#state')
    .fadeIn('fast')
    .delay(1000)
    .fadeOut('fast', function() {
      $(this).hide();
    });
}
