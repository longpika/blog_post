// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
$(document).ready(function() {
  $(document).delegate(".del-blog-btn", "click", function(e) {
    e.preventDefault();
    var dom = $(e.currentTarget);
    var id = dom.attr("id");
    $.ajax({
      url: "/blogs",
      type: "DELETE",
      data: {
        id: id
      },
      success: function(respon) {
        dom.closest("li").fadeOut(500);
      }
    })
  });
});
