import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uts/Presentations/auth_controllers.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _Settingstate createState() => _Settingstate();
}

class _Settingstate extends State<Settings> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Signed in as : ' + user.email!),
              MaterialButton(
                onPressed: () {
                  authController.logoutUser();
                },
                color: Colors.deepPurple[200],
                child: Text('Sign Out'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
