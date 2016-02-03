document.onkeypress = function (e) {
    e = e || window.event;
    if (e.code == 'KeyG') {
      document.getElementById('code-container').style = 'opacity: 1;'
    }
};
