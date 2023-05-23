import 'package:acadify/data/dummy_data.dart';
import 'package:acadify/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/horizontal_list.dart';
import '../widgets/vertical_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 20),
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              "Acadify",
              style: GoogleFonts.roboto(
                fontSize: 36,
                color: AppColors.colorWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 349,
              child: ListView.builder(
                  itemCount: recommendList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HorizontalList(
                      startColor: recommendList[index]['startColor'],
                      endColor: recommendList[index]['endColor'],
                      courseHeadline: recommendList[index]['courseHeadline'],
                      courseTitle: recommendList[index]['courseTitle'],
                      courseImage: recommendList[index]['courseImage'],
                      courseHeadlineColor: recommendList[index]
                          ['courseHeadlineColor'],
                    );
                  }),
            ),
            SizedBox(
              height: 34,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Free online class',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorWhite,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'From over 80 lectures',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    color: AppColors.colorSecondaryGrey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            ListView.builder(
                itemCount: courseList.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return VerticalList(
                    courseImage: courseList[index]['courseImage'],
                    courseTitle: courseList[index]['courseTitle'],
                    courseDuration: courseList[index]['courseDuration'],
                    courseRating: courseList[index]['courseRating'],
                  );
                })
          ],
        ),
      ),
    );
  }
}
