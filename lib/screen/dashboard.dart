import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            ' Dashboard',
            style: TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 53, 52, 52),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          CircleAvatar(
            radius: 70,
            child: Icon(
              Icons.dashboard_customize_rounded,
              size: 120,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            'Summerize the inputs',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
