using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Timer as Timer;
import Toybox.Lang;

class aAppController {
  private var view_index as Number = 0;
  private var view_count as Number = 0;

  public var omniMenuSelectedIndex as Number = 0;
  public var omniMenuChoices as Dictionary = {};

  // Initialize the controller
  public function initialize() {
    //
  }

  public function getInitialApplicationView() as [Ui.View, Ui.BehaviorDelegate] {
    view_index = 0;
    view_count = 0;
    var views = getViewsToTest();
    var view = views[view_index];
    return [view, new TestModeDelegate()];
  }

  private function getViewsToTest() as Array {
    // OmniView choices
    var choices =
      ({
        0 => { "label" => "Option #1", "callback" => null },
        1 => { "label" => "Option #2", "callback" => null },
        2 => { "label" => "Option #3", "callback" => null },
      }) as Dictionary;

    return [new TestModeView(), new OmniMenuView(choices, 0, "What's it gonna be?")];
  }

  public function testModeNextScreen() as Void {
    Sys.println("TESTMODE: next");
    var max = getViewsToTest().size();
    view_index = view_index + 1;
    if (view_index >= max) {
      view_index = 0;
    }
    testModeSetView();
  }

  public function testModePreviousScreen() as Void {
    Sys.println("TESTMODE: prev");
    var max = getViewsToTest().size();
    view_index = view_index - 1;
    if (view_index < 0) {
      view_index = max - 1;
    }
    testModeSetView();
  }

  public function testModeExit() as Void {
    Ui.popView(Ui.SLIDE_DOWN);
  }

  public function testModeSetView() {
    Sys.println("TESTMODE: setting screen: " + view_index);

    // Remove the previous view
    if (view_count > 1) {
      Ui.popView(Ui.SLIDE_DOWN);
      view_count = view_count - 1;
    }

    var views = getViewsToTest();
    var view = views[view_index];
    var deleg = new TestModeDelegate();

    Ui.pushView(view, deleg, Ui.SLIDE_UP);
    view_count = view_count + 1;
  }
  // ===================================================================================================TEST MODE

  // Handle timing out after exit
  public function onExit() {
    Sys.exit();
  }
}
