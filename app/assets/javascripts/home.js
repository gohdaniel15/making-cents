$(document).ready(function() {
  $(window).on("scroll", function () {
      if ($(this).scrollTop() > 50) {
          $(".navbar").addClass("not-transparent");
      }
      else {
          $(".navbar").removeClass("not-transparent");
      }
  });
});
