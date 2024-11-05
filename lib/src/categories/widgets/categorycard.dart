import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gromuse/commons/utils/kcolors.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;


  const CategoryCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Kolors.kDarkTeal,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 60.0,
              height: 60.0,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 12.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Kolors.kOffWhite,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12.0,
                color: Kolors.kOffWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
