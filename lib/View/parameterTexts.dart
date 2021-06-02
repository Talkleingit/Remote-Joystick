import 'package:flutter/material.dart';

class RudderText extends StatelessWidget {
  const RudderText();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10),
      child: Text("Rudder",
          style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xFF677381))),
    );
  }
}

class ThrottleText extends StatelessWidget {
  const ThrottleText();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 125, left: 7),
        child: RotatedBox(
          quarterTurns: 3,
          child: Text("Throttle",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF677381))),
        ));
  }
}
