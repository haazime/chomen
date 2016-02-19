var togglePageList = function() {
  $('.ui.sidebar')
    .sidebar('setting', 'transition', 'overlay')
    .sidebar('toggle');
}

var pageListHandler = function() {
  $('a[data-pages-opener]').on('click', function(e) {
    e.preventDefault();
    togglePageList();
  });
}
