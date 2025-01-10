import 'package:flutter/material.dart';
import '../widgets/audioPlayer.dart';

class InsertionSortAcoustic extends StatefulWidget {
  const InsertionSortAcoustic({super.key});

  @override
  State<InsertionSortAcoustic> createState() => _InsertionSortAcousticState();
}

class _InsertionSortAcousticState extends State<InsertionSortAcoustic> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Insertion Sort is an easy and intuitive sorting algorithm that works by dividing the array into a 'sorted' and 'unsorted' part. At each step, it picks the first element of the unsorted part and inserts it into its correct position in the sorted part."),
          SizedBox(height: 20),

          Text(
            "Find out more about Insertion Sort by pressing Play",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          AudioPlayerWidget(
              audioUrl: 'insertionsort.mp3',
              text: "Insertion Sort"
          ),
        ],
      ),
    );
  }
}
