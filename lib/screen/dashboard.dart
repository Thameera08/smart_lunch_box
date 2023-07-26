import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Table(
        defaultColumnWidth: FixedColumnWidth(120.0),
        border: TableBorder.all(
            color: Colors.white, style: BorderStyle.solid, width: 2),
        children: [
          TableRow(children: [
            Column(children: [
              Text('Carbohydrates',
                  style: TextStyle(fontSize: 20.0, color: Colors.white))
            ]),
            Column(children: [
              Text('Fats',
                  style: TextStyle(fontSize: 20.0, color: Colors.white))
            ]),
            Column(children: [
              Text('Protein',
                  style: TextStyle(fontSize: 20.0, color: Colors.white))
            ]),
            TableRow(children: [
              Column(children: [Text('')],)
            ])
          ]),
        ],
      ),
    );
  }
}
