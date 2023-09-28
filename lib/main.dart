import 'package:flutter/material.dart';
import 'package:smart_lunch_box/components/colors.dart';
import 'package:smart_lunch_box/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Lunch Box',
      theme: ThemeData(
        primaryColor: Colors.black54,
        primarySwatch: customMaterialColor,
      ),
      home: MealWeightEntryPage(),
    );
  }
}
