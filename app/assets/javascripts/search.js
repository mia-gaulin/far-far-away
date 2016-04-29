$(function() {
  $('#searchBar').hide();
  $('#searchToggle').show();

  $('#searchToggle').click(function(event){
    event.preventDefault();
    $('#searchBar').show(500);
    $('#searchButton').remove();
    $(this).remove();
  });

  // $('.jcarousel').jcarousel({
  //     animation: 'slow'
  // });
  //
  // $('.jcarousel').jcarousel({
  //     animation: {
  //         duration: 800,
  //         easing:   'linear',
  //         complete: function() {
  //         }
  //     }
  // });
});
