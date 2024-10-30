import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:gromuse/commons/widgets/app_style.dart';
import 'package:flutter/material.dart';

class HeaderDiagnostic extends StatelessWidget {
  const HeaderDiagnostic({
    super.key,
    required this.onViewAllPressed,
  });

  final VoidCallback onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Top Diagnostic Test',
            style: appStyle(18, Kolors.kDark.withOpacity(.7), FontWeight.bold),
          ),
          TextButton(
            onPressed: onViewAllPressed,
            child: Text(
              'View All',
              style: appStyle(15, Kolors.kPrimaryLight, FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
