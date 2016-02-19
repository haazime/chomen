var autoSaveHandler = function() {
  var timeoutId;

  $('textarea[data-auto-save]').keypress(function() {
    var form = $(this).closest('form');

    if (timeoutId) clearTimeout(timeoutId);
    timeoutId = setTimeout(function() {
      $.rails.handleRemote(form);
    }, 1000);
  });
}
