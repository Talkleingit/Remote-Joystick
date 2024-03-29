import "package:flutter/material.dart";

class RudderSlider extends StatefulWidget {
  final Function updateRudder;
  RudderSlider(this.updateRudder);
  @override
  RudderSliderState createState() => RudderSliderState();
}

class RudderSliderState extends State<RudderSlider> {
  double currentRudderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          inactiveTrackColor: Colors.deepPurple[100],
          trackShape: RoundedRectSliderTrackShape(),
          trackHeight: 4.0,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
          thumbColor: Colors.redAccent,
          overlayColor: Colors.deepPurple.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
          tickMarkShape: RoundSliderTickMarkShape(),
          activeTickMarkColor: Colors.deepPurple[700],
          inactiveTickMarkColor: Colors.deepPurple[100],
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: Colors.redAccent,
          valueIndicatorTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        child: Slider(
          value: currentRudderValue,
          min: -1.0,
          max: 1.0,
          divisions: 10,
          label: '${currentRudderValue.toStringAsFixed(1)}',
          onChanged: (rudderVal) {
            setState(() {
              currentRudderValue = rudderVal;
            });
            widget.updateRudder(rudderVal);
          },
          activeColor: Colors.deepPurple.shade600,
        ),
      ),
    );
  }
}
