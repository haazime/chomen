var autoSaveTimeoutId;
var submitForm = function(form) {
  if (autoSaveTimeoutId) clearTimeout(autoSaveTimeoutId);
  autoSaveTimeoutId = setTimeout(function() {
    $.rails.handleRemote(form);
  }, 1000);
}

var autoSaveHandler = function() {
  $('textarea[data-auto-save]').on('input', function() {
    var form = $(this).closest('form');
    submitForm(form);
  });
}
