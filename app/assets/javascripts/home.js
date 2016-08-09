$(document).ready(function() {
  debugger;
  console.log('hello');
  $(window).on("scroll", function () {
      if ($(this).scrollTop() > 100) {
          $(".topNav").addClass("not-transparent");
      }
      else {
          $("#header").removeClass("not-transparent");
      }
  });
});
