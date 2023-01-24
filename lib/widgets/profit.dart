import 'package:flutter/material.dart';

class Profit extends StatefulWidget {
  var icon;
  String text;
  double profit;
  Profit(this.icon,this.text,this.profit);

  @override
  State<Profit> createState() => _ProfitState(icon,text,profit);
}

class _ProfitState extends State<Profit> {
  var icon;
  String text;
  double profit;
  _ProfitState(this.icon,this.text,this.profit);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 100,
      child: Row(
        children: [
          Container(
            width: 85,
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$profit ₺',
                  style: TextStyle(fontSize: 25),
                ),
                Text(text, style: TextStyle(fontSize: 15))
              ],
            ),
          )
        ],
      ),
    );
  }
}
