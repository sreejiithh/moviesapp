import 'package:flutter/material.dart';
import 'package:movies2/widget/loginpage.dart';
import 'package:movies2/widget/registerpage.dart';

class LoginorRegisterPage extends StatefulWidget {
  const LoginorRegisterPage ({super.key});

  @override
  State<LoginorRegisterPage> createState() => _LoginorRegisterPage();
}

class _LoginorRegisterPage extends State<LoginorRegisterPage> {

  bool showLoginPage= true;

  void togglePages(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!showLoginPage) {
      return RegisterPage(
      );
    }else {
      return Loginpage(
        onTap: togglePages,
      );
    }
  }
}
