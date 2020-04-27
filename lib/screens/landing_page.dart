import 'package:apartmentmanagement/data/strings.dart';
import 'package:apartmentmanagement/models/Announcement.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'dart:convert';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 22,bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Hi, Daisy",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Let's get productive today",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/bt.png")),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CheckPayment(),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Announcements",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 10,
                thickness: 1,
              ),
              MyCarousel(),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
                thickness: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 8, right: 8, top: 35),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.redAccent.shade200,
                            Colors.redAccent.shade400,
                          ]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -35,
                      child: Container(
                        width: 250,
                        child: Image.asset("assets/images/pay.png"),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 30,
                        child: Text(
                          "See last payments",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}



class CheckPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(color: Colors.redAccent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              "You have 1 overdue payment",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                "38",
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 8),
                child: Icon(
                  Icons.monetization_on,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  "Pay",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyCarousel extends StatefulWidget {
  List<Announcement> allAnno = [];

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<Announcement> loadData() {
    List<Announcement> announcements = [];
    for (int i = 0; i < 3; i++) {
      Announcement data = Announcement(
          Strings.title[i], Strings.src[i], Strings.description[i]);
      announcements.add(data);
    }
    return announcements;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          carouselSlider = CarouselSlider(
            height: 150.0,
            initialPage: 0,
            enlargeCenterPage: true,
            reverse: false,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
            items: loadData().map((data) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.only(top: 15),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 50,
                          margin: EdgeInsets.only(left: 15),
                          height: 150,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 2.0, color: Colors.black12),
                            gradient: LinearGradient(colors: [
                              Colors.purpleAccent.shade100,
                              Colors.purpleAccent.shade400,
                            ]),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 10,
                          child: Container(
                            width: 90,
                            height: 90,
                            child: Image.asset(data.announcemenSrc),
                          ),
                        ),
                        Positioned(
                          left: 100,
                          top: 10,
                          child: Container(
                            child: Text(
                              data.announcemenName,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 100,
                          top: 40,
                          child: Container(
                            width: 180,
                            child: Text(
                              data.announcemenDescription,
                              style: TextStyle(
                                  fontSize: 10, color: Colors.white70),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 25,
                          bottom: 10,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Read more",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
