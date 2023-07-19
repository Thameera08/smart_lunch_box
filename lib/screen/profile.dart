import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            ' Profile',
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
              Icons.person_3_outlined,
              size: 120,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            'User Profile Interface',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
