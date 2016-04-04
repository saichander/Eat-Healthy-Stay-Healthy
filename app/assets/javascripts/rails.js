$(document).ready(function() {
  var bar = $('.progress-bar');
  if (bar.width() > 100) {
    $('.progress-bar').addClass('progress-bar-danger');
  }
  else{
  $('.progress-bar').removeClass('progress-bar-danger')
  }
  }
);
