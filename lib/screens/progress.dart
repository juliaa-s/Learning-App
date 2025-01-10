import 'package:flutter/material.dart';
import '../models/student.dart';
import '../content/gradeMessage.dart';

class ProgressScreen extends StatelessWidget {
  final Student student;
  final List<String> chapters;

  ProgressScreen({required this.student, required this.chapters});

  double calculateAverageGrade(){
    List<double> allGrades = student.grades.values.expand((array)=>array).toList();
    if (allGrades.isEmpty) return 0.0;
    double sum = allGrades.reduce((a,b)=>a+b);
    return sum / allGrades.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Column(
        children: [
          Center(
            child: Text("Progress",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Spacer(),

          ...List.generate(3, (i) {
            double chapterAvg = student.grades[i]!.isEmpty ? 0.0 : student.grades[i]!.reduce((a, b) => a + b) / student.grades[i]!.length;
            return Column(
              children: [
                Text(
                  chapters[i].toUpperCase(),
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 16),
                Text("Chapter Read Count: ${student.chapterReadCount[i]}"),
                Text("Test Attempt Count: ${student.testDoneCount[i]}"),
                if (student.grades[i]!.isNotEmpty ) ...{
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Test Grades: ${student.grades[i]?.join(', ')}  ",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: "|",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
                        ),
                        TextSpan(
                          text: "  \u00D8: ${chapterAvg.toStringAsFixed(2)}",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                } else ...{
                   SizedBox.shrink(),
                },
                SizedBox(height: 48),
              ],
            );
          }),

          Spacer(),

          (student.grades.values.any((array)=>array.isNotEmpty)) ? Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Your average grade is:  ",
                    ),
                    TextSpan(
                      text: "${(calculateAverageGrade()).toStringAsFixed(2)}",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Builder(
                builder: (context) {
                  return Text(
                    gradeMessage(calculateAverageGrade()),
                      style: TextStyle(fontSize: 15)
                  );
                },
              ),
            ],
          ) : SizedBox(),

          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
