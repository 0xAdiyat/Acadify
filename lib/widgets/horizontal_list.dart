import 'package:acadify/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalList extends StatelessWidget {
  final int startColor, endColor, courseHeadlineColor;
  final String courseHeadline, courseTitle, courseImage;

  const HorizontalList(
      {Key? key,
      required this.startColor,
      required this.endColor,
      required this.courseHeadline,
      required this.courseTitle,
      required this.courseImage,
      required this.courseHeadlineColor})
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
            end: const Alignment(1, 0.0),
            colors: <Color>[
              Color(startColor),
              Color(endColor),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 11,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 39,
                decoration: BoxDecoration(
                  color: Color(courseHeadlineColor),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Text(
                  courseHeadline,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    color: AppColors.colorWhite,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 14,
              child: Text(
                courseTitle,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                courseImage,
                scale: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
