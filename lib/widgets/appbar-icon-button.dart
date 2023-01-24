import 'package:flutter/material.dart';
import 'package:skydome/screens/homepage.dart';

class AppBarIconButton extends StatefulWidget{

  int page;
  var icon;
  final PageController pageController;
  AppBarIconButton(this.page,this.icon,this.pageController);

  @override
  State<AppBarIconButton> createState() => _AppBarIconButtonState(page,icon,pageController);
}

class _AppBarIconButtonState extends State<AppBarIconButton> {
  int page;
  var icon;
  PageController pageController;
  _AppBarIconButtonState(this.page,this.icon,this.pageController);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){pageController.animateToPage(page, duration: Duration(milliseconds: 500), curve: Curves.decelerate);},
        icon: Icon(icon)
    );
  }
}
