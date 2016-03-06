var createChunkSegment = function(base, number) {
  var clone = base.clone();
  clone.attr('id', 'chunk-segment-' + number);
  clone.find('input[name="chunk[number]"]').val(number);
  clone.find('input[name="chunk[gcid]"]').val('');
  clone.find('textarea').val('');
  clone.find('.chunk-actions').html('');
  return clone;
}

var chunkAdditionHandler = function() {
  $(document).on('click', 'a[data-chunk-adder]', function(e) {
    e.preventDefault();

    var maxChunkNumber = parseInt($(this).attr('data-chunk-count'));
    var newChunkNumber = maxChunkNumber + 1;
    $(this).attr('data-chunk-count', newChunkNumber);

    var base = $('.chunk-segment').last();
    createChunkSegment(base, newChunkNumber).insertAfter(base);
  });
}
