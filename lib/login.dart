import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livagrup/admin_part/admin_screen.dart';
import 'package:livagrup/database/db_helper.dart';
import 'package:livagrup/theme_helper.dart';
import 'package:livagrup/user_part/user_dashboad_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();


  TextEditingController userIdTextEditCTR = TextEditingController();
  TextEditingController passTextEditCTR = TextEditingController();

  String userId = '';
  String password = '';
  bool isMobile = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _buildLoginBody(),
    );
  }

  /// Build Login Body
  Widget _buildLoginBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 200.0),
          Container(
              height: 100,
              child: Image.asset('assets/logo.png',)),
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
              margin: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: 30.0),
                  _buildLoginForm()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Login Form UI
  Form _buildLoginForm() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: userIdTextEditCTR,
                  decoration: ThemeHelper().textInputDecoration('User Id', 'enter your user id '),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please your user id';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),

              SizedBox(height: 20.0),

              Container(
                child: TextFormField(
                  controller: passTextEditCTR,
                  obscureText: true,
                  decoration: ThemeHelper().textInputDecoration(
                      'Password', 'enter your Password'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please your password';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),

              SizedBox(height: 40.0),

              Container(

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),


                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text('sign In',

                    ),
                  ),
                  onPressed: () async{

                    if (_formKey.currentState!.validate()) {

                      userId = userIdTextEditCTR.text;
                      password = passTextEditCTR.text;

                      if(userId=='admin' && password=='123456'){

                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminScreen()));
                      }
                      else{
                        DatabaseHelper.instance.getLogin(userId,password).then((value) {
                          print(' check Login :'+value.toString());
                          if(value!=-1){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  UserDashboardScreen(value)));

                          }else{
                            Get.snackbar('please try again', 'User Id and Password not match ! ');
                          }
                        });
                      }
                    }
                  },
                ),
              ),

            ],
          ),
        ));
  }



}
