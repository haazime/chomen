var showState = function(anchor) {
  $('<span id="state" class="ui label"><i class="cloud upload icon"></i> Saved.</span>')
    .appendTo('#state-anchor')
    .fadeIn('fast')
    .delay(1000)
    .fadeOut('fast', function() {
      $(this).remove();
    });
}
