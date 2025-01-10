import 'package:flutter/cupertino.dart';

class InsertionSortText extends StatelessWidget {
  const InsertionSortText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Insertion Sort is an easy and intuitive sorting algorithm that works by dividing the array into a 'sorted' and 'unsorted' part. At each step, it picks the first element of the unsorted part and inserts it into its correct position in the sorted part."),
        Text("This algorithm is efficient for nearly sorted data with a best-case time complexity of O(n). It's worst-case and average-case time complexity is O(n²)."),
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
                text: "Start with the second element of the array ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "as the first element is assumed to be sorted.\n",
              ),
              TextSpan(
                text: "2. ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "If it is smaller than the first element, swap them.\n",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "3. ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "Continue with the next element on the right",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " and ",
              ),
              TextSpan(
                text: "place it in the correct position",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " under the already sorted elements on the left.\n",
              ),
              TextSpan(
                text: "4. ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "Repeat",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " until the entire array is sorted.",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
