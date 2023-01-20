import 'package:flutter/material.dart';
import 'package:skydome/decorations/buttons/button-decorator.dart';
import 'package:skydome/decorations/textfields/textfield-decorator.dart';
import 'package:skydome/screens/homepage.dart';


class LoginRegisterWidgets{
  static _registerButton(){

  }
   static _loginButton(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(), fullscreenDialog: true));
  }


  static Widget buildButton(BuildContext context, String text,String process) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
                style: ButtonDecorator().setDecorate(),
                onPressed: () {
                  process == "login" ? _loginButton(context) : print("hata");
                  process == "register" ? _registerButton()  : print("hata");
                },
                child: Text(text)
            )
    );
  }

  static Widget buildTextField(String text,var icon){
    return TextField(
      decoration: TextFieldDecorator(text,icon).setTextField(),
    );
  }

  static Widget buildPasswordField(String text,var icon){
    return TextField(
      decoration: TextFieldDecorator(text,icon).setTextField(),
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}
