

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/assignment_screen/assignment_screen.dart';
import 'package:flutter_app/screens/datesheet_screen/datesheet_screen.dart';
import 'package:flutter_app/screens/fee_screen/fee_screen.dart';
import 'package:flutter_app/screens/home_screen/home_screen.dart';
import 'package:flutter_app/screens/login_screen/login_screen.dart';
import 'package:flutter_app/screens/my_profile/my_profile.dart';
import 'package:flutter_app/screens/result_screen/result_screen.dart';
import 'package:flutter_app/screens/splash_screen/splash_screen.dart';

Map<String,WidgetBuilder> routes = {
  //all screens will be registered here like manifest in android
  SplashScreen.routeName : (context) => SplashScreen(),
  LoginScreen.routeName : (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  MyProfileScreen.routeName: (context) => MyProfileScreen(),
  FeeScreen.routeName: (context) => FeeScreen(),
  AssignmentScreen.routeName: (context) => AssignmentScreen(),
  DateSheetScreen.routeName: (context) => DateSheetScreen(),
  ResultScreen.routeName: (context) => ResultScreen(),

};