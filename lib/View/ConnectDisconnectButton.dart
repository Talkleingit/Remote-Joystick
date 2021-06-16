import "package:flutter/material.dart";

class ConnectDisconnectButton extends StatefulWidget {
  final Function() onConnect;
  final Function() onDisconnect;

  ConnectDisconnectButton(this.onConnect, this.onDisconnect);
  @override
  _ConnectDisconnectButtonState createState() =>
      _ConnectDisconnectButtonState();
}

class _ConnectDisconnectButtonState extends State<ConnectDisconnectButton> {
  bool wasPressed = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: !this.wasPressed ? Colors.white24 : Colors.red, // background
          onPrimary:
              !this.wasPressed ? Colors.deepPurple : Colors.black, // foreground
          padding: !this.wasPressed
              ? EdgeInsets.symmetric(horizontal: 155, vertical: 10)
              : EdgeInsets.symmetric(horizontal: 145, vertical: 10),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      onPressed: () {
        !this.wasPressed ? widget.onConnect() : widget.onDisconnect();
        setState(() {
          this.wasPressed = !this.wasPressed;
        });
      },
      child: !this.wasPressed ? Text('Connect') : Text('Disconnect'),
    );
  }
}
