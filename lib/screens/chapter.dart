import 'package:flutter/material.dart';
import '../models/student.dart';
import 'test.dart';

class Chapter extends StatefulWidget {
  final Student student;
  final String title;
  dynamic content;
  int chapter;

  Chapter({required this.student, required this.title, required this.content, required this.chapter}) {
    student.chapterReadCount[chapter-1]++;

  }

  @override
  State<Chapter> createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  dynamic res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title,
            style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.content,
            SizedBox(height: 20),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Feeling ready to test your knowledge?"),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () async {
                    res = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Test(student: widget.student, chapter: widget.chapter)),
                    );
                    Navigator.pop(context, res ?? widget.student.grades);
                  },
                  child: Text("Go to Test"),
                ),
              ],
            ),
          ]
        ),
      ),
    );

  }
}
