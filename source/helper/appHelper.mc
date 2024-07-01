// using Toybox.System as Sys;
using Toybox.Application as App;
using Toybox.Lang as Lang;
using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Math as Math;

module AppHelper {
  public function getFormattedTime(total_seconds) {
    var min = Math.floor(total_seconds / 60);
    var sec = total_seconds - 60 * min;
    if (sec < 10) {
      sec = Lang.format("0$1$", [sec]);
    }
    return Lang.format("$1$:$2$", [min, sec]);
  }

  public function drawScreenGuides(dc) {
    var screen_width = dc.getWidth();
    var screen_height = dc.getHeight();
    var centerX = screen_width / 2;
    var centerY = screen_height / 2;

    dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);

    //HORIZONTAL line
    dc.drawLine(0, centerY, screen_width, centerY);

    //VERTICAL line
    dc.drawLine(centerX, 0, centerX, screen_height);
  }
}
