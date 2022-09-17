
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livagrup/admin_part/all_user_value_info.dart';
import 'package:livagrup/database/db_helper.dart';

import 'package:livagrup/theme_helper.dart';

class CreateUserAccount extends StatefulWidget {
  const CreateUserAccount({Key? key}) : super(key: key);

  @override
  _CreateUserAccountState createState() => _CreateUserAccountState();
}

class _CreateUserAccountState extends State<CreateUserAccount> {
  final _createUserFormKey = GlobalKey<FormState>();

  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  TextEditingController userNameTextEditCTR = TextEditingController();
  TextEditingController mailTextEditCTR = TextEditingController();
  TextEditingController mobileTextEditCTR = TextEditingController();
  TextEditingController addressTextEditCTR = TextEditingController();
  TextEditingController passwordTextEditCTR = TextEditingController();

  String userId = '';
  String userMail  = '';
  String userMobile  = '';
  String userAddress  = '';
  String userPassword  = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account '),),
      body: _buildLoginBody(),
    );
  }

  /// Build Login Body
  Widget _buildLoginBody() {
    return SingleChildScrollView(
      child: _buildLatLogUserAddedForm()
    );
  }

  /// Login Form UI
  Form _buildLatLogUserAddedForm() {
    return Form(
        key: _createUserFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _headLine('User Id   '),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: userNameTextEditCTR,
                  decoration: ThemeHelper().textInputDecoration('UserId', 'enter your user id '),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please your user id';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),

              SizedBox(height: 5.0),

              _headLine('User Mail '),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: mailTextEditCTR,

                  decoration: ThemeHelper().textInputDecoration(
                      'mail', 'enter your user mail'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please your mail';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),


              SizedBox(height: 10.0),
              _headLine('User Mobile '),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mobileTextEditCTR,

                  decoration: ThemeHelper().textInputDecoration(
                      'phone', 'enter your user phone'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please your phone';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),

              SizedBox(height: 10.0),
              _headLine('User Password '),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: passwordTextEditCTR,

                  decoration: ThemeHelper().textInputDecoration(
                      'password', 'enter your user password'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please your password';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),

              SizedBox(height: 10.0),
              _headLine('User Address '),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: addressTextEditCTR,

                  decoration: ThemeHelper().textInputDecoration(
                      'address', 'enter your user address'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please your address';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),

SizedBox(height: 20,),
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
                    child: Text('Save',

                    ),
                  ),
                  onPressed: () {


                    if (_createUserFormKey.currentState!.validate()) {
                      userId= userNameTextEditCTR.text;
                      userMail= mailTextEditCTR.text;
                      userMobile= mobileTextEditCTR.text;
                      userAddress= addressTextEditCTR.text;
                      userPassword= passwordTextEditCTR.text;

                      Map<String, dynamic> createAccount = {
                        DatabaseHelper.userId : userId,
                        DatabaseHelper.uMail  : userMail,
                        DatabaseHelper.uMobile  : userMobile,
                        DatabaseHelper.uAddrss  : userAddress,
                        DatabaseHelper.uPass  : userPassword,
                      };
                        DatabaseHelper.instance.userAccountInsert(createAccount).then((value) {
                          print('inserted row id: $value');
                          if(value>0){
                            Get.snackbar('Alert', 'Crate account has successful!');
                          }else{
                            Get.snackbar('Alert', 'wrong!');
                          }
                        });

                    }
                  },
                ),
              ),

            ],
          ),
        )
    );
  }

  _headLine(String name){
    return Container(
      margin: EdgeInsets.only(left: 5,bottom: 5),
      padding: EdgeInsets.only(left: 5,bottom: 5),

      child:  Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
    );
  }

}


