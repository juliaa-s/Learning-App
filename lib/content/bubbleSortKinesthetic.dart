import 'package:flutter/material.dart';
import '../styles/colors.dart';
import 'testBubbleSort.dart';
import 'bubbleSortText.dart';

class BubbleSortKinesthetic extends StatefulWidget {
  @override
  _BubbleSortKinestheticState createState() => _BubbleSortKinestheticState();
}

class _BubbleSortKinestheticState extends State<BubbleSortKinesthetic> {
  List<int> array = [5, 2, 9, 3, 1, 4];
  List<Map<dynamic, dynamic>> steps = [];
  List<int> highlightedSquares1 = [];
  List<int> highlightedSquares2 = [];
  List<int> numbers = [];
  String message = "";
  int currentStep = 0;
  bool isRunning = false;

  _BubbleSortKinestheticState (){
    simulateBubbleSort(array);
  }

  void simulateBubbleSort(List<int> arr) {
    Map startStep = {"currentElements": [], "sortedElements": [], "numbers": [...arr], "message": ""};
    steps.add(startStep);
    int n = arr.length;
    for (int i = 0; i < n - 1; i++) {
      // bool swapped = false;
      for (int j = 0; j < n - i - 1; j++) {
        if (i!=0 && j==0) {
          Map step = {};
          step["currentElements"] = <int>[];
          step["sortedElements"] = [for (var a in array) if (a > n-i-1) a];
          step["numbers"] = List.from(arr);  // Deep Copy
          step["message"] = "The ${arr[n-i]} is now in the right position";
          steps.add(step);
        }
        Map step = {};
        step["currentElements"] = [j, j+1];
        step["sortedElements"] = [for (var a in array) if (a > n-i-1) a];
        step["numbers"] = List.from(arr);  // Deep Copy
        step["message"] = "Compare adjacent elements";
        steps.add(step);
        if (arr[j] > arr[j + 1]) {
          // Swap numbers
          int temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
          Map step = {};
          step["currentElements"] = [j, j+1];
          step["sortedElements"] = [for (var a in array) if (a > n-i-1) a];
          step["numbers"] = List.from(arr);  // Deep Copy
          step["message"] = "Swap!";
          steps.add(step);
        }
        else {
          Map step = {};
          step["currentElements"] = <int>[j, j+1];
          step["sortedElements"] = [for (var a in array) if (a > n-i-1) a];
          step["numbers"] = List.from(arr);  // Deep Copy
          step["message"] = "Already in the right order. No swapping needed";
          steps.add(step);
        }
      }
    }
    Map step = {};
    step["currentElements"] = <int>[];
    step["numbers"] = List.from(arr);  // Deep Copy
    step["sortedElements"] = List.generate(arr.length, (index) => index);
    step["message"] = "The ${arr[0]} as well as the ${arr[1]} are now in the right position. Finished!";
    steps.add(step);
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
          BubbleSortText(),
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
            child: Text("Start BubbleSort"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: isRunning ? startSort : null,
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