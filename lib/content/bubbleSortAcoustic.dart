import 'package:flutter/material.dart';
import '../widgets/audioPlayer.dart';

class BubbleSortAcoustic extends StatefulWidget {
  const BubbleSortAcoustic({super.key});

  @override
  State<BubbleSortAcoustic> createState() => _BubbleSortAcousticState();
}

class _BubbleSortAcousticState extends State<BubbleSortAcoustic> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Bubble Sort is a simple sorting algorithm that repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. This process continues until the list is sorted."),
          SizedBox(height: 20),

          Text(
            "Find out more about Bubble Sort by pressing Play",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          AudioPlayerWidget(
              audioUrl: 'bubblesort.mp3',
              text: "Bubble Sort"
          ),


        ],
      ),
    );
  }
}
