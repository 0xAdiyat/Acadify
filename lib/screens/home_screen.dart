import 'dart:ui';

import 'package:acadify/data/dummy_data.dart';
import 'package:acadify/utils/colors.dart';
import 'package:acadify/utils/size.dart';
import 'package:acadify/widgets/neon_circle_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/horizontal_list.dart';
import '../widgets/vertical_list.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _expanded = false;
  double _currentHeight = AppSize.minHeight;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 600));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final menuWidth = size.width * 0.5;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.colorPrimary,
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.only(
                  left: 20, top: 20, bottom: AppSize.minHeight),
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Acadify",
                      style: GoogleFonts.roboto(
                        fontSize: 36,
                        color: AppColors.colorWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Master Class",
                      style: GoogleFonts.roboto(
                        fontSize: 36,
                        color: AppColors.colorWhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
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
                          courseHeadline: recommendList[index]
                              ['courseHeadline'],
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
                  },
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onVerticalDragUpdate: _expanded
              ? (details) {
                  setState(() {
                    final newHeight = _currentHeight - details.delta.dy;
                    _animationController.value =
                        _currentHeight / AppSize.maxHeight;
                    _currentHeight =
                        newHeight.clamp(AppSize.minHeight, AppSize.maxHeight);
                  });
                }
              : null,
          onVerticalDragEnd: _expanded
              ? (details) {
                  if (_currentHeight < AppSize.maxHeight / 2) {
                    _animationController.reverse();
                    _expanded = false;
                  } else {
                    _expanded = true;
                    _animationController.forward(
                        from: _currentHeight / AppSize.maxHeight);
                    _currentHeight = AppSize.maxHeight;
                  }
                }
              : null,
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, snapshot) {
                final value = ElasticInOutCurve(0.7)
                    .transform(_animationController.value);

                return Stack(
                  children: [
                    Positioned(
                      height:
                          lerpDouble(AppSize.minHeight, _currentHeight, value),
                      left:
                          lerpDouble(size.width / 2 - menuWidth / 2, 0, value),
                      width: lerpDouble(menuWidth, size.width, value),
                      bottom: lerpDouble(40.0, 0.0, value),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.cardColor,
                          borderRadius: BorderRadius.vertical(
                            top: _expanded
                                ? Radius.circular(40)
                                : Radius.circular(20),
                            bottom:
                                Radius.circular(lerpDouble(20.0, 0.0, value)!),
                          ),
                        ),
                        child: _expanded
                            ? Opacity(
                                opacity: _animationController.value,
                                child: _buildExpandedContent())
                            : _buildMenuContent(),
                      ),
                    ),
                  ],
                );
              }),
        )
      ],
    );
  }

  Widget _buildMenuContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(CupertinoIcons.bookmark),
        GestureDetector(
            onTap: () {
              setState(() {
                _expanded = true;
                _currentHeight = AppSize.maxHeight;
                _animationController.forward(from: 0.0);
              });
            },
            child: NeonCircleAvatar(
              radius: 25,
              imageUrl: "https://avatars.githubusercontent.com/u/67780459?v=4",
            )),
        const Icon(CupertinoIcons.shopping_cart),
      ],
    );
  }
}

Widget _buildExpandedContent() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorPrimary,
                    offset: Offset(0, 4),
                    blurRadius: 8,
                    spreadRadius: 0,
                  )
                ],
                image: DecorationImage(
                    image: NetworkImage(
                        "https://avatars.githubusercontent.com/u/67780459?v=4"))),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Last Country",
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Bloody Tear",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.shuffle),
              Icon(Icons.pause),
              Icon(Icons.playlist_add)
            ],
          )
        ],
      ),
    ),
  );
}
