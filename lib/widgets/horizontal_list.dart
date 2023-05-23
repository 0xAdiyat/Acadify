import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final int startColor, endColor;
  final String courseHeadline, courseTitle, courseImage;

  const HorizontalList(
      {Key? key,
      required this.startColor,
      required this.endColor,
      required this.courseHeadline,
      required this.courseTitle,
      required this.courseImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26.0),
      child: Container(
        height: 349,
        width: 246,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(1, 0.0),
            colors: <Color>[
              Color(startColor),
              Color(endColor),
            ],
          ),
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 39,
              decoration: BoxDecoration(
                color: Color(0xFFAFA8EE),
                borderRadius: BorderRadius.circular(36),
              ),
            )
          ],
        ),
      ),
    );
  }
}
