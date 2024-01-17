import 'package:alarm/pages/LoginPage.dart';
import 'package:alarm/pages/RegisterPage.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //  initially show login page
  bool ShowLoginPage = true;

  //  toggle between login and register
  void togglePages() {
    setState(() {
      ShowLoginPage = !ShowLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ShowLoginPage) {
      return LoginPage(onTap: togglePages);
    }
    else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
