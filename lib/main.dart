import 'package:flutter/material.dart';
import 'package:smart_lunch_box/components/colors.dart';
import 'package:smart_lunch_box/screen/get_start_page.dart';

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
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      home: const StartPage(),
    );
  }
}
