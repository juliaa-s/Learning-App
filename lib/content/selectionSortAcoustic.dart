import 'package:flutter/material.dart';
import '../widgets/audioPlayer.dart';

class SelectionSortAcoustic extends StatefulWidget {
  const SelectionSortAcoustic({super.key});

  @override
  State<SelectionSortAcoustic> createState() => _SelectionSortAcousticState();
}

class _SelectionSortAcousticState extends State<SelectionSortAcoustic> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Selection Sort is a simple sorting algorithm that works by repeatedly finding the smallest element from the unsorted part of the array and swapping it with the first unsorted element."),
          SizedBox(height: 20),
          Text(
            "Find out more about Selection Sort by pressing Play",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          AudioPlayerWidget(
            audioUrl: 'selectionsort.mp3',
            text: "Selection Sort"
          ),
        ],
      ),
    );
  }
}
