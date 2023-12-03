// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:smart_lunch_box/screen/home.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Smart Lunch Box'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Track Your Meal",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      // ignore: prefer_const_constructors
                      color: Color.fromARGB(255, 2, 44, 76)
                          .withOpacity(0.2), // Color and opacity of the shadow
                      spreadRadius: 2, // Spread radius of the shadow
                      blurRadius: 7, // Blur radius of the shadow
                      // ignore: prefer_const_constructors
                      offset: Offset(0, 2), // Offset of the shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      30.0), // Rounded border for the Image
                  child: Image.asset(
                    "assets/images/startimg.jpg",
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              // Make sure to replace with your actual icon
              SizedBox(height: 50),
              Text('Get started with your Smart Lunch Box.\n\n'),

              SizedBox(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.handshake_sharp),
                    label: Text("Get Start"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MealWeightEntryPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        fixedSize: Size(200, 60),
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        elevation: 15,
                        //shadowColor: Color.fromARGB(255, 8, 19, 55),
                        side: BorderSide(
                            color: Color.fromARGB(221, 4, 12, 22), width: 2),
                        alignment: Alignment.center,
                        shape: StadiumBorder()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Powerd by 13975 Pvt (Ltd)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
