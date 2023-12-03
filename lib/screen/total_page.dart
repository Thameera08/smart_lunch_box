// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart_lunch_box/screen/calories_page.dart';

class TotalPage extends StatelessWidget {
  final TotalNutrition totalNutrition;
  // ignore: prefer_const_constructors_in_immutables
  TotalPage({required this.totalNutrition});

  // Define a function to create a TableCell with borders
  TableCell _buildTableCell(String text, {bool isHeader = false}) {
    return TableCell(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Total Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Total Nutritional Information
              Text(
                'Total Nutritional Information:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 86, 5),
                ),
              ),
              SizedBox(
                height: 50,
              ),

              // Create a table for nutritional data
              Center(
                child: Table(
                  defaultColumnWidth: IntrinsicColumnWidth(),
                  border: TableBorder.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  children: [
                    // Nutrition row - Calories
                    TableRow(
                      children: [
                        _buildTableCell('Nutrition', isHeader: true),
                        _buildTableCell('Total', isHeader: true),
                      ],
                    ),
                    // Nutrition row - Calories
                    TableRow(
                      children: [
                        _buildTableCell('Calories:'),
                        _buildTableCell(
                          totalNutrition.calories.toStringAsFixed(2),
                        ),
                      ],
                    ),
                    // Nutrition row - Total Fat
                    TableRow(
                      children: [
                        _buildTableCell('Total Fat (g):'),
                        _buildTableCell(
                          totalNutrition.totalFat.toStringAsFixed(2),
                        ),
                      ],
                    ),
                    // Nutrition row - Total Carbohydrates
                    TableRow(
                      children: [
                        _buildTableCell('Total Carbohydrates (g):'),
                        _buildTableCell(
                          totalNutrition.totalCarbohydrates.toStringAsFixed(2),
                        ),
                      ],
                    ),
                    // Nutrition row - Total Protein
                    TableRow(
                      children: [
                        _buildTableCell('Total Protein (g):'),
                        _buildTableCell(
                          totalNutrition.protein.toStringAsFixed(2),
                        ),
                      ],
                    ),
                  ],
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
