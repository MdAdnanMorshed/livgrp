
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:livagrup/theme_helper.dart';


class AppSetting extends StatefulWidget {
  const AppSetting({Key? key}) : super(key: key);

  @override
  _AppSettingState createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  final _settingFormKey = GlobalKey<FormState>();


  TextEditingController appTextEditCTR = TextEditingController();


  String appName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change App Name'),),
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
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
              margin: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                      height: 100,
                      width: double.infinity,
                      child: Image.asset('assets/images/admin.jpg',fit: BoxFit.fitWidth,)),
                  SizedBox(height: 30.0),
                  _buildLatLogUserAddedForm()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Login Form UI
  Form _buildLatLogUserAddedForm() {
    return Form(
        key: _settingFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: appTextEditCTR,
                  decoration: ThemeHelper().textInputDecoration('App Name', 'enter your app name '),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please enter the app name ';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),
              SizedBox(height: 10,),
              Container(

                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),


                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text('Save ',

                    ),
                  ),
                  onPressed: () {

                    if (_settingFormKey.currentState!.validate()) {
                      appName= appTextEditCTR.text;
                    }
                  },
                ),
              ),

            ],
          ),
        )
    );
  }
/*  regDocTypeList() {
    userList.add(UserModel(id: "1", userId: "user1"));
    userList.add(UserModel(id: "2", userId: "user2"));
  }*/
}

class AppSettingModel{
  String id;
  String appName;

  AppSettingModel({ required this.id, required this.appName});

}

