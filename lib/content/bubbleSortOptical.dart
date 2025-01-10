import 'package:flutter/material.dart';
import "bubbleSortText.dart";

class BubbleSortOptical extends StatelessWidget {
  const BubbleSortOptical({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          BubbleSortText(),
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
                'assets/bubblesort_diagramm.png',
                fit: BoxFit.cover, // (cover, contain, fill)
              ),
          ),
          SizedBox(height: 8),
          Text(
            'Source: https://www.softwareideas.net/a/1598/bubble-sort-flowchart-',
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
