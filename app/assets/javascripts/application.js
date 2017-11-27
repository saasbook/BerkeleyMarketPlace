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
//= require filterrific/filterrific-jquery
//= require materialize-sprockets
//= require turbolinks
//= require_tree .

// for turbolink lazy loading, replace $(document).ready
$(document).on('turbolinks:load', function() {
  $('select').material_select();
  $(".button-collapse").sideNav({closeOnClick: true});
  $('.carousel.carousel-slider').carousel({fullWidth: true});
  // $('#category-tab').tabs({onShow: function(current_tab) {
  //   $.ajax({
  //     url: "/",
  //     type: "GET",
  //     data: {
  //       filterrific: {
  //         choose_category: current_tab.selector.substring(1)
  //       }
  //     },
  //     dataType: "script"
  //   })
  // }});
  // $('[id^=home-subcategory]').click(function(data) {
  //   event.preventDefault();
  //   console.log(data.currentTarget.id)
  // })
})