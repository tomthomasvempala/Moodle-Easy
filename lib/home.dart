import 'package:flutter/material.dart';
import 'package:moodle/drawerTT.dart';
import 'package:moodle/theGrid.dart';
import 'package:moodle/timetable.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var selected = "OS";
  @override
  Widget build(BuildContext context) {
    Size pageSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: Text("Home"),
      ),
      drawer: TimeTableDrawer(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: pageSize.height,
              width: 200,
              color: Colors.black87,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: subjects
                        .map<Widget>((e) => Container(
                            decoration: BoxDecoration(
                                color: selected == e["sub"]
                                    ? Colors.blue
                                    : Colors.transparent),
                            height: 60,
                            child: TextButton(
                                onPressed: () {
                                  selected = e["sub"];
                                  setState(() {});
                                },
                                child: Text(
                                  e["sub"],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: selected == e["sub"]
                                          ? Colors.black87
                                          : Colors.blue),
                                ))))
                        .toList() +
                    [
                      Spacer(),
                      Container(
                          height: 60,
                          width: 100,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red)),
                              onPressed: () {
                                selected = getPeriod();
                                setState(() {});
                              },
                              child: Text(
                                "Current Period",
                                style: TextStyle(color: Colors.black87),
                              )))
                    ],
              )),
          Expanded(child: TheGrid(
            subjectData: subjects.firstWhere((element) {
              return element["sub"] == selected;
            }),
          ))
        ],
      ),
    );
  }
}

var subjects = [
  {
    "sub": "AFM",
    "name": "Mentoring",
    "links": {"Home": "google.com", "Attendance": "gmail.com"},
  },
  {
    "sub": "DBMS",
    "name": "Database Management System",
    "links": {
      "Home": "google.com",
      "Attendance": "gmail.com",
    },
  },
  {
    "sub": "OS",
    "name": "Operating System",
    "links": {"Home": "google.com", "Attendance": "gmail.com"}
  },
  {
    "sub": "COA",
    "name": "Computer Organisation and Architecture",
    "links": {
      "Home": "http://moodle.mec.ac.in/course/view.php?id=409",
      "Attendance": "http://moodle.mec.ac.in/mod/attendance/view.php?id=10118"
    }
  },
  {
    "sub": "GT",
    "name": "Graph Theory",
    "links": {"Home": "google.com", "Attendance": "gmail.com"}
  },
  {
    "sub": "OSL",
    "name": "OS Lab",
    "links": {"Home": "google.com", "Attendance": "gmail.com"}
  },
  {
    "sub": "DEL",
    "name": "Digital Electronics Lab",
    "links": {"Home": "google.com", "Attendance": "gmail.com"}
  },
  {
    "sub": "HUT",
    "name": "Professional Ethics",
    "links": {"Home": "google.com", "Attendance": "gmail.com"}
  },
  {
    "sub": "HNRS",
    "name": "Honours - Machine Learning",
    "links": {"Home": "google.com", "Attendance": "gmail.com"}
  },
  {
    "sub": "MNR",
    "name": "Minor",
    "links": {"Home": "google.com", "Attendance": "gmail.com"}
  }
];
