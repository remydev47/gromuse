import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/commons/widgets/app_style.dart';

class Featuredstoresheader extends StatelessWidget {
  const Featuredstoresheader({
    super.key,
    required this.onViewAllPressed,
  });

  final VoidCallback onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Featured Stores',
            style: appStyle(18, Kolors.kDark.withOpacity(.7), FontWeight.bold),
          ),
          TextButton(
            onPressed: () => context.go('/featuredstores'),
            child: Text(
              'View All',
              style: appStyle(15, Kolors.kPrimary, FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
