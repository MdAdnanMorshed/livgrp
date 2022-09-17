import 'package:flutter/material.dart';
import 'package:livagrup/login.dart';
import 'package:livagrup/user_part/about_screen.dart';
import 'package:livagrup/user_part/add_device_screen.dart';
import 'package:livagrup/user_part/google_map_screen.dart';
import 'package:livagrup/user_part/monthly_report.dart';
import 'package:livagrup/user_part/profile_screen.dart';


class DrawerWidget extends StatefulWidget {
  dynamic userInfo;

  DrawerWidget(this.userInfo);
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(

        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.0,
                    1.0
                  ],
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).accentColor.withOpacity(0.5),
                  ])),
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor,
                      ],
                    ),
                  ),
                  child: Center(child:
                  Image.asset('assets/logo.png')
                  )


              ),
                 CtmHeaderListTitleWidget(
                  titleName: "About",
                  iconPath: Icons.message,
                  onTapTitle: () =>{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutScreen())),
                  }
                      //Get.toNamed('/booking_history')
                 ),
              CtmHeaderListTitleWidget(
                  titleName: "Profile",
                  iconPath: Icons.person,
                  onTapTitle: () =>{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ProfileScreen(widget.userInfo))),
                  }
              ),
              CtmHeaderListTitleWidget(
                  titleName: "Add Device",
                  iconPath: Icons.devices,
                  onTapTitle: () =>{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddDeviceScreen())),
                  }

              ),
              CtmHeaderListTitleWidget(
                  titleName: "Google Map",
                  iconPath: Icons.map,
                  onTapTitle: () =>{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const GoogleMapScreen())),
                  }

              ),
              CtmHeaderListTitleWidget(
                  titleName: "Monthly Report",
                  iconPath: Icons.report,
                  onTapTitle: () =>{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const MonthlyReportScreen())),
                  }

              ),
              CtmHeaderListTitleWidget(
                  titleName: "Logout",
                  iconPath: Icons.logout,
                  onTapTitle: () =>{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage())),
                  }

              ),


              Container(
                height: 200,
                width: double.infinity,
                // color: Colors.green,
                child:   Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'v-1.0.0',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text(
                     'copy Right',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CtmHeaderListTitleWidget extends StatefulWidget {

  final String titleName;
  final IconData iconPath;
  final Function()? onTapTitle; // nullable and optional

  const CtmHeaderListTitleWidget(
      {Key? key,
        required this.titleName,
        required this.iconPath, // non-nullable but optional with a default value
        this.onTapTitle, // nullable and optional
      })
      : super(key: key);

  @override
  State<CtmHeaderListTitleWidget> createState() => _CtmHeaderListTitleWidgetState();
}

class _CtmHeaderListTitleWidgetState extends State<CtmHeaderListTitleWidget> {
  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
        leading: Icon(widget.iconPath, size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary,),
        title: Text(widget.titleName,style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).colorScheme.secondary),),
        onTap:widget.onTapTitle
    );
  }
}
