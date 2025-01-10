import 'package:flutter/material.dart';
import '../styles/colors.dart';
import 'selectionSortText.dart';

class SelectionSortKinesthetic extends StatefulWidget {
  @override
  _SelectionSortKinestheticState createState() => _SelectionSortKinestheticState();
}

class _SelectionSortKinestheticState extends State<SelectionSortKinesthetic> {
  List<int> array = [5, 2, 9, 3, 1, 4];
  List<Map<dynamic, dynamic>> steps = [];
  List<int> highlightedSquares1 = [];
  List<int> highlightedSquares2 = [];
  List<int> numbers = [];
  String message = "";
  int currentStep = 0;
  bool isRunning = false;

  _SelectionSortKinestheticState (){
    simulateSelectionSort(array);
  }

  void simulateSelectionSort(List<int> arr) {
    Map startStep = {"currentElements": [], "sortedElements": [], "numbers": [...arr], "message": ""};
    steps.add(startStep);

    int n = arr.length;
    for (int i = 0; i < n - 1; i++) {
      if (i != 0) {
        steps.add({
          "currentElements": <int>[],
          "sortedElements": List.generate(i, (index) => index),
          "numbers": List.from(arr),
          "message": i == 1
              ? "The first element is now sorted"
              : "The first $i elements are now sorted",
        });
      }
      int minIndex = i;
      for (int j = i + 1; j < n; j++) {
        if (arr[j] < arr[minIndex]) {
          minIndex = j;
        }
      }
      steps.add({
        "currentElements": [minIndex],
        "sortedElements" : List.generate(i, (index) => index),
        "numbers": List.from(arr),
        "message" : i==0 ? "Find the smallest element" : "Find the smallest element among the remaining unsorted elements",
      });
      steps.add({
        "currentElements": <int>[minIndex, i],
        "sortedElements" : List.generate(i, (index) => index),
        "numbers": List.from(arr),
        "message" : "Swap it with the ${i+1}. element",
      });

      int temp = arr[minIndex];
      arr[minIndex] = arr[i];
      arr[i] = temp;

      if (minIndex != i) {
        steps.add({
          "currentElements": <int>[minIndex, i],
          "sortedElements": List.generate(i, (index) => index),
          "numbers": List.from(arr),
          "message": "Swap it with the ${i + 1}. element",
        });
      }
    }

    steps.add({
      "currentElements": <int>[],
      "sortedElements" : List.generate(arr.length, (index) => index),
      "numbers": List.from(arr),
      "message" : "Finished!",
    });

  }

  void startSort() {
    setState(() {
      isRunning = true;
      currentStep = 0;
      nextStep();
    });
  }

  void nextStep() {
    if(currentStep < steps.length-1) {
      setState(() {
        currentStep ++;
        highlightedSquares1 = steps[currentStep]["currentElements"];
        highlightedSquares2 = steps[currentStep]["sortedElements"];
        numbers = [...steps[currentStep]["numbers"]];
        message = steps[currentStep]["message"];
      });
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
        highlightedSquares1 = steps[currentStep]["currentElements"];
        highlightedSquares2 = steps[currentStep]["sortedElements"];
        numbers = [...steps[currentStep]["numbers"]];
        message = steps[currentStep]["message"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SelectionSortText(),
          SizedBox(height: 20),
          Text(
            "Simulation",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text("Explore the algorithm step by step by using this simulation:"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(steps[currentStep]["numbers"].length, (index) {
              bool isHighlighted1 = highlightedSquares1.contains(index);
              bool isHighlighted2 = highlightedSquares2.contains(index);

              return GestureDetector(
                child: Container(
                  width: 40,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  color: isHighlighted1
                      ? AppColors().colors[0]
                      : isHighlighted2
                      ? Colors.lightGreen
                      : Colors.grey,
                  alignment: Alignment.center,
                  child: Text(
                    steps[currentStep]["numbers"][index].toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 17),
          Center(child: Text(steps[currentStep]["message"])),
          SizedBox(height: 23),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: isRunning && currentStep > 1 ? previousStep : null,
                child: Text("Previous Step"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: isRunning && currentStep < steps.length-1 ? nextStep : null,
                child: Text("Next Step"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: !isRunning ? startSort : null,
            child: Text("Start Selection Sort"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: isRunning ? () {setState(() {
              currentStep = 0;
              highlightedSquares2 = [];
              highlightedSquares1 = [];
              message = "";
              numbers = steps[currentStep]["numbers"];
            });} : null,
            child: Text("Restart"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}