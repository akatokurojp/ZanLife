import 'package:flutter/material.dart';

class RecentCalc extends StatelessWidget {
  final String CalculationName;
  final String Description;
  final String logoImagePath;
  final VoidCallback onTap;

  RecentCalc({
    required this.CalculationName,
    required this.Description,
    required this.logoImagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                padding: EdgeInsets.all(5),
                color: Colors.grey[300],
                child: Image.asset(logoImagePath),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CalculationName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  Description,
                  style: TextStyle(color: Color(0xFF757575)),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
