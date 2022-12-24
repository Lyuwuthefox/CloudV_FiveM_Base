let music = new Audio('./assets/mp3/music.mp3');
let lastVolume = "";

$(document).ready(function () {
  window.addEventListener('message', function(event) {
    if (event.data.eventName == 'loadProgress') {
      const progress = parseInt(event.data.loadFraction * 100);
      $('.bar-inner').css('width', progress + '%');
      $('#progress').text(progress + '%');
    }
  });
  
  music.play();
  music.volume = '0.2';

  $(document).on('wheel', function (event) {
    if (music.pause && event.originalEvent.deltaY < 0) music.play();
    if (music.volume == 0) music.pause();

    music.volume = clamp((Math.floor((music.volume + event.originalEvent.deltaY * -0.001) * 100) / 100), 0, 1);
  });

  $(document).on('keydown', function (event) {
    if (event.code == "Space") {
      if (music.paused) {
        music.volume = lastVolume;
        music.play();
      } else {
        lastVolume = music.volume;
        music.volume = 0;
        music.pause();
      }
    }
  });
});

window.addEventListener('DOMContentLoaded', () => {
  $('#name').text(window.nuiHandoverData.name);
  $('#job').html(window.nuiHandoverData.job);
  $('#group').text(window.nuiHandoverData.group);
  $('#money').text(window.nuiHandoverData.money);
  $('#bank').text(window.nuiHandoverData.bank);
  $('#playtime').text(window.nuiHandoverData.playtime);
  $('#playercount').text(window.nuiHandoverData.playercount);
});

function clamp(val, min, max) {
  return val > max ? max : val < min ? min : val;
}