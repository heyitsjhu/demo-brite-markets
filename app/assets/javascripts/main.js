$(document).ready(function() {
  $(".flash__close").on( "click", function() {
    $(".flash--success, .flash--alert").css( { "display":"none" } );
  });
});