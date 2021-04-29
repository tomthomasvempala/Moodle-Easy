import 'package:flutter/material.dart';

var timeTable = [
  ["DBMS", "DBMS", "GT", "HUT", "OSL"],
  ["COA", "OS", "DBMS", "DBMS", "DEL"],
  ["HNRS", "COA", "GT", "OS", "MNR"],
  ["COA", "OS", "GT", "HNRS", "MNR"],
  ["OS", "COA", "GT", "HUT", "HNRS"],
];

String getPeriod() {
  var now = DateTime.now();
  var day = now.weekday;
  int perNum;
  TimeOfDay timeOfDay = TimeOfDay.now();
  if (day == 5) {
    //IF FRIDAY
    if (timeIsBetween(8, 30, 9, 10, timeOfDay)) {
      perNum = 0;
    } else if (timeIsBetween(9, 10, 10, 00, timeOfDay)) {
      perNum = 1;
    } else if (timeIsBetween(10, 00, 11, 50, timeOfDay)) {
      perNum = 2;
    } else if (timeIsBetween(10, 50, 11, 40, timeOfDay)) {
      perNum = 3;
    } else if (timeIsBetween(11, 40, 16, 00, timeOfDay)) {
      perNum = 4;
    } else {
      perNum = 0;
    }
  } else {
    if (timeIsBetween(8, 30, 9, 30, timeOfDay)) {
      perNum = 0;
    } else if (timeIsBetween(9, 30, 10, 30, timeOfDay)) {
      perNum = 1;
    } else if (timeIsBetween(10, 30, 11, 30, timeOfDay)) {
      perNum = 2;
    } else if (timeIsBetween(11, 30, 12, 30, timeOfDay)) {
      perNum = 3;
    } else if (timeIsBetween(12, 30, 15, 30, timeOfDay)) {
      perNum = 4;
    } else {
      perNum = 0;
    }
  }

  return timeTable[day - 1][perNum];
}

bool timeIsBetween(int h1, int m1, int h2, int m2, TimeOfDay timeOfDay) {
  var hn = timeOfDay.hour;
  var mn = timeOfDay.minute;
  if (((hn == h1 && mn >= m1) || hn > h1) &&
      ((hn == h2 && mn < m2) || hn < h2)) {
    print("$hn $mn");
    return true;
  } else {
    return false;
  }
}
