import 'package:flutter/material.dart';

class PayMentMehtodItems extends StatelessWidget {
  const PayMentMehtodItems({
    super.key,
    required this.isActive,
    required this.image,
  });
  final bool isActive;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      child: Container(
        width: 105,
        height: 65,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: isActive ? Colors.green : Colors.grey.withOpacity(0.8),
                  width: 1.55),
              borderRadius: BorderRadius.circular(18)),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Center(
            child: Image.asset(
              image,
              height: 50,
              width: 50,
            ),
          ),
        ),
      ),
    );
  }
}
