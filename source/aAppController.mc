using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Timer as Timer;
import Toybox.Lang;

class aAppController {
  public var omniMenuSelectedIndex as Number = 0;
  public var omniMenuChoices as Dictionary = {};

  // Initialize the controller
  public function initialize() {
    //
  }

  public function getInitialApplicationView() as [Ui.View, Ui.BehaviorDelegate] {
    var choices =
      ({
        0 => { "label" => "Test View", "callback" => method(:OmniMenuOpenTestView) },
        1 => { "label" => "Record Activity", "callback" => method(:OmniMenuOpenRecordActivity) },
        2 => { "label" => "Option #3", "callback" => null },
      }) as Dictionary;

    return [new OmniMenuView(choices, 0, "What's it gonna be?"), new OmniMenuDelegate(method(:GoToPreviousView))];
  }

  public function GoToPreviousView() as Void {
    Ui.popView(Ui.SLIDE_IMMEDIATE);
  }

  public function OmniMenuOpenTestView() as Void {
    Ui.pushView(new TestModeView(), new TestModeDelegate(), Ui.SLIDE_RIGHT);
  }

  public function OmniMenuOpenRecordActivity() as Void {
    Ui.pushView(new RecordActivityView(), new RecordActivityDelegate(), Ui.SLIDE_RIGHT);
  }

  // ===================================================================================================TEST MODE

  // Handle timing out after exit
  public function onExit() {
    Sys.exit();
  }
}
