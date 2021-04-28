import 'package:flutter/material.dart';
import 'package:moodle/timetable.dart';

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
                .toList(),
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
