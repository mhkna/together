// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require bootstrap
//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require clipboard
//= require_tree .

let approaching = false

$(document).ready(function() {

  $('#timer').on('DOMSubtreeModified', function() {
    const myTime = $('#timer').text();
    if (myTime === "00:01" && approaching === false) {
      approaching = true;
      return;
    }
    if (myTime === "00:00" && approaching) {
      approaching = false
      const status = $('#round-status').text();
      if (status === "round begins") {
        const roundId = $('#round-id').text().trim();
        document.location.href = "/rounds/" + roundId;
      } else if (status === "IN PROGRESS") {
        document.location.href = "/accounts/new";
      }
    }
  })

  var clipboard = new Clipboard('.clipboard-btn');
  console.log(clipboard);
})
