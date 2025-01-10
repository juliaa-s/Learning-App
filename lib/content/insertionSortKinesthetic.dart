import 'package:flutter/material.dart';
import '../styles/colors.dart';
import 'insertionSortText.dart';

class InsertionSortKinesthetic extends StatefulWidget {
  @override
  _InsertionSortKinestheticState createState() => _InsertionSortKinestheticState();
}

class _InsertionSortKinestheticState extends State<InsertionSortKinesthetic> {
  List<int> array = [5, 2, 9, 3, 1, 4];
  List<Map<dynamic, dynamic>> steps = [];
  List<int> highlightedSquares1 = [];
  List<int> highlightedSquares2 = [];
  List<int> numbers = [];
  String message = "";
  int currentStep = 0;
  bool isRunning = false;

  _InsertionSortKinestheticState (){
    simulateSInsertionSort(array);
  }

  void simulateSInsertionSort(List<int> arr) {
    int value_i = 0;
    Map startStep = {"currentElements": [], "sortedElements": [], "numbers": [...arr], "message": ""};
    steps.add(startStep);
    steps.add({
      "currentElements": <int>[],
      "sortedElements" : [0],
      "numbers": List.from(arr),
      "message" : "The first element is considered sorted.",
    });

    int n = arr.length;
    for (int i = 1; i < n; i++) {
      value_i = arr[i];
      if (i !=1){
        steps.add({
          "currentElements": <int>[],
          "sortedElements" : List.generate(i, (index) => index),
          "numbers": List.from(arr),
          "message" : "Now we have $i sorted elements."
        });
      }

      steps.add({
        "currentElements": <int>[i],
        "sortedElements" : List.generate(i, (index) => index),
        "numbers": List.from(arr),
        "message" : i==1? "We start with the element next to the sorted element ..." : "We continue with the element next to the sorted elements ...",
      });

      int key = arr[i];
      int j = i - 1;
      while (j >= 0 && arr[j] > key) {
        arr[j + 1] = arr[j];
        j = j - 1;
      }
      arr[j + 1] = key;
      steps.add({
        "currentElements": <int>[arr.indexOf(value_i)],
        "sortedElements" : List.generate(i + 1, (index) => index != arr.indexOf(value_i) ? index : -1).where((element) => element != -1).toList(),
        "numbers": List.from(arr),
        "message" : "... and place it in the correct position under the already sorted elements.",
      });
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
          InsertionSortText(),
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
            child: Text("Start Insertion Sort"),
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