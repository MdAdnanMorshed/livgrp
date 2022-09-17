import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:livagrup/database/db_helper.dart';

import 'package:livagrup/theme_helper.dart';

class AllUserValueInfo extends StatefulWidget {
  const AllUserValueInfo({Key? key}) : super(key: key);

  @override
  _AllUserValueInfoState createState() => _AllUserValueInfoState();
}

class _AllUserValueInfoState extends State<AllUserValueInfo> {
  final _formKey = GlobalKey<FormState>();
  List data = [];
  List selectData = [];
  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    getAllDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Value List'),
      ),
      body: _buildLoginBody(),
    );
  }

  /// Build Login Body
  Widget _buildLoginBody() {
    return SingleChildScrollView(child: valueAddTable());
  }

  valueAddTable() {
    return Center(
      child: Column(children: <Widget>[
        selectData.isEmpty
            ? Container(
                child: Center(child: Text('No Data Found ')),
              )
            : Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 30,
                    headingRowHeight: 50,
                    dividerThickness: 2,
                    headingTextStyle: Theme.of(context).textTheme.headline6,
                    dataTextStyle: Theme.of(context).textTheme.overline,
                    columns: const [
                      DataColumn(
                        label: Text(
                          'S.N',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'User',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          ' Lat',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Long ',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Upazila',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Temperature',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Weather\n Status',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Capacitor\n Condition ',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Total \n Strike',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: List.generate(selectData.length, (index) {
                      return DataRow(cells: [
                        DataCell(Text(selectData[index]['id'].toString())),
                        DataCell(Text(selectData[index]['uId'].toString())),
                        DataCell(Text(selectData[index]['lat'].toString())),
                        DataCell(Text(selectData[index]['log'].toString())),
                        DataCell(Text('Sadar')),
                        DataCell(Text('29.C')),
                        DataCell(Text('Cloudy')),
                        DataCell(Text('Strong')),
                        DataCell(Text(
                          selectData[index]['id'].toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        )),
                      ]);
                    }),
                  ),
                ),
              ),
      ]),
    );
  }

  getAllDataList() {
    dbHelper.queryAllRows().then((value) {
      print('value >>' + jsonEncode(value));

      /// condition User by id
      /*   for(var values in value ){
        if(values['uId']=='user 02'){
          print(values['uId']);
          selectData.add(values);
        }
      }*/
      setState(() {
        selectData = value;

        print(selectData);
        print('lng:' + data.length.toString());
        print('lng:' + selectData.length.toString());
      });
    });
  }
}
