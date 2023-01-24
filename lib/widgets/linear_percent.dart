import 'package:flutter/material.dart';

class LinearPercent extends StatefulWidget {
  int weftYarnBreakage;
  int warpBreak;
  int manuelStop;
  LinearPercent(this.weftYarnBreakage,this.warpBreak,this.manuelStop);
  @override
  State<LinearPercent> createState() => _LinearPercentState(weftYarnBreakage,warpBreak,manuelStop);
}

class _LinearPercentState extends State<LinearPercent> {
  int weftYarnBreakage;
  int warpBreak;
  int manuelStop;
  _LinearPercentState(this.weftYarnBreakage,this.warpBreak,this.manuelStop);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: weftYarnBreakage, child: Container(color: Colors.purple,)),
        Expanded(flex: warpBreak, child: Container(color: Colors.red,)),
        Expanded(flex: manuelStop, child: Container(color: Colors.yellow,))
      ],
    );
  }
}
