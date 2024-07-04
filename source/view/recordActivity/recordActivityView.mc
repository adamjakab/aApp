import Toybox.Lang;
using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;

class RecordActivityView extends Ui.View {
  private var app;
  private var ctrl as aAppController;

  // Strings
  private var str_testing;

  public function initialize() {
    View.initialize();
    app = App.getApp();
    ctrl = App.getApp().getController();
  }

  // Set up the layout
  public function onLayout(dc) {
    // Strings
  }

  // Update the view
  function onUpdate(dc) {
    var txt, color;
    var width = dc.getWidth();
    var height = dc.getHeight();

    Sys.println("update...");

    //** clear screen
    dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
    dc.clear();

    // Text
    txt = "Activity";
    dc.setColor(Gfx.COLOR_ORANGE, Gfx.COLOR_TRANSPARENT);
    dc.drawText(width / 2, 5, Gfx.FONT_SYSTEM_LARGE, txt, Gfx.TEXT_JUSTIFY_CENTER);

    // Elapsed WO seconds
    var workout = ctrl.getNewWorkout();
    txt = workout.getStatus();
    dc.setColor(Gfx.COLOR_PINK, Gfx.COLOR_TRANSPARENT);
    dc.drawText(width / 2, 70, Gfx.FONT_NUMBER_THAI_HOT, txt, Gfx.TEXT_JUSTIFY_CENTER);

    AppHelper.drawScreenGuides(dc);
  }
}
