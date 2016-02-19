var autoSaveTimeoutId;
var autoSave = function(element) {
  var form = $(element).closest('form');

  if (autoSaveTimeoutId) clearTimeout(autoSaveTimeoutId);
  autoSaveTimeoutId = setTimeout(function() {
    $.rails.handleRemote(form);
  }, 1500);
}

var excludeKeyCodes = [9,16,18,17,27,37,38,39,40,91,93];
var autoSaveHandler = function() {
  $('textarea[data-auto-save]').on('keydown', function(e) {
    var is_skip = jQuery.grep(excludeKeyCodes, function(ex) { return ex == e.keyCode; })
    if (is_skip.length == 0) {
      autoSave(this);
    }
  });
}
