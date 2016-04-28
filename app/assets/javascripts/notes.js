var deleteCallback = function(event) {
  event.preventDefault();

  var vacationContainer = $('.vacation-container');
  var vacationID = vacationContainer.attr('id');
  var noteID = event.target.id;
  var targetUrl = '/api/vacations/' + vacationID + '/notes/' + noteID;

  $.ajax({
    method: 'DELETE',
    url: targetUrl,
    dataType: 'json'
  }).done(function() {
    $("#note-"+noteID).remove();
  });
};

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
        var noteData = $(data);
        var noteID = noteData.attr('id');

        var html = '<li class="note" id=note-' + noteID + '>' +
            newNoteBody + '<a class="delete-note" id=' + noteID +
            ' href="#">X</a>' + '</li>';

        $('div.notes').prepend(html);
        $('#note_body').val('');
        $('.delete-note').click(deleteCallback);
      }
    });
  });
  $('.delete-note').click(deleteCallback);
});
