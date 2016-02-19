var stateMessage = '<div class="ui large label"><i class="cloud upload icon"></i> Saved.</div>';

var showState = function() {
  $(stateMessage)
    .appendTo('#state')
    .fadeIn('slow')
    .delay(1000)
    .fadeOut('fast', function() {
      $(this).remove();
    });
}
