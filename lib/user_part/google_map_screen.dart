import 'package:flutter/material.dart';
class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(

        child: Scaffold(
      body: Stack(children: [
           Container(
             padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
               width: double.infinity,

               child: Image.network('https://i0.wp.com/www.cssscript.com/wp-content/uploads/2018/03/Simple-Location-Picker.png?fit=561%2C421&ssl=1',width: double.infinity,height: double.infinity, fit: BoxFit.fitHeight,))
      ],),
    ),
    );
  }
}
