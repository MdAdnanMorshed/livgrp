import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  dynamic user;
  ProfileScreen(this.user);
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Container(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(Icons.person,size: 150,),
            SizedBox(height: 20,),

            _ekyValue('User Id :',user['uId'].toString()),
            _ekyValue('User Mobile :',user['uMobile'].toString()),
            _ekyValue('User mail : ',user['uMail'].toString()),
            _ekyValue('User Address : ',user['uAddress'].toString()),

          ],
        ),
      ),
    ));
  }
  _ekyValue (String key,String value){
    return Container(
      margin: EdgeInsets.only(left: 80),
      child: Row(

        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
        Expanded(

            child: Text(key,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)),
        Expanded(
            flex:2,child: Text(value,style: TextStyle(fontStyle: FontStyle.italic,fontSize: 18),))

      ],),
    );
}
}
