import "package:flutter/material.dart";
import 'package:control_pad/control_pad.dart';

class Joystick extends StatefulWidget {
  final Function(double, double) onChangeLogic;
  Joystick(this.onChangeLogic);
  @override
  JoystickState createState() => JoystickState();
}

class JoystickState extends State<Joystick> {
  double currentRudderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150, right: 20),
      child: JoystickView(
        size: 270,
        backgroundColor: Colors.black26,
        innerCircleColor: Color(0xFF677381),
        onDirectionChanged: widget.onChangeLogic,
      ),
    );
  }
}
