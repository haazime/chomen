var setupSweetConfirm = function() {
  $('a[data-sweet-confirm]').on('click', function(e) {
    e.preventDefault();
    e.stopPropagation();

    var $link = $(this);

    swal({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then(function() {
      $.rails.handleMethod($link);
    }, function(dismiss) {})
  });
};
