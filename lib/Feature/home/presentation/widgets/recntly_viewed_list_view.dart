import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/recntly_viewed_item.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/see_all_text_button.dart';
import 'package:smartsoil/core/helper/extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class RecntlyViewedListView extends StatelessWidget {
  const RecntlyViewedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Recently viewed',
                style: AppStyle.font22BlackBold,
              ),
              const Spacer(),
              SeeAllTextButton(
                onTap: () {
                  context.pushName(Routes.recentlySeeAllViewViewRoute);
                },
              )
            ],
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
