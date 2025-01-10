import 'package:flutter/material.dart';
import 'gradeMessage.dart';

class TestInsertionSort extends StatefulWidget {
  dynamic onValueChanged;

  TestInsertionSort(this.onValueChanged);

  @override
  State<TestInsertionSort> createState() => _TestInsertionSortState();
}

class _TestInsertionSortState extends State<TestInsertionSort> {
  Map<int, dynamic> answers = {};
  Map<int, bool> isCorrect = {}; // Store correctness for each question
  bool submitted = false;
  bool showSolution = false;


  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();


  double calculateGrade() {
    int correctAnswers = isCorrect.values.where((value) => value == true).length;
    return ((correctAnswers / 5) * 10);
  }


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question 1
            Text("Question 1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text("Which worst case complexity does Insertion Sort have?"),
            const SizedBox(height: 8),
            Column(
              children: ["O(n)", "O(n^2)", "O(log n)"].map((option) {
                return ListTile(
                  title: Text(option),
                  leading: Radio<String>(
                    value: option,
                    groupValue: answers.containsKey(0) ? answers[0] : null,
                    onChanged: (value) {
                      setState(() {
                        submitted=false;
                        showSolution = false;
                        answers[0] = value!;
                        isCorrect[0] = value == "O(n^2)";
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            if (submitted && isCorrect.containsKey(0))
              Text(
                isCorrect[0]! ? "Correct!" : "Incorrect",
                style: TextStyle(
                    color: isCorrect[0]! ? Colors.green : Colors.red),
              ),
            if ((showSolution && isCorrect.containsKey(0) && !isCorrect[0]!)|| showSolution && !isCorrect.containsKey(0))
              Text(
                "The correct answer is: O(n^2)",
              ),
            const SizedBox(height: 16),

            // Question 2
            Text("Question 2", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text("How does the algorithm work?"),
            const SizedBox(height: 8),
            Column(
              children: [
                "It sorts by repeatedly swapping adjacent elements",
                "It sorts by finding the smallest element and placing it first",
                "It sorts by inserting elements into their correct position"
              ].map((option) {
                return ListTile(
                  title: Text(option),
                  leading: Radio<String>(
                    value: option,
                    groupValue: answers.containsKey(1) ? answers[1] : null,
                    onChanged: (value) {
                      setState(() {
                        submitted = false;
                        showSolution = false;
                        answers[1] = value!;
                        isCorrect[1] = value == "It sorts by inserting elements into their correct position";
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            if (submitted&& isCorrect.containsKey(1))
              Text(
                isCorrect[1]! ? "Correct!" : "Incorrect",
                style: TextStyle(
                    color: isCorrect[1]! ? Colors.green : Colors.red
                ),
              ),
            if ((showSolution && isCorrect.containsKey(1) && !isCorrect[1]!) || showSolution && !isCorrect.containsKey(1))
              Text(
                "The correct answer is: It sorts by inserting elements into their correct position",
              ),
            const SizedBox(height: 16),

            // Question 3
            Text("Question 3", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text("True or False: Insertion Sort runs faster with a sorted arrays as input then with an unsorted one."),
            const SizedBox(height: 8),
            Column(
              children: ["True", "False"].map((option) {
                return ListTile(
                  title: Text(option),
                  leading: Radio<String>(
                    value: option,
                    groupValue: answers.containsKey(2) ? answers[2] : null,
                    onChanged: (value) {
                      setState(() {
                        submitted = false;
                        showSolution = false;
                        answers[2] = value!;
                        isCorrect[2] = value == "True";
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            if (submitted && isCorrect.containsKey(2))
              Text(
                isCorrect[2]! ? "Correct!" : "Incorrect.",
                style: TextStyle(
                    color: isCorrect[2]! ? Colors.green : Colors.red),
              ),
            if ((showSolution && isCorrect.containsKey(2) && !isCorrect[2]!) || showSolution && !isCorrect.containsKey(2))
              Text(
                "The correct answer is: True",
              ),
            const SizedBox(height: 16),

            // Question 4
            Text("Question 4", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text("Given the following unsorted array. What does the array look like after the first iteration of the Insertion Sort algorithm"),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [8, 5, 6, 7, 3].map((num) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(num.toString()),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller1,
              onChanged: (value) {
                setState(() {
                  submitted = false;
                  showSolution = false;
                  answers[3] = value;
                  isCorrect[3] = value.trim().replaceAll(RegExp(r'[^0-9]'), '') == "58673";
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter 5 digits",
              ),
            ),
            if (submitted && isCorrect.containsKey(3))
              Text(
                [answers[3], isCorrect[3]! ? "is correct!" : "is incorrect."].join(" "),
                style: TextStyle(
                    color: isCorrect[3]! ? Colors.green : Colors.red),
              ),
            if ((showSolution && isCorrect.containsKey(3) && !isCorrect[3]!) || showSolution && !isCorrect.containsKey(3))
              Text(
                "The correct answer is: 5 8 6 7 3",
              ),
            const SizedBox(height: 16),

            // Question 5
            Text("Question 5", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text("The first three values in this array have already been sorted. What does the array look like after the next iteration of the Insertion Sort algorithm?"),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [3, 6, 7, 5, 4].map((num) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                    color: (num==3||num==6||num==7)?Colors.green:null,
                  ),
                  child: Text(num.toString()),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller2,
              onChanged: (value) {
                setState(() {
                  submitted = false;
                  showSolution = false;
                  answers[4] = value;
                  isCorrect[4] = value.trim().replaceAll(RegExp(r'[^0-9]'), '') == "35674";
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter 5 digits",
              ),
            ),
            if (submitted && isCorrect.containsKey(4))
              Text(
                [answers[4], isCorrect[4]! ? " is correct!" : "is incorrect."].join(" "),
                style: TextStyle(
                    color: isCorrect[4]! ? Colors.green : Colors.red),
              ),
            if ((showSolution && isCorrect.containsKey(4) && !isCorrect[4]!) || showSolution && !isCorrect.containsKey(4))
              Text(
                "The correct answer is: 3 5 6 7 4",
              ),
            const SizedBox(height: 16),







            // Show grade and message
            if (submitted) ...[
              Text(
                "Grade: ${calculateGrade().toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                gradeMessage(calculateGrade()),
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
            ],

            const SizedBox(height: 16),

            // Submit Button
            if (!submitted)
              ElevatedButton(
                onPressed: () {
                  if (answers.length != 5) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Are you sure you want to submit?"),
                          content: Text("You haven't answered all the questions."),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  submitted = true;
                                  widget.onValueChanged(calculateGrade());
                                });
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text("Submit"),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    setState(() {
                      submitted = true;
                      widget.onValueChanged(calculateGrade());
                    });
                  }
                },
                child: Text("Submit"),
              ),

            // Show Solutions Button
            if (submitted && !showSolution)
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      showSolution = true;
                    });
                  },
                  child: Text("Show Solutions"),
              )

          ],
        ),
      ),
    );
  }
}
