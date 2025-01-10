import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/student.dart';
import '../screens/settings.dart';
import '../screens/progress.dart';
import '../widgets/chapter-tile.dart';
import 'chapter.dart';
import 'test.dart';
import '../styles/colors.dart';
import '../content/bubbleSortKinesthetic.dart';
import '../content/bubbleSortOptical.dart';
import '../content/bubbleSortAcoustic.dart';
import '../content/insertionSortKinesthetic.dart';
import '../content/insertionSortOptical.dart';
import '../content/insertionSortAcoustic.dart';
import '../content/selectionSortKinesthetic.dart';
import '../content/selectionSortOptical.dart';
import '../content/selectionSortAcoustic.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}




class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver{
  Student? student;
  bool isLoading = true;
  final List<String> chapterTitles = ["Insertion Sort", "Selection Sort", "Bubble Sort"];
  dynamic res;

  Future<Student> loadStudent() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonStudent = prefs.getString('student_data');

    if (jsonStudent != null) {
      return Student.fromJson(jsonDecode(jsonStudent));
    } else {
      return Student("kinesthetic", [0, 0, 0], [0, 0, 0], {0: [], 1: [], 2: []});
    }
  }
  void updateData(Map<int, List<double>> newGrades) {
    setState(() {
      student?.grades = newGrades;
    });
  }

  @override
  void initState() {
    super.initState();
    student = Student("kinesthetic", [0, 0, 0], [0, 0, 0], {0: [], 1: [], 2: []});
    loadStudent().then((loadedStudent) {
      setState(() {
        student = loadedStudent;
        isLoading = false;
      });
    });
    // Register as observer
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      student!.saveStudent();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> wrongLevelNotification(dynamic context, int chapter, String testOrChapter){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: testOrChapter=="chapter"?
            Text("You must pass the test of chapter $chapter to unlock this chapter."):
            Text("You must successfully complete the test of chapter $chapter to unlock this test."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return isLoading ? CircularProgressIndicator() :
    Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              res = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(student: student!),
                ),
              );
              if (res!=null){
                setState(() {
                  student?.grades = res;
                });
              };
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text("Understanding the idea behind sorting algorithms",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                letterSpacing: 1.4,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Spacer(),

          Column(
            children: [
              Text(
                "Theory".toUpperCase(),
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 24,
                )
              ),
              SizedBox(height: 16),
              // Chapter tiles: shows chapter based on student's level
              for (int i = 0; i < 3; i++)
                ChapterTile(
                  chapterNumber: i + 1,
                  chapterTitle: chapterTitles[i],
                  isUnlocked: !student!.completedTest(i-1),
                  onTap: !student!.completedTest(i-1) ?
                    (){print("SFSDFJL SOO: ${student!.grades[i-1]}");wrongLevelNotification(context, i, "chapter");} :
                    () async {
                      // Navigate to chapter content screen
                      res = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            switch (i + 1) {
                              case 1:
                                return Chapter(student: student!, title: "Insertion Sort", content: student!.learningStyle=="kinesthetic"?InsertionSortKinesthetic():student!.learningStyle=="acoustic"?InsertionSortAcoustic():InsertionSortOptical(), chapter: 1);
                              case 2:
                                return Chapter(student: student!, title: "Selection Sort", content: student!.learningStyle=="kinesthetic"?SelectionSortKinesthetic():student!.learningStyle=="acoustic"?SelectionSortAcoustic():SelectionSortOptical(), chapter: 2);
                            case 3:
                                return Chapter(student: student!, title: "Bubble Sort", content: student!.learningStyle=="kinesthetic"?BubbleSortKinesthetic():student!.learningStyle=="acoustic"?BubbleSortAcoustic():BubbleSortOptical(), chapter: 3);
                              default:
                                throw Exception('Invalid chapter index: ${i + 1}');
                            }
                          },
                        ),
                      );
                      if (res != null) {
                      updateData(res);
                      }
                    },
                  color: AppColors().colors[i],
                ),
            ],
          ),

          Spacer(),

          Column(
            children: [
              Text(
                "Tests".toUpperCase(),
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 24,
                )
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      child: Text("Chapter ${i+1}", style: TextStyle(color: Colors.black87),),
                      onPressed: !student!.completedTest(i-1) ?
                        (){wrongLevelNotification(context, i, "test");} :
                        () async {
                          res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Test(student: student!, chapter: i+1);
                              },
                            ),
                          );
                          if (res!=null) {
                            setState(() {
                              student?.grades = res;
                            });
                          };
                        },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 100),
                        padding: EdgeInsets.zero,
                        backgroundColor: !student!.completedTest(i-1) ? Color(0xFFE3DCE4) : AppColors().colors[i],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),

          Spacer(),

          // Progess
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProgressScreen(student: student!, chapters: chapterTitles)),
            ),
            child: Text("View your Progress".toUpperCase(),
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                letterSpacing: 2,
                //fontWeight: FontWeight.bold,
              )),
          ),

          Spacer(),

        ],
      ),
    );
  }
}


