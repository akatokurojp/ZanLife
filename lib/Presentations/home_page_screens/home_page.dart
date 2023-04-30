import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uts/Presentations/home_page_screens/pages/Calculator.dart';
import 'package:uts/Presentations/home_page_screens/pages/Camera.dart';
import 'package:uts/Presentations/home_page_screens/pages/BMI.dart';
import 'package:uts/Presentations/home_page_screens/pages/home.dart';
import 'package:uts/Presentations/home_page_screens/pages/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserHome(),
    Calculatora(),
    Camera(),
    BMI(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_weight_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Home'),
        ],
      ),
    );
  }
}
