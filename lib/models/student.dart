import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Student {
  List <int> chapterReadCount;
  List <int> testDoneCount;
  Map <int, List<double>> grades;
  String learningStyle;
  bool unlock = false;

  Student(this.learningStyle, this.chapterReadCount, this.testDoneCount, this.grades);

  void reset(){
    learningStyle = "kinesthetic";
    chapterReadCount = [0, 0, 0];
    testDoneCount = [0, 0, 0];
    grades = {0: [], 1: [], 2: []};
    unlock = false;
  }

  void unlockEverything(){
    unlock = true;
  }

  bool completedChapter(int chapter){
    if (chapter == -1) return true;
    if (unlock) return true;
    return chapterReadCount[chapter]>=1 ? true : false;
  }

  bool completedTest(int chapter){
    if (chapter==-1) return true;
    if (unlock) return true;
    return grades[chapter]!.any((element) => element >= 5);
  }

  Map<String, dynamic> toJson() {
    return {
      'learningStyle': learningStyle,
      'chapterReadCount': chapterReadCount,
      'testDoneCount': testDoneCount,
      'grades': grades,
    };
  }

  static Student fromJson(Map<String, dynamic> json) {
    return Student(
      json['learningStyle'],
      List<int>.from(json['chapterReadCount']),
      List<int>.from(json['testDoneCount']),
      Map<int, List<double>>.from(json['grades']),
    );
  }

  Future<void> saveStudent() async {
    final prefs = await SharedPreferences.getInstance();
    String jsonStudent = jsonEncode(toJson());
    prefs.setString('student_data', jsonStudent);
  }
}
