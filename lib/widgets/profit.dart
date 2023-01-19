import 'package:flutter/material.dart';

class Profit extends StatelessWidget {
  var icon;
  double earning;
  String text;
  Profit(this.icon,this.earning,this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
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
          width: MediaQuery.of(context).size.width / 2 - 97,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(earning.toString()+"₺",style: TextStyle(fontSize: 25),),
            Text(text,style: TextStyle(fontSize: 15))
          ],
          ),
        )
      ],
    );
  }
}
