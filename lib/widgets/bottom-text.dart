import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  String text;
  BottomText(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(text),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(text),
          ))
        ],
      ),
    );
  }
}
