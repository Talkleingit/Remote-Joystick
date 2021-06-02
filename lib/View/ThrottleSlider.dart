import 'package:flutter/material.dart';

class ThrottleSlider extends StatefulWidget {
  final Function updateThrottle;
  ThrottleSlider(this.updateThrottle);
  @override
  State<StatefulWidget> createState() => ThrottleSliderState();
}

class ThrottleSliderState extends State<ThrottleSlider> {
  double currentThrottleValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 140, right: 3),
      child: RotatedBox(
        quarterTurns: 3,
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red.shade700,
            inactiveTrackColor: Colors.red[100],
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 4.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Slider(
            value: currentThrottleValue,
            min: 0,
            max: 1.0,
            divisions: 10,
            label: '${currentThrottleValue.toStringAsFixed(1)}',
            onChanged: (throttleVal) {
              setState(() {
                currentThrottleValue = throttleVal;
              });
              widget.updateThrottle(throttleVal);
            },
            activeColor: Colors.blue.shade600,
          ),
        ),
      ),
    );
  }
}
