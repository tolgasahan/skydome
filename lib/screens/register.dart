import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skydome/decorations/backgrounds/background-decorator.dart';
import 'package:skydome/decorations/textfields/textfield-decorator.dart';
import 'package:skydome/widgets/login-register-widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: Background("images/bg.jpg").getBackground(),
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
                  children: [
                    Container(
                        width: double.infinity,
                        child: Text(
                          "Formu doldurup üye olabilirsiniz.\nBütün alanları doldurmanız zorunludur.",
                        )),
                    Center(
                      child: Container(
                        height: 350,
                        margin: EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LoginRegisterWidgets.buildTextField("E-Mail", Icons.mail),
                            LoginRegisterWidgets.buildPasswordField("Password", Icons.lock),
                            LoginRegisterWidgets.buildPasswordField("Password (again)", Icons.lock),
                            LoginRegisterWidgets.buildButton(context,"Kayıt ol","register"),
                          ],
                        ),
                      ),
                    ),

                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black87, fontSize: 15.0),
                    children: <TextSpan>[
                      TextSpan(text: 'Kayıt ol tuşuna bastığınızda '),
                      TextSpan(
                          text: 'Hüküm & Koşullar',
                          style: TextStyle(color: Colors.deepOrange),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {

                            }),
                      TextSpan(text: " 'ı kabul etmiş sayılırsınız."),

                    ],
                  ),
                )
                  ],
                ),
              ),
            )));
  }
}
