import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lit_ui_kit/lit_ui_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:uts/core/app_export.dart';

import 'homepages/currency.dart';
import 'homepages/geometry.dart';
import 'homepages/temperature.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? image;
  Future pickimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    this.image = imageTemporary;
    setState(() {
      this.image = imageTemporary;
    });
  }

  Future Takepicture() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }

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
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Take Photos of Yourselves',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              image != null
                  ? Image.file(
                      image!,
                      width: 160,
                      height: 160,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        color: Colors.transparent,
                        child: Center(
                          child: Lottie.network(
                              'https://assets10.lottiefiles.com/packages/lf20_jhlaooj5.json',
                              height: 200,
                              width: 200),
                        ),
                      ),
                    ),
            ],
          ),
          //Choose from gallery
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: (() {
                pickimage();
              }),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'Choose from gallery',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          //Take Picture
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: (() {
                Takepicture();
              }),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'Take Picture',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
