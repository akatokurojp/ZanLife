import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(69, 72, 81, 1),
      child: Center(
        child: Lottie.network(
            'https://assets4.lottiefiles.com/packages/lf20_sknsem5j.json'),
      ),
    );
  }
}
