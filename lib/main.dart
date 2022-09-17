import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livagrup/login.dart';
import 'package:livagrup/user_part/user_dashboad_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_screen.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LIVA LPS',
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: SplashScreen(),
    );
  }

}

