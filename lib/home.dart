import 'package:flutter/material.dart';
import 'package:moodle/drawerTT.dart';
import 'package:moodle/theGrid.dart';
import 'package:moodle/timetable.dart';

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
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueGrey,
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
    "image":
        "https://cdn.saleminteractivemedia.com/245/content/212250/3-ballot-1000x500.jpg",
    "links": {
      "Home": "http://moodle.mec.ac.in/course/view.php?id=414",
      "Attendance": "http://moodle.mec.ac.in/mod/attendance/view.php?id=9902",
      "Big Blue Button":
          "http://moodle.mec.ac.in/mod/bigbluebuttonbn/view.php?id=9901"
    },
  },
  {
    "sub": "DBMS",
    "name": "Database Management System",
    "image":
        "https://cdn.lynda.com/course/604214/604214-637491156658449354-16x9.jpg",
    "links": {
      "Home": "http://moodle.mec.ac.in/course/view.php?id=407",
      "Attendance": "http://moodle.mec.ac.in/mod/attendance/view.php?id=10120",
      "Google Meet": "https://meet.google.com/uax-rfxc-jnr"
    },
  },
  {
    "sub": "OS",
    "name": "Operating System",
    "image": "https://miro.medium.com/max/360/1*rk1o0WQWtR1tEGcsEMIpEQ.png",
    "links": {
      "Home": "http://moodle.mec.ac.in/course/view.php?id=433",
      "Attendance": "http://moodle.mec.ac.in/mod/attendance/view.php?id=10137",
    }
  },
  {
    "sub": "COA",
    "name": "Computer Organisation and Architecture",
    "image": "https://miro.medium.com/max/700/0*pPgqu6f2zz76HrQE.jpg",
    "links": {
      "Home": "http://moodle.mec.ac.in/course/view.php?id=409",
      "Attendance": "http://moodle.mec.ac.in/mod/attendance/view.php?id=10118",
      "Google Meet": "http://meet.google.com/nwb-jbfa-dyo"
    }
  },
  {
    "sub": "GT",
    "name": "Graph Theory",
    "image":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Moreno_Sociogram_2nd_Grade.png/220px-Moreno_Sociogram_2nd_Grade.png",
    "links": {
      "Home": "http://moodle.mec.ac.in/course/view.php?id=410",
      "Attendance": "http://moodle.mec.ac.in/course/view.php?id=410"
    }
  },
  {
    "sub": "OSL",
    "name": "OS Lab",
    "image": "https://cdn.automationforum.co/uploads/2018/12/operating-sys.png",
    "links": {
      "Home": "http://moodle.mec.ac.in/course/view.php?id=459",
      "Attendance": "http://moodle.mec.ac.in/mod/attendance/view.php?id=10080"
    }
  },
  {
    "sub": "DEL",
    "name": "Digital Electronics Lab",
    "image": "https://i.ytimg.com/vi/DBcWpr2HaRY/maxresdefault.jpg",
    "links": {
      "Home": "http://moodle.mec.ac.in/course/view.php?id=471",
      "Attendance": "http://moodle.mec.ac.in/mod/attendance/view.php?id=10205"
    }
  },
  {
    "sub": "HUT",
    "name": "Professional Ethics",
    "image":
        "https://www.tutorialspoint.com/professional_ethics/images/profession_ethics.jpg",
    "links": {
      "Home": "http://moodle.mec.ac.in/course/view.php?id=449",
      "Attendance": "http://moodle.mec.ac.in/mod/attendance/view.php?id=10042"
    }
  },
  {
    "sub": "HNRS",
    "name": "Honours - Machine Learning",
    "image":
        "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F966248982%2F960x0.jpg%3Ffit%3Dscale",
    "links": {
      "Home": "http://moodle.mec.ac.in/my/",
      "Attendance": "http://moodle.mec.ac.in/my/"
    }
  },
  {
    "sub": "MNR",
    "name": "Minor",
    "image":
        "https://prod-discovery.edx-cdn.org/media/course/image/c3130811-75f9-4a4c-8779-3b9993a34e05-6959adf216a8.small.jpg",
    "links": {
      "Home": "http://moodle.mec.ac.in/my/",
      "Attendance": "http://moodle.mec.ac.in/my/"
    }
  }
];
