import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_app/screens/dashbord.dart';
import 'package:user_app/screens/docs_input.dart';
import 'package:user_app/screens/findagencies.dart';
import 'package:user_app/screens/profile.dart';
import 'package:user_app/screens/splash_screen.dart';
import 'package:user_app/screens/udid_details.dart';

import 'screens/sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MyProfile());
  }
}
