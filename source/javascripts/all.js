showCode = function() {
  $('.icon-container').css({opacity: 1});
  $('#code-container').css({opacity: 1});
};

document.onkeydown = function (e) {
    e = e || window.event;
    if (e.code == 'KeyG') {
      showCode();
    } else if (e.code == 'ArrowLeft') {
      document.getElementById('previous_link').click();
    } else if (e.code == 'ArrowRight') {
      document.getElementById('next_link').click();
    }
};


$(document).on('ready', function() {
  $('#git-icon').on('click', function(e) {
    e.preventDefault();
    showCode();
  });
});
