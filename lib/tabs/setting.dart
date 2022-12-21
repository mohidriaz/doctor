import 'package:flutter/material.dart';
import 'package:medicare/screens/login/login.dart';
import 'package:medicare/screens/settings_screen.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
            }, child: Center(child: Text("setting"))),
          )
        ],
      ),
    );
  }
}