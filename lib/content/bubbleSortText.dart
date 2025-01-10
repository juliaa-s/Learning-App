import 'package:flutter/cupertino.dart';

class BubbleSortText extends StatelessWidget {
  const BubbleSortText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Bubble Sort is a simple sorting algorithm that repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. This process continues until the list is sorted. The algorithm gets its name because smaller elements \"bubble\" to the top of the list."),
        Text("It has a worst-case and average-case time complexity of O(n²), making it inefficient for large datasets. It's easy to understand and implement but rarely used in practical applications due to its inefficiency."),
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
                  text: "Loop through the array",
                  style: TextStyle(fontWeight: FontWeight.bold)
              ),
              TextSpan(
                  text: " as many times as it has elements.\n"
              ),
              TextSpan(
                text: "2. ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                  text: "Move from the first element to the last unsorted element.\n",
                  style: TextStyle(fontWeight: FontWeight.bold)
              ),
              TextSpan(
                text: "3. ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "Compare the current element",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " with its neighbor on the right.\n",
              ),
              TextSpan(
                text: "4. ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "Swap them",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " if the current element is larger than the next one.\n",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
