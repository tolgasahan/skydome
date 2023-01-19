import 'package:flutter/material.dart';

class TextFieldDecorator{
  String labelText;
  var icon;
  TextFieldDecorator(this.labelText,this.icon);

  InputDecoration setTextField(){
    return InputDecoration(
      prefixIcon:Icon(icon),
       enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black)
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red)
      ),
      border: const OutlineInputBorder(),
      labelText: labelText,
    );
  }
}