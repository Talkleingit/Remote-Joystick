import 'dart:math' as math;

import 'package:flight_simulator_joystick/Model/JoystickModel.dart';
import 'package:flight_simulator_joystick/View/parameterTexts.dart';
import 'package:flight_simulator_joystick/View/IpTextField.dart';
import 'package:flight_simulator_joystick/View/PortTextField.dart';
import 'package:flight_simulator_joystick/ViewModel/JoystickViewModel.dart';
import 'View/PortTextField.dart';
import 'package:flutter/material.dart';
import 'View/Joystick.dart';
import 'package:flutter/src/material/slider.dart';
import 'View/Utils.dart';
import './View//ThrottleSlider.dart';
import './View/RudderSlider.dart';

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
    JoystickViewModel vm = JoystickViewModel(model);
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
                    // ip input
                    IpTextField((value) {
                      vm.host = value;
                      print("ip given is: " + vm.host);
                    }),
                    // port input
                    PortTextField((value) {
                      vm.port = int.parse(value);
                      print("port given is: " + vm.port.toString());
                    }),
                    // connect button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white24, // background
                          onPrimary: Colors.deepPurple, // foreground
                          padding: EdgeInsets.symmetric(
                              horizontal: 155, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        vm.setUpConnection();
                        print("Established connection");
                      },
                      child: Text('Connect'),
                    ),
                  ]),
              Row(
                children: [
                  ThrottleText(),
                  Container(
                    margin: EdgeInsets.only(top: 1),
                    // throttle slider (middle left)
                    child: ThrottleSlider(vm.setThrottle),
                  ),
                  // Joystick - placed middle right
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

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
