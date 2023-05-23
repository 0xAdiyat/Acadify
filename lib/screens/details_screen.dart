import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String courseTitle;

  const DetailsScreen({Key? key, required this.courseTitle}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.courseTitle,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.courseTitle),
        ),
      ),
    );
  }
}
