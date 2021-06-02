//import 'dart:ffi';

import 'package:flight_simulator_joystick/Model/JoystickModel.dart';

class JoystickViewModel {
  final JoystickModel model;
  String host = "";
  int port = 0;
  JoystickViewModel(this.model);

  void setUpConnection() {
    this.model.connect(this.host, this.port);
  }

  void setAileron(double aileron) {
    this.model.updateAileron(aileron);
  }

  void setElevator(double elevator) {
    this.model.updateElevator(elevator);
  }

  void setRudder(double rudder) {
    this.model.updateRudder(rudder);
  }

  void setThrottle(double throttle) {
    this.model.updateThrottle(throttle);
  }
}
