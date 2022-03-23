// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff3e9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Container(
              height: 70,
              width: 375,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'ADIP Yojna',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.account_circle,
                      size: 35,
                      color: Colors.brown,
                    ),
                    Icon(
                      Icons.add_to_home_screen,
                      size: 35,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://as2.ftcdn.net/v2/jpg/02/15/84/43/1000_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg"),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'example',
                      style: TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
