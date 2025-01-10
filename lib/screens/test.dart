import 'package:flutter/material.dart';
import '../content/testBubbleSort.dart';
import '../content/testInsertionSort.dart';
import '../content/testSelectionSort.dart';
import '../models/student.dart';

class Test extends StatefulWidget {
  final Student student;
  final int chapter;

  Test({required this.student, required this.chapter});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  void handleValueChange(double newValue) {
    setState(() {
      widget.student.grades[widget.chapter-1]?.add(newValue);
      widget.student.testDoneCount[widget.chapter-1]+=1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          [widget.chapter==1? "Insertion Sort: ":widget.chapter==2?"Selection Sort: ":"Bubble Sort: "," Test"].join(""),
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, widget.student.grades);
          },
        ),
      ),
      body:
        widget.chapter==1? TestInsertionSort(handleValueChange) : widget.chapter==2 ? TestSelectionSort(handleValueChange) : TestBubbleSort(handleValueChange),
    );
  }
}


// !! student.testDoneCount[chapter - 1]++;