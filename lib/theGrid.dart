import 'package:flutter/material.dart';
import 'dart:js' as js;

class TheGrid extends StatelessWidget {
  final Map<String, dynamic> subjectData;
  TheGrid({this.subjectData});
  @override
  Widget build(BuildContext context) {
    Map<String, String> links = subjectData["links"];
    List<Widget> listOfLinks = [];
    links.forEach((key, value) {
      listOfLinks.add(ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))))),
          onPressed: () {
            js.context.callMethod('open', [value]);
          },
          child: Column(
            children: [
              Spacer(),
              Icon(
                myIcons[key] ?? Icons.question_answer,
                size: 80,
              ),
              Spacer(),
              Text(key),
              SizedBox(
                height: 20,
              )
            ],
          )));
    });
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subjectData["name"],
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    childAspectRatio: 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                children: listOfLinks,
              ),
            ),
          ],
        ));
  }
}

var myIcons = {
  "Home": Icons.home,
  "Attendance": Icons.class_,
};
