import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math';

class CircularPercent extends StatefulWidget {
  int percent;
  double sized;
  CircularPercent(this.percent,this.sized);

  @override
  State<CircularPercent> createState() => _CircularPercentState(percent,sized);
}

class _CircularPercentState extends State<CircularPercent> {
  int percent;
  double sized;
  _CircularPercentState(this.percent,this.sized);
  late SweepGradient sweepGradient;

  late double size;
  @override
  void initState() {
    size = sized.toDouble();
    if(percent == 100){
      sweepGradient = SweepGradient(colors: [Colors.green,Colors.green]);
    }
      else{
    sweepGradient = SweepGradient(startAngle: 3 * pi / 2, endAngle: 7 * pi / 2, tileMode: TileMode.repeated, stops: [0.1,0.3,0.6], colors: [Colors.red,Colors.yellow, Colors.green]);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircularStepProgressIndicator(
          width: size,
          height: size,
          padding: 0,
          totalSteps: 100,
          currentStep: 0,
          selectedStepSize: 15,
          unselectedStepSize: 3,
          unselectedColor: Colors.white,
        ),
        CircularStepProgressIndicator(
          width: size,
          height: size,
          padding: 0,
          totalSteps: 100,
          currentStep: percent,
          selectedStepSize: 15,
          unselectedStepSize: 0,
          unselectedColor: Colors.transparent,
          gradientColor: sweepGradient,
          child: Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            width: 200,
            height: 200,
            decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.blue[300]),
            child: Text(
              '%$percent',
              style: TextStyle(fontSize: size/4, color: Colors.white),
            ),
          ),

        ),
      ],
    );
  }
}
