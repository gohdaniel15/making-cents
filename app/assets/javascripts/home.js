$(document).on('turbolinks:load', function() {
  console.log("Javascript loaded successfully");
  $(window).on("scroll", function () {
      if ($(this).scrollTop() > 50) {
          $(".navbar").addClass("not-transparent");
      }
      else {
          $(".navbar").removeClass("not-transparent");
      }
  });

  $(".signinButton").click(function() {
    $(".signinBox").slideToggle('slow');
    $('.blur-page').fadeIn('slow');
  });

  $(".blur-page").click(function() {
    $(".signinBox").slideToggle('slow');
    $('.blur-page').fadeOut('slow');
  });
});
