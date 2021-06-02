import 'package:vector_math/vector_math.dart' as vectors;
import 'dart:math' as math;

class AileronUtil {
  /*
   *  This function checks from which quarter the angle was given and corrects
   *  the angle accordingly.  
   */
  static double determineAngle(double angle) {
    if (angle >= 0.0 && angle <= 90.0) {
      return 90.0 - angle;
    } else if (angle > 90 && angle <= 180) {
      return angle - 90.0; // 90 - (angle - 90)
    } else if (angle > 180 && angle <= 270) {
      return 270.0 - angle; // 90 - (angle - 90)
    }
    return angle - 270.0;
  }

  /*
   *  This function determines the sign of the direction according to the angle.
   */
  static int determineSign(double angle) {
    return (angle >= 0 && angle <= 180) ? 1 : -1;
  }

  static calculate(double angle, double distance) {
    return AileronUtil.determineSign(angle) *
        distance *
        math.cos(vectors.radians(AileronUtil.determineAngle(angle)));
  }
}

enum Quarter { first, second, third, fourth }

class ElevatorUtil {
  static double determineAngle(double angle) {
    if (angle >= 0 && angle <= 90) {
      return angle;
    } else if (angle > 90 && angle <= 180) {
      return 180.0 - angle;
    } else if (angle > 180 && angle <= 270) {
      return angle - 180.0;
    }
    return angle - 270.0;
  }

  static Quarter determineQuarter(double angle) {
    if (angle >= 0 && angle <= 90) {
      return Quarter.first;
    } else if (angle > 90 && angle <= 180) {
      return Quarter.second;
    } else if (angle > 180 && angle <= 270) {
      return Quarter.third;
    }
    return Quarter.fourth;
  }

  static int determineSign(double angle) {
    return (angle > 90 && angle < 270) ? -1 : 1;
  }

  static double calculate(double angle, double distance) {
    switch (determineQuarter(angle)) {
      case Quarter.fourth:
        return ElevatorUtil.determineSign(angle) *
            distance *
            math.sin(vectors.radians(ElevatorUtil.determineAngle(angle)));
      default:
        return ElevatorUtil.determineSign(angle) *
            distance *
            math.cos(vectors.radians(ElevatorUtil.determineAngle(angle)));
    }
  }
}

/*
*

                        */
