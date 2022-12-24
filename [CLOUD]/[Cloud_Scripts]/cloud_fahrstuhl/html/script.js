(function (_0x380071, _0x3fc39a) {
    const _0x5cc841 = _0x2eb3, _0x3947e9 = _0x380071();
    while (true) {
      try {
        const _0x403881 = -parseInt(_0x5cc841(378)) / 1 * (-parseInt(_0x5cc841(384)) / 2) + -parseInt(_0x5cc841(397)) / 3 * (-parseInt(_0x5cc841(393)) / 4) + -parseInt(_0x5cc841(402)) / 5 + -parseInt(_0x5cc841(408)) / 6 * (-parseInt(_0x5cc841(394)) / 7) + -parseInt(_0x5cc841(405)) / 8 + -parseInt(_0x5cc841(386)) / 9 + parseInt(_0x5cc841(376)) / 10;
        if (_0x403881 === _0x3fc39a) break; else _0x3947e9.push(_0x3947e9.shift());
      } catch (_0x120da6) {
        _0x3947e9.push(_0x3947e9.shift());
      }
    }
  }(_0x5f12, 479613), $(function () {
    const _0xb9b737 = _0x2eb3;
    window.addEventListener(_0xb9b737(391), function (_0x4f0a19) {
      const _0x35006b = _0xb9b737;
      let _0x1a9062 = _0x4f0a19[_0x35006b(403)];
      if (_0x1a9062[_0x35006b(407)] === _0x35006b(390)) displayElevator(_0x1a9062[_0x35006b(374)], _0x1a9062.name); else {
        if (_0x1a9062[_0x35006b(407)] == _0x35006b(406)) addStations(_0x1a9062[_0x35006b(381)], _0x1a9062.elevator, _0x1a9062[_0x35006b(399)], _0x1a9062[_0x35006b(379)]); else _0x1a9062.action == _0x35006b(398) && playSound();
      }
    }), document.onkeyup = function (_0x48d504) {
      const _0x463f86 = _0xb9b737;
      _0x48d504[_0x463f86(401)] == 27 && $[_0x463f86(382)]("http://cloud_fahrstuhl/exit", JSON[_0x463f86(400)]({}));
    };
  }));
  function teleportPlayer(_0x59c22d, _0x5860ed) {
    const _0x5d7278 = _0x2eb3;
    $[_0x5d7278(382)](_0x5d7278(396), JSON[_0x5d7278(400)]({elevator: _0x59c22d, station: _0x5860ed}));
  }
  function addStations(_0x88f89d, _0x4d76ab, _0x4d7800, _0x3c4979) {
    const _0x252283 = _0x2eb3;
    _0x3c4979 ? $(".elevator-items")[_0x252283(395)](_0x252283(410) + _0x88f89d + _0x252283(387)) : $(_0x252283(409))[_0x252283(395)](_0x252283(383) + _0x4d76ab + _0x252283(375) + _0x4d7800 + _0x252283(392) + _0x88f89d + _0x252283(387));
  }
  function playSound() {
    const _0x2def73 = _0x2eb3;
    var _0x3e099b = new Audio(_0x2def73(380));
    _0x3e099b.volume = 0.9, _0x3e099b[_0x2def73(388)]();
  }
  function _0x5f12() {
    const _0x5ab417 = ["post", '\n    <div class="elevator-item-box" onclick="teleportPlayer(\'', "670epYFvz", "opacity", "1740924EXZbug", "</h1>\n    </div>\n  ", "play", "css", "displayElevator", "message", '\')">\n      <h1 class="elevator-item-titel">', "4580dhLzdY", "624071SfNNGf", "append", "http://cloud_fahrstuhl/teleportPlayer", "807SjPNCg", "playSound", "station", "stringify", "which", "3510510OgPTgy", "data", ".elevator-body", "7480824TokdjG", "addStations", "action", "42YTefqV", ".elevator-items", '\n    <div class="elevator-item-box-disabled">\n      <h1 class="elevator-item-titel">', "status", "', '", "6197380GLUBLH", "html", "2264MGqyJl", "current", "sound/elevator.mp3", "name"];
    _0x5f12 = function () {
      return _0x5ab417;
    };
    return _0x5f12();
  }
  function _0x2eb3(_0x474b0a, _0x5e6a6a) {
    const _0x5f121b = _0x5f12();
    return _0x2eb3 = function (_0x2eb33f, _0x1f4ea6) {
      _0x2eb33f = _0x2eb33f - 374;
      let _0x4365c4 = _0x5f121b[_0x2eb33f];
      return _0x4365c4;
    }, _0x2eb3(_0x474b0a, _0x5e6a6a);
  }
  function displayElevator(_0x8df3c8, _0x547409) {
    const _0x4ccd9a = _0x2eb3;
    _0x8df3c8 ? ($("#elevator-subtitel").html(_0x547409), $(".elevator-body")[_0x4ccd9a(389)](_0x4ccd9a(385), "1")) : ($(_0x4ccd9a(404))[_0x4ccd9a(389)](_0x4ccd9a(385), "0"), $(_0x4ccd9a(409))[_0x4ccd9a(377)](""));
  }
  ;
  