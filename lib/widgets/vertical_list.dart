import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class VerticalList extends StatelessWidget {
  final String courseImage, courseTitle, courseDuration;
  final double courseRating;

  const VerticalList(
      {Key? key,
      required this.courseImage,
      required this.courseTitle,
      required this.courseDuration,
      required this.courseRating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: 150,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 92,
              width: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width * 0.13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.colorSecondary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 13,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 26.0, bottom: 19),
                child: Row(
                  children: [
                    SizedBox(
                      width: 115,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          courseTitle,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          courseDuration,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF8C8C8C),
                            fontSize: 12,
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: courseRating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          glowColor: Colors.amber,
                          glow: true,
                          unratedColor: AppColors.colorSecondaryGrey,
                          glowRadius: 1,
                          updateOnDrag: true,
                          itemCount: 5,
                          itemSize: 18,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1),
                          itemBuilder: (context, _) => const Icon(
                            CupertinoIcons.star_fill,
                            color: AppColors.colorRating,
                          ),
                          onRatingUpdate: (rating) {
                            debugPrint(rating.toString());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 14,
              child: Container(
                height: 115,
                width: 115,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(courseImage), fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              bottom: 34,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.06,
                width: MediaQuery.of(context).size.width * 0.06,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEB53A2),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: AppColors.colorWhite,
                  size: 17,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
