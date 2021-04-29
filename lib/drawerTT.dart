import 'package:flutter/material.dart';
import 'package:moodle/timetable.dart';
import 'dart:js' as js;

class TimeTableDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              Text(
                dayData["${DateTime.now().weekday}"],
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              )
            ] +
            timeTable[DateTime.now().weekday - 1]
                .map<Widget>((e) => Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:
                            getPeriod() == e ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.blue)),
                    height: 60,
                    width: 200,
                    child: Text(
                      e,
                      style: TextStyle(
                          color: getPeriod() != e ? Colors.blue : Colors.white),
                    )))
                .toList() +
            [
              SizedBox(
                height: 60,
              ),
              TextButton(
                  onPressed: () {
                    js.context.callMethod('open', [
                      "http://moodle.mec.ac.in/pluginfile.php/32870/mod_resource/content/1/CS4%20TT-2021%20EVEN%20-w.e.f-26-04-2021.pdf"
                    ]);
                  },
                  child: Text("See Full Time Table")),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    js.context
                        .callMethod('open', ["http://moodle.mec.ac.in/my/"]);
                  },
                  child: Text("Go to Dashboard"))
            ],
      ),
    );
  }
}

var dayData = {
  "1": "Monday",
  "2": "Tuesday",
  "3": "Wednesday",
  "4": "Thurday",
  "5": "Friday",
  "6": "Saturday",
  "7": "Sunday"
};
