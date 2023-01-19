import 'dart:async';
import 'package:flutter/material.dart';
import 'package:skydome/decorations/backgrounds/background-decorator.dart';
import 'package:skydome/decorations/buttons/button-decorator.dart';
import 'package:skydome/decorations/decorations.dart';
import 'package:skydome/screens/homepage.dart';
import 'package:skydome/screens/register.dart';
import 'package:skydome/widgets/login-register-widgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Background("images/bg.jpg").getBackground(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Center(
              child: Column(
                children: [
                  Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration:
                          Background("images/logo.png").getBackground()),
                  const Text(
                    "S K Y D O M E",
                    style: TextStyle(fontFamily: 'DaBronxSans', fontSize: 45,color: Decorations.color),
                  ),
                  Container(
                    height: 250,
                    margin: const EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LoginRegisterWidgets.buildTextField("Username", Icons.person),
                        LoginRegisterWidgets.buildPasswordField("Password", Icons.lock),
                        LoginRegisterWidgets.buildButton(context, "Giriş Yap","login")
                      ],
                    ),
                  ),
                  const Expanded(
                      child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Üye değilim?",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 15)),
                    ),
                  )),
                  InkWell(
                    child: const Text(
                      "Yeni hesap oluştur",
                      style: TextStyle(
                          color: Decorations.color,
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Register())),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  routeToPage() {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
