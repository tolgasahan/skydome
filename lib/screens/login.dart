import 'package:flutter/material.dart';
import 'package:skydome/decorations/backgrounds/background-decorator.dart';
import 'package:skydome/decorations/buttons/button-decorator.dart';
import 'package:skydome/decorations/decorations.dart';
import 'package:skydome/decorations/textfields/textfield-decorator.dart';
import 'package:skydome/screens/homepage.dart';
import 'package:skydome/screens/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Background("images/background.jpg").getBackground(),
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
                buildLogoBox(),
                buildLogoText(),
                buildUserNameField(),
                buildPasswordField(),
                buildButton(),
                buildRegisterLink(),
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
  Widget buildLogoBox(){
    return Expanded(flex: 9, child: Container(
      decoration:
      Background("images/logo.png").getBackground(),
    ),);
  }

  Widget buildLogoText(){
    return Expanded(flex:8,child: Text(
    "S K Y D O M E",
    style: TextStyle(fontFamily: 'DaBronxSans', fontSize: 45,color: Decorations.color),
  ),);
  }

  Widget buildUserNameField() {
    return Expanded(flex:8,child:TextField(
      decoration: TextFieldDecorator("Username",Icons.person).setTextField(),
    ));
  }

  Widget buildPasswordField() {
    return Expanded(flex:8,child: TextField(
      decoration: TextFieldDecorator("Password",Icons.lock).setTextField(),
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
    ),);
  }

  Widget buildButton() {
    return Expanded(flex:5,child: Container(
        padding: EdgeInsets.symmetric(vertical: 2),
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonDecorator().setDecorate(),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text("Giriş Yap")
        )
    ));
  }

  Widget buildRegisterLink() {
    return Expanded(flex: 16, child: Container(
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
    ));
  }
}
