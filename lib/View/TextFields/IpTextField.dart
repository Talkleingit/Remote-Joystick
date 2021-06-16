import "package:flutter/material.dart";

class IpTextField extends StatefulWidget {
  final Function(String) onSubmitLogic;
  IpTextField(this.onSubmitLogic);

  @override
  IpTextFieldState createState() => IpTextFieldState();
}

class IpTextFieldState extends State<IpTextField> {
  double currentRudderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Please insert an IP address",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onSubmitted: widget.onSubmitLogic,
    );
  }
}
