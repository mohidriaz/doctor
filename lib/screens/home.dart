import 'package:flutter/material.dart';
import 'package:medicare/screens/login/login.dart';
import 'package:medicare/screens/settings_screen.dart';
import 'package:medicare/styles/colors.dart';
import 'package:medicare/tabs/HomeTab.dart';
import 'package:medicare/tabs/ScheduleTab.dart';


import '../tabs/profile.dart';



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: <Widget>[
            HomeTab(onPressedScheduleCard: () {  },),
            ScheduleTab(),
            Profile(),
            SettingsScreen(),
            
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home, size: 26.0),
            ),
            Tab(
              icon: Icon(Icons.schedule, size: 26.0),
            ),
            Tab(
              icon: Icon(Icons.person, size: 26.0),
            ),

            Tab(
              icon: Icon(Icons.settings,size: 26.0,),
            ),

          ],
          labelPadding: EdgeInsets.all(5.0),
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black12,
          indicatorWeight: 0.01,
        ),
      ),
    );
  }
}