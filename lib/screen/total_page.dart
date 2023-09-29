import 'package:flutter/material.dart';
import 'package:smart_lunch_box/screen/calories_page.dart';

class TotalPage extends StatelessWidget {
  final TotalNutrition totalNutrition;
  // ignore: prefer_const_constructors_in_immutables
  TotalPage({required this.totalNutrition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Total Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: prefer_const_constructors
            Text(
              'Total Nutritional Information:',
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // ignore: prefer_const_constructors
                color: Color.fromARGB(255, 2, 86, 5),
              ),
            ),
            Text(
              'Total Calories: ${totalNutrition.calories.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 212, 161, 21),
              ),
            ),
            Text(
              'Total Fat: ${totalNutrition.totalFat.toStringAsFixed(2)} g',
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 212, 161, 21),
              ),
            ),
            Text(
              'Total Carbohydrates: ${totalNutrition.totalCarbohydrates.toStringAsFixed(2)} g',
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 212, 161, 21),
              ),
            ),
            Text(
              'Total Protein: ${totalNutrition.protein.toStringAsFixed(2)} g',
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                // ignore: prefer_const_constructors
                color: Color.fromARGB(255, 212, 161, 21),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
