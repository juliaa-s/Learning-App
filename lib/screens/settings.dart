import 'package:flutter/material.dart';
import '../models/student.dart';


class Settings extends StatefulWidget {
  Student student;

  Settings({required this.student});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, widget.student.grades);
          },
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Change Learning Type", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Column(
            children: [
              RadioListTile<String>(
                title: Text("Kinesthetic"),
                value: "kinesthetic",
                groupValue: widget.student.learningStyle,
                onChanged: (value) {
                  setState(() {
                    widget.student.learningStyle = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text("Acoustic"),
                value: "acoustic",
                groupValue: widget.student.learningStyle,
                onChanged: (value) {
                  setState(() {
                    widget.student.learningStyle = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text("Optical"),
                value: "optical",
                groupValue: widget.student.learningStyle,
                onChanged: (value) {
                  setState(() {
                    widget.student.learningStyle = value!;
                  });
                },
              ),
            ],
          ),

          // Unlock content
          ListTile(
            title: Text("Skip the tests & Unlock everything", style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Are you sure?"),
                    content: Text("Learning step by step helps you understand the material better"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          widget.student.unlockEverything();
                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: Text("Unlock"),
                      ),
                    ],
                  );
                },
              );
            },
          ),


          ListTile(
            title: Text("Reset App", style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirm action?"),
                    content: Text("All progress will be deleted."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          widget.student.reset();
                          Navigator.of(context).pop(); // Dismiss the dialog
                        },
                        child: Text("Reset"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}









