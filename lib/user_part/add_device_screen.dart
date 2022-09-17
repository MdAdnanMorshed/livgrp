

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livagrup/admin_part/admin_screen.dart';
import 'package:livagrup/theme_helper.dart';
import 'package:livagrup/user_part/user_dashboad_screen.dart';


class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({Key? key}) : super(key: key);

  @override
  _AddDeviceScreenState createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  final _formKey = GlobalKey<FormState>();


  TextEditingController phoneTextEditCTR = TextEditingController();
  TextEditingController geolocationTextEditCTR = TextEditingController();
  TextEditingController ispTextEditCTR = TextEditingController();
  TextEditingController countryTextEditCTR = TextEditingController();

  String mobile = '';
  String geolocation = '';
  String isp = '';
  String country = '';
  bool isMobile = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Add Device'),),
        body: _buildDeviceBody(),
      ),
    );
  }

  /// Build Login Body
  Widget _buildDeviceBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              child: Image.asset('assets/images/banar4.png',fit: BoxFit.fitWidth,)),
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
              margin: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.0),
                  _buildDeviceForm()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Login Form UI
  Form _buildDeviceForm() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(

            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headLine('Mobile Number :'),

              Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phoneTextEditCTR,
                  decoration: ThemeHelper().textInputDecoration('Mobile Number', 'enter your mobile number'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please your mobile number';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),
              SizedBox(height: 20.0),
              _headLine('Geolocation :'),

              Container(
                child: TextFormField(
                  controller: geolocationTextEditCTR,
                  obscureText: true,
                  decoration: ThemeHelper().textInputDecoration(
                      'Geolocation', 'enter your geolocation'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please your geolocation';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),

              SizedBox(height: 20.0),
              _headLine('ISP :'),

              Container(
                child: TextFormField(
                  controller: ispTextEditCTR,
                  obscureText: true,
                  decoration: ThemeHelper().textInputDecoration(
                      'ISP', 'enter your isp'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please your isp';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),


              SizedBox(height: 20.0),
              _headLine('Country :'),

              Container(
                child: TextFormField(
                  controller: countryTextEditCTR,
                  obscureText: true,
                  decoration: ThemeHelper().textInputDecoration(
                      'Country', 'enter your Country'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please your geolocation';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),

              SizedBox(height: 40.0),

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
                    child: Text('Add Devices',

                    ),
                  ),
                  onPressed: () {

                    if (_formKey.currentState!.validate()) {

                    }

                    //Get.offAllNamed('/find_ticket');
                  },
                ),
              ),

            ],
          ),
        ));
  }


  _headLine(String name){
    return Container(
      margin: EdgeInsets.only(left: 5,bottom: 5),
      padding: EdgeInsets.only(left: 5,bottom: 5),

      child:  Text(name),
    );
  }

}
