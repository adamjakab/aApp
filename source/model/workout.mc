using Toybox.Application as App;
using Toybox.System as Sys;
using Toybox.Timer as Timer;
using Toybox.WatchUi as Ui;
using Toybox.ActivityRecording as ActivityRecording;
using Toybox.Activity as Activity;
import Toybox.Lang;

class Workout {
  private var workout_timer as Timer.Timer?;
  private var workout_elapsed_seconds as Number = 0;
  private var session as ActivityRecording.Session?;

  function timerCallback() as Void {
    Sys.println("callback..." + workout_elapsed_seconds);
    workout_elapsed_seconds++;
    Ui.requestUpdate();
  }

  // Initialize the controller
  public function initialize() {
    Sys.println("Workout inited.");
  }

  public function startRecording() {
    if (workout_timer instanceof Timer.Timer) {
      Sys.println("Workout is already recording...");
    } else {
      // Start session
      var workout_sport = PropertyHelper.getProperty("workout_sport", 0);
      var workout_sub_sport = PropertyHelper.getProperty("workout_sub_sport", 0);
      Sys.println("Setting activity type to: " + workout_sport + "/" + workout_sub_sport);
      session = ActivityRecording.createSession({
        :name => "TEST SESSION",
        :sport => workout_sport,
        :subSport => workout_sub_sport,
      });
      session.start();

      workout_timer = new Timer.Timer();
      workout_timer.start(method(:timerCallback), 1000, true);
    }
    Ui.requestUpdate();
  }

  public function stopRecording() {
    workout_timer.stop();
    workout_timer = null;
    workout_elapsed_seconds = 0;
    // Save session
    session.stop();
    self.session.save();
    self.session = null;

    Ui.requestUpdate();
  }

  public function getStatus() {
    return workout_elapsed_seconds;
  }
}
