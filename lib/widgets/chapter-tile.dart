import 'package:flutter/material.dart';

class ChapterTile extends StatelessWidget {
  final int chapterNumber;
  final String chapterTitle;
  bool isUnlocked;
  final VoidCallback? onTap;
  final Color color;

  ChapterTile({required this.chapterNumber, required this.isUnlocked, required this.chapterTitle, this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        color: isUnlocked ? Color(0xFFE3DCE4) : color,
        child: Center(child: Text("Chapter $chapterNumber: $chapterTitle", style: TextStyle(color: Colors.black87))),
      ),
    );
  }
}