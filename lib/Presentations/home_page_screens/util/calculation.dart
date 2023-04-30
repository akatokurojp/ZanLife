import 'package:flutter/material.dart';

class calcard extends StatelessWidget {
  final String CalculationName;
  final String Description;
  final String logoImagePath;
  final VoidCallback onTap;

  calcard({
    required this.CalculationName,
    required this.Description,
    required this.logoImagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 200,
          padding: EdgeInsets.all(12),
          color: Colors.grey[200],
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      child: Image.asset(logoImagePath),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'Calculate',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    CalculationName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Text(Description),
              ]),
        ),
      ),
    );
  }
}
