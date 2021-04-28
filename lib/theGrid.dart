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
            Row(
              children: [
                Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(subjectData["image"] ??
                                "https://storage-prtl-co.imgix.net/endor/articles/2917/images/1612871593_radowan-nakif-rehan-cyyqhdbj9ti-unsplash.jpg?max-w=660&max-h=532&fit=crop&auto=format,compress&q=40")))),
                SizedBox(
                  width: 30,
                ),
                Text(subjectData["name"],
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              ],
            ),
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
