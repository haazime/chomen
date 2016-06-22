var setupSortable = function() {
  var list = document.querySelector('.sortable-list');
  if ($(list).length <= 0) {
    return;
  }

  var sortableList = Sortable.create(list, {
    draggable: '.sortable-item',
    scroll: true,
    animation: 100,
    handle: '.sortable-handle',
    ghostClass: 'sortable-ghost',
    onEnd: function(e) {
      $.ajax({
          type: 'PUT',
          url: $(e.item).data('sort-url'),
          dataType: 'json',
          data: { pos: e.newIndex },
      });
    }
  });
};
