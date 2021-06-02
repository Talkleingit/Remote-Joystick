import "package:flutter/material.dart";

class PortTextField extends StatefulWidget {
  final Function(String) onSubmitLogic;
  PortTextField(this.onSubmitLogic);
  @override
  PortTextFieldState createState() => PortTextFieldState();
}

class PortTextFieldState extends State<PortTextField> {
  double currentRudderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            hintText: "Please insert a port",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        onSubmitted: widget.onSubmitLogic);
  }
}
