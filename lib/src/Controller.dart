import 'package:mvc_pattern/mvc_pattern.dart';

class Controller extends ControllerMVC {
  /// Singleton factory
  factory Controller() {
    if (_this == null) {
      _this = Controller._internal();
    }
    return _this;
  }

  Controller._internal();

  /// Single instance of the [Controller] class
  static Controller _this;

  /// The controller that all views will communicate with
  static get con => _this;
}
