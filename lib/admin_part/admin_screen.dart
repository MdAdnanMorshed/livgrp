import 'package:flutter/material.dart';
import 'package:livagrup/admin_part/admin_setting.dart';
import 'package:livagrup/admin_part/all_user_value_info.dart';
import 'package:livagrup/admin_part/create_user_account.dart';
import 'package:livagrup/admin_part/user_value_add.dart';
import 'package:livagrup/login.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(

          appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Container(
                height: 150,
                width: double.infinity,
                child: Image.asset('assets/images/admin_bg.png')),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text(
                  'App Setting',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AppSetting()));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text(
                  'User Value Add',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UserValueAdd()));
                },
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //CreateUserAccount
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text(
                    'User Value List  ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AllUserValueInfo()));
                },
              ),
            ),

            SizedBox(
              height: 10,
            ),


            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text(
                    'Create User Account ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreateUserAccount()));
                },
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text(
                    'Log Out',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
