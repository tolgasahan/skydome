
import 'package:flutter/material.dart';

class BoxDecorator{
  var color;
  BoxDecorator(this.color);

  BoxDecoration eraseBorders(){
    return BoxDecoration(
    border: Border.all(
    width: 0, color: color),
    color: color,
    );
  }
}