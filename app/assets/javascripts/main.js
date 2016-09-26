// Checks for existing session, creating one if none exist.
document.addEventListener("turbolinks:load", function() {
  if (sessionStorage.getItem("brite-markets") !== "true") {
    $(".popup").css( { "display":"flex" } );
    sessionStorage.setItem("brite-markets", "true");
  };
});

// Closes the pop up message.
document.addEventListener("turbolinks:load", function() {
  $(".popup").on("click", function() {
    $(".popup").css( {"display":"none"} );
  });
});

// Closes the flash message.
document.addEventListener("turbolinks:load", function() {
  $(".flash__close").on( "click", function() {
    $(".flash--success, .flash--alert").css( { "display":"none" } );
  });
});
