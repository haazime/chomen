// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require semantic-ui
//= require_tree .

var toggleNoteList = function() {
  $('.ui.sidebar')
    .sidebar('setting', 'transition', 'overlay')
    .sidebar('toggle');
}

var menuHandler = function() {
  $('a[data-notes-opener]').on('click', function() {
    toggleNoteList();
  });
}

$(document).on('page:change', function() {
  menuHandler();
});

/*
var storable = function() {
  $('.storable').focusout(function() {
    var f = $(this).closest('form');
    $.rails.handleRemote(f);
  });
}

$(document).on('page:change', function() {
  menu();
  storable();
});

var updateNoteForm = function(contents) {

  $('#note-form').html(contents.newNoteForm);

  $(contents.newStateLine)
    .appendTo('#state')
    .fadeIn('slow')
    .delay(500)
    .fadeOut('slow', function() {
      $(this).remove();
    });
}
*/
