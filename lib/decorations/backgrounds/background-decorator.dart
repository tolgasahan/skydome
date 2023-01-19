import 'package:flutter/material.dart';

class Background{
  String path;
  Background(this.path);

  BoxDecoration getBackground(){
    return BoxDecoration(
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ));
  }
}