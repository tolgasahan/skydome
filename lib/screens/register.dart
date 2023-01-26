import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skydome/decorations/backgrounds/background-decorator.dart';
import 'package:skydome/decorations/buttons/button-decorator.dart';
import 'package:skydome/decorations/textfields/textfield-decorator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: Background("images/background.jpg").getBackground(),
        child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
                title: Text(
                  "Kayıt ol",
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 8,
                        child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Formu doldurup üye olabilirsiniz.\nBütün alanları doldurmanız zorunludur.",
                            ))),
                    Expanded(
                        flex: 8,
                        child: TextField(
                          decoration: TextFieldDecorator("Mail", Icons.mail)
                              .setTextField(),
                        )),
                    Expanded(flex: 8, child: buildPasswordField()),
                    Expanded(flex: 8, child: buildPasswordField()),
                    Expanded(
                      flex: 8,
                      child: RichText(
                        text: TextSpan(
                          style:
                              TextStyle(color: Colors.black87, fontSize: 15.0),
                          children: <TextSpan>[
                            TextSpan(text: 'Kayıt ol tuşuna bastığınızda '),
                            TextSpan(
                                text: 'Hüküm & Koşullar',
                                style: TextStyle(color: Colors.deepOrange),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                            TextSpan(text: " 'ı kabul etmiş sayılırsınız."),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonDecorator().setDecorate(),
                              onPressed: () {},
                              child: Text("Kayıt ol")),
                        )),
                    Expanded(flex: 13, child: Container())
                  ],
                ),
              ),
            )));
  }

  Widget buildPasswordField() {
    return TextField(
      decoration: TextFieldDecorator("Password", Icons.lock).setTextField(),
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}
