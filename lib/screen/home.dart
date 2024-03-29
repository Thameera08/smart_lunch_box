// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart_lunch_box/screen/calories_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MealWeightEntryPage extends StatefulWidget {
  @override
  _MealWeightEntryPageState createState() => _MealWeightEntryPageState();
}

class _MealWeightEntryPageState extends State<MealWeightEntryPage> {
  String selectedMealMethod = 'Rice'; // Default meal method

  TextEditingController weight1Controller = TextEditingController();
  TextEditingController weight2Controller = TextEditingController();
  TextEditingController weight3Controller = TextEditingController();

  double realWeight1 = 0.0;
  double realWeight2 = 0.0;
  double realWeight3 = 0.0;

  void calculateRealWeights() {
    setState(() {
      realWeight1 = double.tryParse(weight1Controller.text) ?? 0.0;
      realWeight2 =
          (double.tryParse(weight2Controller.text) ?? 0.0) - realWeight1;
      realWeight3 = (double.tryParse(weight3Controller.text) ?? 0.0) -
          realWeight1 -
          realWeight2;
    });
  }

  void navigateToCaloriesPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CaloriesPage(
          realWeight1: realWeight1,
          realWeight2: realWeight2,
          realWeight3: realWeight3,
        ),
      ),
    );
  }

  void importFromFirebase() async {
    // Assuming you have a 'weights' collection in Firestore
    // and documents with fields 'weight1', 'weight2', 'weight3'
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('weights')
        .doc('realweight')
        .get();

    if (snapshot.exists) {
      setState(() {
        weight1Controller.text = snapshot['weight1'].toString();
        weight2Controller.text = snapshot['weight2'].toString();
        weight3Controller.text = snapshot['weight3'].toString();
      });
    } else {
      print('Document does not exist');
    }
  }

  @override
  Widget build(BuildContext context) {
    //Get.put(FirstController());
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 1, 11, 44),
        title: Text(
          "Meal Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            print("Theme Chnage");
            // Get.changeTheme(
            //     Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          },
          child: const Icon(
            Icons.mode_edit,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: importFromFirebase,
                child: Text("Import From Firebase"),
              ),
              Text(
                'Enter Weights:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: weight1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Weight 1 (g)'),
              ),
              TextField(
                controller: weight2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Weight 2 (g)'),
              ),
              TextField(
                controller: weight3Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Weight 3 (g)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateRealWeights,
                child: Text('Calculate Real Weights and Show Below'),
              ),
              SizedBox(height: 20),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(
                  color: Colors.black,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Item',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Item 1',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Real Weight 1: $realWeight1 g',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Item 2',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Real Weight 2: $realWeight2 g',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Item 3',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Real Weight 3: $realWeight3 g',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: navigateToCaloriesPage,
                child: Text('Go to Nutrition Values Page'),
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
                  "Code with Botson",
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
