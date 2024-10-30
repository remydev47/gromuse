import 'package:flutter/material.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = new Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width/2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path; 
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}

// AppBar(
//         toolbarHeight: 130,
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         flexibleSpace: ClipPath(
//           clipper: CustomShape(),
//           child: Container(
//             height: 250,
//             width: MediaQuery.of(context).size.width,
//             color: Kolors.kDarkTeal,
//           ),
//         ),
//       ),