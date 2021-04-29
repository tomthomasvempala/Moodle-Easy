import 'package:flutter/material.dart';
import 'package:moodle/Data/subjects.dart';
import 'package:moodle/UI/drawerTT.dart';
import 'package:moodle/UI/theGrid.dart';
import 'package:moodle/Data/timetable.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var selected = "AFM";
  @override
  Widget build(BuildContext context) {
    Size pageSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text("Home"),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          )),
      drawer: TimeTableDrawer(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: pageSize.height,
              width: 200,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: subjects
                        .map<Widget>((e) => Container(
                            decoration: BoxDecoration(
                                color: selected == e["sub"]
                                    ? Colors.orange
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
                                          : Colors.orange),
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
