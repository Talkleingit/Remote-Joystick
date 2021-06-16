import 'dart:math' as math;

import 'package:flight_simulator_joystick/Model/JoystickModel.dart';
import 'package:flight_simulator_joystick/View/ConnectDisconnectButton.dart';
import 'package:flight_simulator_joystick/View/parameterTexts.dart';
import 'package:flight_simulator_joystick/View/TextFields/IpTextField.dart';
import 'package:flight_simulator_joystick/View/TextFields/PortTextField.dart';
import 'package:flight_simulator_joystick/ViewModel/JoystickViewModel.dart';
import 'package:flutter/material.dart';
import 'View/Joystick.dart';
import 'package:flutter/src/material/slider.dart';
import 'View/Utils.dart';
import './View/Sliders/ThrottleSlider.dart';
import 'View/Sliders/RudderSlider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    JoystickModel model = JoystickModel();
    JoystickViewModel vm = JoystickViewModel(model,
        context); // the viewModel will command the model to pass the data to the flight gear server
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Remote Joystick",
        ),
      ),
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black12, Colors.black12],
            ),
          ),
          child: Column(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IpTextField((value) => vm.bindHost = value),
                    PortTextField((value) => vm.bindPort = int.parse(value)),
                    ConnectDisconnectButton(
                        () => vm.setUpConnection(), () => vm.disconnect()),
                  ]),
              // create a row of throttle then joystick
              Row(
                children: [
                  ThrottleText(),
                  Container(
                    // create throttle slider (middle left)
                    child: ThrottleSlider(vm.setThrottle),
                  ),
                  // create joystick in the middle left part of the screen
                  Joystick((double angle, double distance) {
                    double aileron = AileronUtil.calculate(angle, distance);
                    double elevator = ElevatorUtil.calculate(angle, distance);
                    vm.setAileron(aileron);
                    vm.setElevator(elevator);
                  }),
                ],
              ),
              // Rudder slider: (bottom of the app)
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: RudderSlider(vm.setRudder)),
              RudderText()
            ],
          )),
    );
  }
}
