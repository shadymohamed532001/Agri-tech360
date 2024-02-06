import 'package:flutter/material.dart';

class ChekPlantClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 1.0050133, size.height * -0.0020320);
    path_0.lineTo(size.width, size.height * 0.3041872);
    path_0.quadraticBezierTo(size.width * 1.0004800, size.height * 0.3390640,
        size.width * 0.9064533, size.height * 0.3688793);
    path_0.cubicTo(
        size.width * 0.7481867,
        size.height * 0.4128079,
        size.width * 0.5351467,
        size.height * 0.4486207,
        size.width * 0.4085333,
        size.height * 0.4927709);
    path_0.cubicTo(
        size.width * 0.3520800,
        size.height * 0.5136576,
        size.width * 0.2596267,
        size.height * 0.5538300,
        size.width * 0.1303467,
        size.height * 0.5556158);
    path_0.cubicTo(
        size.width * 0.0441600,
        size.height * 0.5575000,
        size.width * 0.0020533,
        size.height * 0.4972044,
        size.width * -0.0031467,
        size.height * 0.4691502);
    path_0.quadraticBezierTo(size.width * -0.0029333, size.height * 0.4692241,
        size.width * -0.0056533, size.height * 0.3673768);
    path_0.lineTo(size.width * 0.0005067, size.height * -0.0007266);

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
