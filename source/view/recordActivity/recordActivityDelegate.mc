using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Application as App;
import Toybox.Lang;

class RecordActivityDelegate extends Ui.BehaviorDelegate {
  private var ctrl as aAppController;
  private var workout as Workout? = null;

  public function initialize() {
    ctrl = App.getApp().getController();
    BehaviorDelegate.initialize();
  }

  public function onNextPage() {
    // ctrl.testModeNextScreen();
    Ui.requestUpdate();
    return true;
  }

  public function onPreviousPage() {
    // ctrl.testModePreviousScreen();
    Ui.requestUpdate();
    return true;
  }

  public function onMenu() {
    return true;
  }

  public function onBack() {
    // Sys.println("Test mode: Not exiting!");
    workout = ctrl.getNewWorkout();
    workout.stopRecording();
    ctrl.GoToPreviousView();
    return true;
  }

  public function onSelect() {
    Ui.requestUpdate();
    workout = ctrl.getNewWorkout();
    workout.startRecording();
    return true;
  }
}
