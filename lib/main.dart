import 'package:apartmentmanagement/screens/landing_page.dart';
import 'package:apartmentmanagement/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dumbent',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        backgroundColor: Colors.white
      ),
      home: MainScreen(),
    );
  }
}
