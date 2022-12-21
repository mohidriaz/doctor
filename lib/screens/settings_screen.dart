import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicare/screens/setting/change_password.dart';
import 'package:medicare/tabs/profile.dart';


import '../widgets/settings_tile.dart';
import 'login/login.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen> {
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                
              ),
              const SizedBox(height: 30),
              SettingsTile(
                color: Colors.blue,
                icon: Icons.person_pin_circle,
                title: "My Account",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Colors.green,
                icon: Icons.notification_add,
                title: "Notification",
                onTap: () {},
              ),
                 const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Color.fromARGB(255, 202, 45, 39),
                icon: Icons.password,
                title: "Change Password",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=>ChangePassword()));
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SettingsTile(
                color: Colors.black,
                icon: Icons.support_agent,
                title: "Contact us",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Colors.purple,
                icon: Icons.help_center,
                title: "Help & FAQs",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Colors.yellow,
                icon: Icons.star,
                title: "Rate us",
                onTap: () {
                  
                },
              ),
              
              const SizedBox(
                height: 30,
              ),
              SettingsTile(
                color: Colors.red,
                icon: Icons.logout_outlined,
                title: "Logout",
                onTap: () async =>{
                  await FirebaseAuth.instance.signOut(),
                  Navigator.push(context, MaterialPageRoute
                (builder: (context)=>LoginScreen(),),
                  ),

                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
