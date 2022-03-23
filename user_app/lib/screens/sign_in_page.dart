// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:user_app/widgets/google_sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffff3e9),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/home.png',
              ),
              SizedBox(
                height: 30,
              ),
              Text("Login for Beneficiaries",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 50,
              ),
              SignInButton(),
            ],
          ),
        ));
  }
}
