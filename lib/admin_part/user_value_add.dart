
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livagrup/admin_part/all_user_value_info.dart';
import 'package:livagrup/database/db_helper.dart';

import 'package:livagrup/theme_helper.dart';


class UserValueAdd extends StatefulWidget {
  const UserValueAdd({Key? key}) : super(key: key);

  @override
  _UserValueAddState createState() => _UserValueAddState();
}

class _UserValueAddState extends State<UserValueAdd> {
  final _formKey = GlobalKey<FormState>();

  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  TextEditingController latTextEditCTR = TextEditingController();
  TextEditingController logTextEditCTR = TextEditingController();

  String lat = '';
  String log = '';

  String dropdownvalue = 'Select user name';

  // List of items in our dropdown menu
  var items = [
    'Select user name',
    'user 01',
    'user 02',
  ];
  String dropdownvalueDistrict = 'Select district';
  var district = [
    'Select district',
    'Dhaka',
    'Chittagoing',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Value Add'),),
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
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Drop Down List

              _headLine('User List  '),


              Padding(
                padding: const EdgeInsets.all(2.0),
                child: InputDecorator(
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  child: DropdownButtonHideUnderline(
                    child:
                    DropdownButton(
                    underline: SizedBox(),
                    isDense: true,
                    isExpanded: true,
                    // Initial Value
                    value: dropdownvalue,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                  ),
                ),
              ),


              SizedBox(height: 5,),


              _headLine('District List  '),


              Padding(
                padding: const EdgeInsets.all(2.0),
                child: InputDecorator(
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  child: DropdownButtonHideUnderline(
                    child:
                    DropdownButton(
                      underline: SizedBox(),
                      isDense: true,
                      isExpanded: true,
                      // Initial Value
                      value: dropdownvalueDistrict,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: district.map((String items) {
                        return DropdownMenuItem(

                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalueDistrict = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),


              SizedBox(height: 5,),



              _headLine('Latitude   '),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: latTextEditCTR,
                  decoration: ThemeHelper().textInputDecoration('lat', 'enter your user lat '),
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

              _headLine('Longitude '),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: logTextEditCTR,

                  decoration: ThemeHelper().textInputDecoration(
                      'long', 'enter your user long'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please your long';
                    }
                    return null;
                  },
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),

              SizedBox(height: 10.0),

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


                    if (_formKey.currentState!.validate()) {
                      lat= latTextEditCTR.text;
                      log = logTextEditCTR.text;

                      Map<String, dynamic> row = {
                        DatabaseHelper.userId : dropdownvalue,
                        DatabaseHelper.userLat  : double.parse(lat),
                        DatabaseHelper.userLong  : double.parse(log)
                      };
                        DatabaseHelper.instance.insert(row).then((value) {
                          print('inserted row id: $value');
                          if(value>0){
                            /// success
                            Get.to(AllUserValueInfo());
                          }else{
                            /// not success
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


  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.userLat : 'Bob',
      DatabaseHelper.userLong  : 23
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach(print);
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.userId   : 1,
      DatabaseHelper.userLat : 'Mary',
      DatabaseHelper.userLong  : 32
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id!);
    print('deleted $rowsDeleted row(s): row $id');
  }



}


