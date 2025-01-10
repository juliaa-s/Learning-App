import 'package:flutter/cupertino.dart';

class SelectionSortText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Selection Sort is a simple sorting algorithm that works by repeatedly finding the smallest element from the unsorted part of the array and swapping it with the first unsorted element."),
        Text(" Its best-case, average-case, and worst-case time complexity is O(n²), as it always performs the same number of comparisons regardless of the initial order of the elements."),
        SizedBox(height: 20),

        Text(
          "Description",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 10),

        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "1. ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "Find the smallest element and swap it with the first element. ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "This way we get the smallest element at its correct position.\n",
              ),
              TextSpan(
                text: "2. ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "Find the smallest among the remaining elements",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " (or second smallest) and ",
              ),
              TextSpan(
                text: "swap it",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " with the second element.\n",
              ),
              TextSpan(
                text: "3. ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "Keep doing this ",
              ),
              TextSpan(
                text: "until all elements are sorted.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
