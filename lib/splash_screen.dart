

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livagrup/admin_part/admin_screen.dart';
import 'package:livagrup/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_part/user_dashboad_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {

     Timer(const Duration(milliseconds: 3000), ()async{

      setState(()  {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>  const LoginPage()), (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Center(
        child: ClipOval(
            child:
            Image.asset('assets/logo.png',height: 200,width: 200,)
        ),
      ),
    );
  }
}