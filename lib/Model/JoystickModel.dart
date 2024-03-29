import 'dart:io';
import 'package:executor/executor.dart';

class JoystickModel {
  final Executor executor = Executor(concurrency: 1); // the task executor
  late Socket socket; // flight gear socket
  bool isConnected = false;

  /*
   *  This function connects to the flight gear over a web socket channel using 
   *  the given ip and port.
  */
  Future<bool> connect(String host, int port) async {
    try {
      this.socket =
          await Socket.connect(host, port, timeout: Duration(seconds: 1));
      isConnected = true;
      return true;
    } on SocketException {
      isConnected = false;
      return false;
    }
  }

  /*
   *  This function is in charge of sending the message to the flight gear in 
   *  a task in the pool thread (done by executor) 
   */

  void send(String message) {
    this.executor.scheduleTask(() => socket.write(message));
  }

  /*
   *  This function sends the aileron value in the correct format   
  */
  void updateAileron(double aileron) {
    this.send("set /controls/flight/aileron " + aileron.toString() + "\r\n");
  }

  /*
   *  This function sends the elevator value in the correct format   
  */
  void updateElevator(double elevator) {
    this.send("set /controls/flight/elevator " + elevator.toString() + "\r\n");
  }

  /*
   *  This function sends the rudder value in the correct format    
  */
  void updateRudder(double rudder) {
    this.send("set /controls/flight/rudder " + rudder.toString() + "\r\n");
  }

  /*
   *  This function sends the throtlte value in the correct format    
  */
  void updateThrottle(double throttle) {
    this.send("set /controls/engines/current-engine/throttle " +
        throttle.toString() +
        "\r\n");
  }

  /*
   *  This function closes the the websocket channel,
   *  awaits until all threads finish their tasks and then closes
   *  the pool.
   */
  void terminate() {
    this.executor.join(withWaiting: true); // await all threads to end tasks
    this.socket.flush();
    this.socket.close();
  }

  void closePool() {
    this.executor.close(); // closes the executor.
  }
}
