// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_new

import 'package:flutter/material.dart';
import 'package:user_app/screens/udid_details.dart';

import '../resources/auth_methods.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff4285F4),
                padding: EdgeInsets.all(2),
              ),
              onPressed: () async {
                AuthMethods().signInWithGoogle();
                await Future.delayed(const Duration(milliseconds: 5000));
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UdidDetails()),
                );
              },
              child: new Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      'assets/images/google.png',
                      height: 25.0,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 45.0, right: 10.0),
                      child: new Text(
                        "Sign in with Google",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      )),
                ],
              )),
        ),
      ),
    );
  }
}
