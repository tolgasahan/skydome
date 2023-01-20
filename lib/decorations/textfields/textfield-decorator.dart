import 'package:flutter/material.dart';

class TextFieldDecorator{
  String labelText;
  var icon;
  TextFieldDecorator(this.labelText,this.icon);

  InputDecoration setTextField(){
    return InputDecoration(
      prefixIcon:Icon(icon),
      border: const OutlineInputBorder(),
      labelText: labelText,
    );
  }
}