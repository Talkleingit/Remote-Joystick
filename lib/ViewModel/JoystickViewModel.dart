//import 'dart:ffi';
import 'package:flight_simulator_joystick/View/ConnectionDialog.dart';
import 'package:flutter/material.dart';
import 'package:flight_simulator_joystick/Model/JoystickModel.dart';

class JoystickViewModel {
  final JoystickModel model;
  final BuildContext context; // the model that will execute commands.
  String host = ""; // the ip of the flight gear
  int port = 0; // the port on which the flight gear server is listening
  /* View model properties: */

  JoystickViewModel(this.model, this.context);

  /*
  *   This function commands the model to set up a connection between the
  *   model and the flight gear with the given ip and port.   
  */
  Future<bool> setUpConnection() async {
    bool isConnected = await this.model.connect(this.host, this.port);
    if (!isConnected) {
      showDialog(context: context, builder: (_) => ConnectionDialog());
    }
    return isConnected;
  }

  /*
  *   This function commands the model to set the new aileron value   
  */
  void setAileron(double aileron) {
    this.model.updateAileron(aileron);
  }

  /*
  *   This function commands the model to set the new elevator value   
  */
  void setElevator(double elevator) {
    this.model.updateElevator(elevator);
  }

  /*
  *   This function commands the model to set the new rudder value   
  */
  void setRudder(double rudder) {
    this.model.updateRudder(rudder);
  }

  /*
  *   This function commands the model to set the new throttle value   
  */
  void setThrottle(double throttle) {
    this.model.updateThrottle(throttle);
  }

  void disconnect() {
    this.model.terminate();
  }

  set bindHost(String value) {
    this.host = value;
  }

  set bindPort(int value) {
    this.port = value;
  }
}
