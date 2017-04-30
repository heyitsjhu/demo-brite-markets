// Repositions CMP image on initial page load.
$(document).ready(function() {
  if($(window).width() < 1024 ) {
    if(!$('.cmp__subsection').has($('.cmp__bottles')).length) {
      $('.cmp__bottles').insertBefore($('.cmp__title'));
    }
  }
});

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
    $(".flash__container").css( { "display":"none" } );
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

// Change the size of social media icons in footer based on screen size.
document.addEventListener("turbolinks:load", function() {
  $(window).resize(function(){
    if($(window).width() < 769 ) {
      if($('.footer .fa').hasClass('fa-2x')) {
        $('.footer .fa').removeClass('fa-2x');
      }
    } else {
      if(!$('.footer .fa').hasClass('fa-2x')) {
        $('.footer .fa').addClass('fa-2x');
      }
    }
  });
});

// Moves the CMP image depending on screen size.
document.addEventListener("turbolinks:load", function() {
  $(window).resize(function(){
    if($(window).width() < 1024 ) {
      if(!$('.cmp__subsection').has($('.cmp__bottles')).length) {
        $('.cmp__bottles').insertBefore($('.cmp__title'));
      }
    } else {
      if($('.cmp__flex-box').children().length === 1) {
        $('.cmp__flex-box').append($('.cmp__bottles'));
      }
    }
  });
});