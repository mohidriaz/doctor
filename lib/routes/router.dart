import 'package:flutter/material.dart';
import 'package:medicare/screens/doctor_detail.dart';
import 'package:medicare/screens/login/classes/switchhome.dart';



Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => SwitchHome(),
  '/detail': (context) => SliverDoctorDetail(),
};
