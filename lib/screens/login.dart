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
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 60),
            child: Column(
              children: [
                Expanded(flex: 17, child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration:
                          Background("images/logo.png").getBackground(),
                  ),),
                Expanded(flex: 12,child: Text(
                  "S K Y D O M E",
                  style: TextStyle(fontFamily: 'DaBronxSans', fontSize: 45,color: Decorations.color),
                ),),
                Expanded(flex:14,child: LoginRegisterWidgets.buildTextField("Username", Icons.person)),
                Expanded(flex:14,child: LoginRegisterWidgets.buildPasswordField("Password", Icons.lock),),
                Expanded(flex:9,child: LoginRegisterWidgets.buildButton(context, "Giriş Yap","login")),
                Expanded(flex: 30, child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Üye değilim?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15)),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: InkWell(
                              child: Text("Yeni hesap oluştur", style: TextStyle(
                                  color: Decorations.color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20)),
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Register())),
                            ),
                          )
                        ],
                      )
                )),

              ],
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
