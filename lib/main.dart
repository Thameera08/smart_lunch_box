import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_lunch_box/screen/add.dart';
import 'package:smart_lunch_box/screen/dashboard.dart';
import 'package:smart_lunch_box/screen/home.dart';
import 'package:smart_lunch_box/screen/profile.dart';
import 'package:smart_lunch_box/screen/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            setState(() {
              index = 0; // Set the index to 0 when the home icon is pressed
            });
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text(
              "", // user name.
              style: TextStyle(fontSize: 18),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.person_outline_rounded),
            onPressed: () {},
          ),
          PopupMenuButton(
            icon: const Icon(Icons.menu),
            onSelected: (value) {
              switch (value) {
                case 1:
                  debugPrint("Home Selected");
                  setState(() {
                    index =
                        0; // Set the index to 0 when "Home" is selected from the popup menu
                  });
                  break;
                case 2:
                  debugPrint("My Dashboard selected");
                  setState(() {
                    index =
                        1; // Set the index to 1 when "Dashboard" is selected from the popup menu
                  });
                  break;
                case 3:
                  debugPrint("Find add selected");
                  setState(() {
                    index =
                        2; // Set the index to 2 when "Add" is selected from the popup menu
                  });
                  break;
                case 4:
                  debugPrint("Profile selected");
                  setState(() {
                    index =
                        3; // Set the index to 3 when "Profile" is selected from the popup menu
                  });
                  break;
                case 5:
                  debugPrint("Settings Selected");
                  setState(() {
                    index =
                        4; // Set the index to 4 when "Settings" is selected from the popup menu
                  });
                  break;
                default:
                  debugPrint("Nothing Selected");
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text("Home"),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text("Dashboard"),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text("Add"),
              ),
              const PopupMenuItem(
                value: 4,
                child: Text("Profile"),
              ),
              const PopupMenuItem(
                value: 5,
                child: Text("Settings"),
              ),
            ],
          ),
        ],
        title: const Text("Smart Lunch Box"),
      ),
      backgroundColor: Color.fromARGB(255, 65, 114, 213),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(
            Icons.dashboard,
            size: 30,
          ),
          Icon(
            Icons.add,
            size: 30,
          ),
          Icon(
            Icons.person,
            size: 30,
          ),
          Icon(
            Icons.settings,
            size: 30,
          ),
        ],
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        height: 60,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        buttonBackgroundColor: Colors.white,
        color: Colors.white,
      ),
      body: Container(
        color: Color.fromARGB(255, 65, 114, 213),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: _getSelectedWidget(index),
      ),
    );
  }

  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return const Home(); // Train Details
      case 1:
        return const Dashboard(); // Home
      case 2:
        return const Add(); // Select Train
      case 3:
        return const Profile(); // Help Others
      case 4:
        return const Settings(); // Train History
      default:
        return const Home(); // Home
    }
  }
}
