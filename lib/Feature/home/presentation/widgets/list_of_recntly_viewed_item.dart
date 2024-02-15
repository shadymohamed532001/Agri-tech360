import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/recntly_viewed_item.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ListOfRecntlyViewedItem extends StatelessWidget {
  const ListOfRecntlyViewedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recently viewed',
            style: AppStyle.font22BlackBold,
          ),
          verticalSpacing(24),
          SizedBox(
              height: 100.h,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
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
              )),
        ],
      ),
    );
  }
}
