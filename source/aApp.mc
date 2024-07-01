using Toybox.Application as App;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;
import Toybox.Lang;

/**
 * Entry point
 */
class aApp extends App.AppBase {
  // The controller
  protected var controller as aAppController;

  public function initialize() {
    AppBase.initialize();
    controller = new aAppController();
  }

  // Return the initial view of the application
  public function getInitialView() {
    return controller.getInitialApplicationView();
  }

  // Hook called on application start up
  public function onStart(state) as Void {
    Sys.println("App:::START");
  }

  // Hook called on application stop
  public function onStop(state) as Void {
    Sys.println("App:::STOP");
  }

  public function getController() as aAppController {
    return controller;
  }
}
