// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:reading_club_open_library/pages/home_page.dart';
import 'package:reading_club_open_library/pages/login_page.dart';
import 'package:reading_club_open_library/widgets/routes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        initialRoute: MyRoutes.LoginPage,
        routes: {
          MyRoutes.homePage: (context) => HomePage(),
          MyRoutes.LoginPage: (context) => LoginPage(),
        });
  }
}
