import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<int> array = [5, 2, 9, 3, 1, 4];
  List<int> markedIndices = [];
  String message = "Tap two numbers to swap!";

  void markSquare(int index) {
    setState(() {
      if (markedIndices.length < 2) {
        markedIndices.add(index);
      } else {
        markedIndices.removeAt(0);
        markedIndices.add(index);
      }
    });
  }

  void swapNumbers() {
    if (markedIndices.length == 2) {
      setState(() {
        int temp = array[markedIndices[0]];
        array[markedIndices[0]] = array[markedIndices[1]];
        array[markedIndices[1]] = temp;
        message = "Numbers swapped!";
        markedIndices.clear();
      });
    } else {
      setState(() {
        message = "You have to mark exactly two squares!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BubbleSort Game"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "BubbleSort",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(array.length, (index) {
              return GestureDetector(
                onTap: () => markSquare(index),
                child: Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  color: markedIndices.contains(index)
                      ? Colors.blue
                      : Colors.grey,
                  alignment: Alignment.center,
                  child: Text(
                    array[index].toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: swapNumbers,
            child: Text("Swap"),
          ),
          SizedBox(height: 20),
          Text(message, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
