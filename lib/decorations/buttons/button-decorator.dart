import 'package:flutter/material.dart';
import 'package:skydome/decorations/decorations.dart';

class ButtonDecorator{
  ButtonStyle setDecorate(){
    return ElevatedButton.styleFrom(
      backgroundColor: Decorations.color
    );
  }
}