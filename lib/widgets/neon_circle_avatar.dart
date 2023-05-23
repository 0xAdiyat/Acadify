import 'package:acadify/utils/colors.dart';
import 'package:flutter/material.dart';

class NeonCircleAvatar extends StatelessWidget {
  final double radius;
  final String imageUrl;

  NeonCircleAvatar({required this.radius, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors
                .colorPrimary, // Adjust the color as per your preference
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
