import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uts/Presentations/home_page_screens/home_page.dart';
import 'package:uts/Presentations/home_page_screens/pages/homepages/currency.dart';
import 'package:uts/Presentations/home_page_screens/pages/homepages/geometry.dart';
import 'package:uts/Presentations/home_page_screens/pages/homepages/temperature.dart';
import 'package:uts/core/app_export.dart';

import '../util/calculation.dart';
import '../util/recent.dart';
import 'homepages/phonebook.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);
  @override
  _userhomestate createState() => _userhomestate();
}

class _userhomestate extends State<UserHome> {
  final List calcForYou = [
    //[Calculation name , desc, assets]
    [
      'Currency Exchange',
      'Tools to calculate your exchange',
      'lib/assets/exchange.png'
    ],
    [
      'Temperature Calculator',
      'Tools to calculate your Temperature',
      'lib/assets/thermometer.png'
    ],
    ['Geometry', 'Tools to calculate Geometries', 'lib/assets/geometry.png'],
  ];

  final List recentcal = [
    //[Calculation name , desc, assets]
    ['Geometry', 'Rectangle Area ', 'lib/assets/geometry.png'],
    [
      'Temperature Calculator',
      'Celcius to Reamur',
      'lib/assets/thermometer.png'
    ],
    ['Geometry', 'Rectangle Volume', 'lib/assets/geometry.png'],
  ];

  // void calcStarted(int index) {
  // showDialog(
  //context: context,
  //builder: (context) {
  //return AlertDialog(
  //title: Text('Calculation for' + recentcal[index][0]),
  //);
  //});
  // }

  // void calcat(int index) {
  //showDialog(
  // context: context,
  // builder: (context) {
  // return AlertDialog(
  // title: Text('Calculation for' + calcForYou[index][0]),
  //);
  // });
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.grey[400],
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    'L O G O',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.monetization_on_outlined),
                title: Text(
                  'Currency Exchange ',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ConversionPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.temple_buddhist),
                title: Text(
                  'Temperature Exchange ',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => temperature()));
                },
              ),
              ListTile(
                leading: Icon(Icons.monetization_on_outlined),
                title: Text(
                  'Geometry  ',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => geometri()));
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  'Phone Book  ',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => phonebook()));
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: Icon(Icons.menu_outlined),
            ),
          ),

          SizedBox(
            height: 50,
          ),

          //Calculate Stuff
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Calculate Your Daily Life',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'For You',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: 160,
            child: ListView.builder(
              itemCount: calcForYou.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return calcard(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  CalculationName: calcForYou[index][0],
                  Description: calcForYou[index][1],
                  logoImagePath: calcForYou[index][2],
                );
              }),
            ),
          ),
          SizedBox(height: 25),
          //Recently Added Calculations
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Recently Added',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView.builder(
                itemCount: recentcal.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return RecentCalc(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    CalculationName: recentcal[index][0],
                    Description: recentcal[index][1],
                    logoImagePath: recentcal[index][2],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
