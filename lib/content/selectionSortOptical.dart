import 'package:flutter/material.dart';
import 'selectionSortText.dart';

class SelectionSortOptical extends StatefulWidget {
  const SelectionSortOptical({super.key});

  @override
  State<SelectionSortOptical> createState() => _SelectionSortOpticalState();
}

class _SelectionSortOpticalState extends State<SelectionSortOptical> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SelectionSortText(),
          SizedBox(height: 20),

          Text(
            "Flow Chart",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text("See the following flow chart for a precise visualization of the algorithm. The input of the algorithm is an array. Try applying the algorithm to your own example array using the flow chart as a guide!"),
          SizedBox(height: 17),
          Center(
            child: Image.asset(
              'assets/selectionsort_diagramm.png',
              fit: BoxFit.cover, // (cover, contain, fill)
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Source: https://www.softwareideas.net/a/1599/selection-sort-flowchart-',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
