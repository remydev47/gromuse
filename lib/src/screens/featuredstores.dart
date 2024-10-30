import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gromuse/commons/utils/app_routes.dart';
import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/commons/widgets/app_style.dart';

class Featuredstores extends StatelessWidget {
  const Featuredstores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/home');
          },
          icon: Icon(
            Icons.arrow_back,
            color: Kolors.kDark,
          ),
        ),
        title: Text(
          'Featured Stores',
          style: appStyle(
            18,
            Kolors.kDark,
            FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
