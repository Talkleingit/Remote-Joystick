import 'package:flight_simulator_joystick/ViewModel/JoystickViewModel.dart';
import 'package:vector_math/vector_math.dart' as vectors;
import 'dart:math' as math;

class AileronUtil {
  /*
   *  This function checks from which quarter the angle was given and corrects
   *  the angle accordingly.  
   */
  static double determineAngle(double angle) {
    if (angle >= 0.0 && angle <= 90.0) {
      // first quarter case
      return 90.0 - angle;
    } else if (angle > 90 && angle <= 180) {
      // second quarter case
      return angle - 90.0; // rearanged expression: 90 - (angle - 90)
    } else if (angle > 180 && angle <= 270) {
      // third quarter case
      return 270.0 - angle; // rearanged expression: 90 - (angle - 180)
    }
    // fourth quarter case
    return angle - 270.0;
  }

  /*
   *  This function determines the needed sign (of the x values) 
   *  according to the angle.
   */
  static int determineSign(double angle) {
    return (angle >= 0 && angle <= 180) ? 1 : -1;
  }

  /*
   *  given the angle and distance the function calculates the aileron.
   */
  static calculate(double angle, double distance) {
    return AileronUtil.determineSign(angle) *
        distance *
        math.cos(vectors.radians(AileronUtil.determineAngle(angle)));
  }
}

class ElevatorUtil {
  /*
   *  This function checks from which quarter the angle was given and corrects
   *  the angle accordingly.   
   */
  static double determineAngle(double angle) {
    if (angle >= 0 && angle <= 90) {
      //first quarter
      return angle;
    } else if (angle > 90 && angle <= 180) {
      //second quarter
      return 180.0 - angle;
    } else if (angle > 180 && angle <= 270) {
      //third quarter
      return angle - 180.0;
    }
    //fourth quarter
    return 360.0 - angle; // expression simplified: 90 - (angle - 270.0)
  }

  /*
   *  This function determines the needed sign (of the y values) 
   *  according to the angle.   
   */
  static int determineSign(double angle) {
    return (angle > 90 && angle < 270) ? -1 : 1;
  }

  /*
   *  Given the angle and distance from the center of the circle, this 
   *  function calculates the elevator value. 
   */
  static double calculate(double angle, double distance) {
    return ElevatorUtil.determineSign(angle) *
        distance *
        math.cos(vectors.radians(ElevatorUtil.determineAngle(angle)));
  }
}
