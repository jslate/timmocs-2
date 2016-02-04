document.onkeydown = function (e) {
    e = e || window.event;
    if (e.code == 'KeyG') {
      code_container = document.getElementById('code-container');
      if (code_container != null) { code_container.style = 'opacity: 1;'; }
    } else if (e.code == 'ArrowLeft') {
      document.getElementById('previous_link').click();
    } else if (e.code == 'ArrowRight') {
      document.getElementById('next_link').click();
    }
};
