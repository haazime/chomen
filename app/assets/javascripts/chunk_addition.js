var chunkAdditionHandler = function() {
  $(document).on('click', 'a[data-chunk-adder]', function(e) {
    e.preventDefault();

    var currentChunkCount = parseInt($(this).attr('data-chunk-count'));
    var newChunkCount = currentChunkCount + 1;
    $(this).attr('data-chunk-count', newChunkCount);

    var base = $('.chunk-segment').last();
    var clone = $(base).clone();
    $(clone).find('input[name="chunk_number"]').val(newChunkCount);
    $(clone).find('textarea').val('');
    $(clone).find('.chunk-actions').html('');
    $(clone).insertAfter($(base));
  });
}
