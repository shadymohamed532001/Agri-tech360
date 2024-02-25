import 'package:flutter/material.dart';

class PlantCareClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 1.0002133, size.height * -0.0062454);
    path_0.lineTo(size.width * 1.0014667, size.height * 0.3656442);
    path_0.lineTo(size.width * 0.6980000, size.height * 0.3652147);
    path_0.quadraticBezierTo(size.width * 0.5363733, size.height * 0.3653988,
        size.width * 0.4690667, size.height * 0.3847239);
    path_0.cubicTo(
        size.width * 0.4224267,
        size.height * 0.3985276,
        size.width * 0.3221867,
        size.height * 0.4149448,
        size.width * 0.2635733,
        size.height * 0.4146258);
    path_0.quadraticBezierTo(size.width * 0.2016533, size.height * 0.4130675,
        size.width * 0.1120000, size.height * 0.3926380);
    path_0.lineTo(size.width * -0.0011200, size.height * 0.3692515);
    path_0.lineTo(size.width * -0.0016267, size.height * -0.0047117);

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
