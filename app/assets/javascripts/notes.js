$(function() {
  $('form#new_note').submit(function(event) {
    event.preventDefault();
    var targetUrl = $(this).attr('action');
    var newNoteBody = $('#note_body').val();
    var newNote = {
      note: {
        body: newNoteBody
      }
    };

    var request = $.ajax({
      method: 'POST',
      data: newNote,
      url: targetUrl
    });

    request.done(function() {
      var html = '<li class="note">' +
          newNoteBody
        '</li>';

      $('div.notes').prepend(html);
      $('#note_body').val('');
    });
  });

  $(function() {
    $('.button_to').click(function(event) {
      event.preventDefault();

      var element = event.target;
      var targetUrl = $(this).attr('action');

      $.ajax({
        method: 'DELETE',
        url: targetUrl,
        dataType: "json"
      }).done(function() {
        $(element).parent().parent().remove();
      });
    });
  });
});
