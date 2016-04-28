
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
      url: targetUrl,
      success: function(data) {
        var note = data
        var html = '<li class="note">' +
            newNoteBody + '<a href="#" class="delete-note" id=' + note.id + '>X</a>' +
          '</li>';

        $('div.notes').prepend(html);
        $('#note_body').val('');
      }
    });

    // request.done(function(msg) {
    //   var note = msg
    //   var html = '<li class="note">' +
    //       newNoteBody + '<a href="#" class="delete-note" id=' + note.id + '>X</a>' +
    //     '</li>';
    //
    //   $('div.notes').prepend(html);
    //   $('#note_body').val('');
    // });
  });

  $('.delete-note').click(function(event) {
    event.preventDefault();

    //var deleteButton = event.target;
    var vacationContainer = $('.vacation-container');
    var vacationID = vacationContainer.attr('id');
    var noteID = $(this).attr('id');
    var targetUrl = '/api/vacations/' + vacationID + '/notes/' + noteID;

    $.ajax({
      method: 'DELETE',
      url: targetUrl,
      dataType: 'json'
    }).done(function() {
      $("#note-"+noteID).remove();
    });
  });
});
