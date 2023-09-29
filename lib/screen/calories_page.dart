import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:smart_lunch_box/screen/total_page.dart';

class CaloriesPage extends StatefulWidget {
  final double realWeight1;
  final double realWeight2;
  final double realWeight3;

  const CaloriesPage({
    required this.realWeight1,
    required this.realWeight2,
    required this.realWeight3,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CaloriesPageState createState() => _CaloriesPageState();
}

class MealInfo {
  final String name;
  final double calories;
  final double totalFat;
  final double totalCarbohydrates;
  final double protein;

  MealInfo({
    required this.name,
    required this.calories,
    required this.totalFat,
    required this.totalCarbohydrates,
    required this.protein,
  });
}

class TotalNutrition {
  double calories = 0.0;
  double totalFat = 0.0;
  double totalCarbohydrates = 0.0;
  double protein = 0.0;
}

class _CaloriesPageState extends State<CaloriesPage> {
  String selectedMealMethod1 = 'Rice';
  String selectedMealMethod2 = 'Rice';
  String selectedMealMethod3 = 'Rice';

  double selectedWeight1 = 100.0;
  double selectedWeight2 = 100.0;
  double selectedWeight3 = 100.0;

  final Map<String, MealInfo> mealInfoMap = {
    'Rice': MealInfo(
      name: 'Rice',
      calories: 130,
      totalFat: 0.3,
      totalCarbohydrates: 28,
      protein: 2.7,
    ),
    'Chicken': MealInfo(
      name: 'Chicken',
      calories: 165,
      totalFat: 3.57,
      totalCarbohydrates: 0,
      protein: 31,
    ),
    'Dall': MealInfo(
      name: 'Dall',
      calories: 116,
      totalFat: 0.4,
      totalCarbohydrates: 20,
      protein: 9,
    ),
  };

  double calories1 = 0.0;
  double totalFat1 = 0.0;
  double totalCarbohydrates1 = 0.0;
  double protein1 = 0.0;

  double calories2 = 0.0;
  double totalFat2 = 0.0;
  double totalCarbohydrates2 = 0.0;
  double protein2 = 0.0;

  double calories3 = 0.0;
  double totalFat3 = 0.0;
  double totalCarbohydrates3 = 0.0;
  double protein3 = 0.0;

  TotalNutrition totalNutrition = TotalNutrition();

  void calculateNutrition(String selectedMealMethod, double selectedWeight) {
    MealInfo selectedMeal = mealInfoMap[selectedMealMethod]!;
    double calories = (selectedMeal.calories / 100) * selectedWeight;
    double totalFat = (selectedMeal.totalFat / 100) * selectedWeight;
    double totalCarbohydrates =
        (selectedMeal.totalCarbohydrates / 100) * selectedWeight;
    double protein = (selectedMeal.protein / 100) * selectedWeight;

    setState(() {
      if (selectedMealMethod == 'Rice') {
        calories1 = calories;
        totalFat1 = totalFat;
        totalCarbohydrates1 = totalCarbohydrates;
        protein1 = protein;
      } else if (selectedMealMethod == 'Chicken') {
        calories2 = calories;
        totalFat2 = totalFat;
        totalCarbohydrates2 = totalCarbohydrates;
        protein2 = protein;
      } else if (selectedMealMethod == 'Dall') {
        calories3 = calories;
        totalFat3 = totalFat;
        totalCarbohydrates3 = totalCarbohydrates;
        protein3 = protein;
      }

      totalNutrition.calories = calories1 + calories2 + calories3;
      totalNutrition.totalFat = totalFat1 + totalFat2 + totalFat3;
      totalNutrition.totalCarbohydrates =
          totalCarbohydrates1 + totalCarbohydrates2 + totalCarbohydrates3;
      totalNutrition.protein = protein1 + protein2 + protein3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrition Values Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MEAL CHART:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 60, 5),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(
                  color: Colors.black,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                children: [
                  // ignore: prefer_const_constructors
                  TableRow(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      TableCell(
                        // ignore: prefer_const_constructors
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          // ignore: prefer_const_constructors
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
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Meal Type',
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
                            'Real Weight 1: ${widget.realWeight1} g',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButton<String>(
                                  value: selectedMealMethod1,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedMealMethod1 = newValue!;
                                    });
                                  },
                                  items: mealInfoMap.keys.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
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
                            'Real Weight 2: ${widget.realWeight2} g',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButton<String>(
                                  value: selectedMealMethod2,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedMealMethod2 = newValue!;
                                    });
                                  },
                                  items: mealInfoMap.keys.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
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
                            'Real Weight 3: ${widget.realWeight3} g',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButton<String>(
                                  value: selectedMealMethod3,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedMealMethod3 = newValue!;
                                    });
                                  },
                                  items: mealInfoMap.keys.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 8),
              AnimatedButton(
                  onPress: () {
                    calculateNutrition(selectedMealMethod1, selectedWeight1);
                    calculateNutrition(selectedMealMethod2, selectedWeight2);
                    calculateNutrition(selectedMealMethod3, selectedWeight3);
                  },
                  height: 70,
                  width: 200,
                  text: 'Calculate Nutrition',
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  isReverse: true,
                  selectedTextColor: Color.fromARGB(255, 5, 3, 3),
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  //textStyle: CalculateNutritionTextStyle,
                  backgroundColor: Color.fromARGB(255, 233, 223, 42),
                  borderColor: Color.fromARGB(255, 1, 73, 22),
                  borderRadius: 6,
                  borderWidth: 2),

              // Display the nutritional information for each item
              const SizedBox(height: 20),
              Text(
                'Nutritional Information:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 4, 88, 7),
                ),
              ),
              Text(
                'Item 1:${selectedMealMethod1}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Calories: ${calories1.toStringAsFixed(2)}'),
              Text('Total Fat: ${totalFat1.toStringAsFixed(2)} g'),
              Text(
                  'Total Carbohydrates: ${totalCarbohydrates1.toStringAsFixed(2)} g'),
              Text('Protein: ${protein1.toStringAsFixed(2)} g'),
              const SizedBox(height: 10),
              Text(
                'Item 2: ${selectedMealMethod2}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Calories: ${calories2.toStringAsFixed(2)}'),
              Text('Total Fat: ${totalFat2.toStringAsFixed(2)} g'),
              Text(
                  'Total Carbohydrates: ${totalCarbohydrates2.toStringAsFixed(2)} g'),
              Text('Protein: ${protein2.toStringAsFixed(2)} g'),
              const SizedBox(height: 10),
              Text(
                'Item 3: ${selectedMealMethod3}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Calories: ${calories3.toStringAsFixed(2)}'),
              Text('Total Fat: ${totalFat3.toStringAsFixed(2)} g'),
              Text(
                  'Total Carbohydrates: ${totalCarbohydrates3.toStringAsFixed(2)} g'),
              Text('Protein: ${protein3.toStringAsFixed(2)} g'),

              // Calculate button for the whole table
              const SizedBox(height: 20),
             ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TotalPage(
                        totalNutrition: totalNutrition,
                        ),
                    ),
                  );
                },
                child: Text('Calculate All'),
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
