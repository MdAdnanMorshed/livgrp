
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:livagrup/database/db_helper.dart';
import 'package:livagrup/user_part/drawer_widget.dart';

class UserDashboardScreen extends StatefulWidget {
  dynamic userInfo;

  UserDashboardScreen(this.userInfo);

  @override
  State<StatefulWidget> createState() {
    return _UserDashboardScreenState();
  }
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  final List<String> images = [
    'assets/images/banar1.jpg',
    'assets/images/banar2.jpg',
    'assets/images/banar3.jpg',
  ];
  List data = [];
  List selectData = [];
  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;
  @override
  void initState() {
    getAllDataList();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(widget.userInfo[0]),
      appBar: AppBar(title: const Text('User Dashboard')),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Container(
                child:
                CarouselSlider(
                  items: images
                      .map((item) => Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(item)
                    ),
                  ))
                      .toList(),
                  options: CarouselOptions(
                      aspectRatio: 14 / 6,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration:
                      Duration(milliseconds: 2000),
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                         // _currentImageSlider = index;
                        });
                      }),
                ),
            ),
            SizedBox(height: 10,),
            valueAddTable(),
          ],
        ),
      ),
    );
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
      print('user Info  Id : >>' + widget.userInfo[0]['uId'].toString());
      String userId=widget.userInfo[0]['uId'].toString();

      /// condition User by id
         for(var values in value ){
        if(values['uId']==userId){
          selectData.add(values);
        }
      }
      setState(() {
        print(selectData);
        print('lng:' + selectData.length.toString());
      });
    });
  }

}