import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:smart_lunch_box/firebase_options.dart';
import 'package:smart_lunch_box/screen/get_start_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
