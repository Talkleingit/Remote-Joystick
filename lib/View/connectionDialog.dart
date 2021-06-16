import 'package:flutter/material.dart';

class ConnectionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(35),
      title: Text(
        "Socket Error",
        style: TextStyle(color: Colors.red, fontSize: 20),
        textAlign: TextAlign.center,
      ),
      content: Text("Please open FlightGear app"),
      elevation: 25,
    );
  }
}
