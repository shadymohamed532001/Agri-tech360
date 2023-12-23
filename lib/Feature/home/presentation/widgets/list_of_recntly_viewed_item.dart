import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/recntly_viewed_item.dart';

class ListOfRecntlyViewedItem extends StatelessWidget {
  const ListOfRecntlyViewedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h,
        width: double.infinity,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          itemCount: 22,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(right: 16),
              child: RecntlyViewedItem(),
            );
          },
        ));
  }
}
