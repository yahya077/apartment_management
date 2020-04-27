import 'package:apartmentmanagement/screens/announcements_screen.dart';
import 'package:apartmentmanagement/screens/landing_page.dart';
import 'package:apartmentmanagement/screens/payment_screen.dart';
import 'package:apartmentmanagement/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index= 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            index == 1
                ? _selectedBottom(Icon(Icons.home),"Home")
                : IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
            ),
            index==2 ? _selectedBottom(Icon(Icons.bookmark_border),"Payment") : IconButton(icon: Icon(Icons.monetization_on),onPressed: (){
              setState(() {
                index = 2;
              });
            },),
            index==3 ? _selectedBottom(Icon(Icons.bookmark_border),"Announcements") : IconButton(icon: Icon(Icons.bookmark_border),onPressed: (){
              setState(() {
                index = 3;
              });
            },),
            index==4 ? _selectedBottom(Icon(Icons.person),"Profile") : IconButton(icon: Icon(Icons.person),onPressed: (){
              setState(() {
                index = 4;
              });
            },),
          ],
        ),
      ),
      body: index == 1 ? LandingPage() : index == 2 ? PaymentScreen() : index == 3 ? AnnouncementsScreen() : ProfileScreen(),
    );
  }
  Widget _selectedBottom(Icon icon, String str) {
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: Colors.purple.withOpacity(.4),
        ),
        child: Row(
          children: <Widget>[
            icon,
            Text(str),
          ],
        ));
  }
}
