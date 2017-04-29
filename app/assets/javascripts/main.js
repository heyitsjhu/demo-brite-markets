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

// Toggle navbar menu on smaller screens
document.addEventListener("turbolinks:load", function() {
  $(".menu__icon").on("click", function() {
      $(".navbar__nav").toggleClass("show");
      $(this).toggleClass("primary_color");
  });
});

document.addEventListener("turbolinks:load", function() {
  $(document).on("click", function(e) {
    if(!$(event.target).closest('.menu__icon').length) {
      if($(".navbar__nav").hasClass("show")) {
        $(".navbar__nav").removeClass("show");
        $(".menu__icon").removeClass("primary_color");
      }
    }
  });
});