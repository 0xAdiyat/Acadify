import 'package:acadify/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalList extends StatefulWidget {
  final int startColor, endColor, courseHeadlineColor;
  final String courseHeadline, courseTitle, courseImage;

  const HorizontalList({
    Key? key,
    required this.startColor,
    required this.endColor,
    required this.courseHeadline,
    required this.courseTitle,
    required this.courseImage,
    required this.courseHeadlineColor,
  }) : super(key: key);

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animations when the widget is initialized
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26.0),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              height: 349,
              width: 246,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: const Alignment(1, 0.0),
                  colors: <Color>[
                    Color(widget.startColor),
                    Color(widget.endColor),
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
                        color: Color(widget.courseHeadlineColor),
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Text(
                        widget.courseHeadline,
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
                      widget.courseTitle,
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
                      widget.courseImage,
                      scale: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
