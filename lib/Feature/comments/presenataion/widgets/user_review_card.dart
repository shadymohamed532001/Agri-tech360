import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    ImagesAssetsManger.profilePerson,
                  ),
                ),
                horizontalSpacing(10),
                Text(
                  'shady steha',
                  style: AppStyle.font14Blacksemibold,
                ),
              ],
            ),
            const Icon(
              Icons.check_circle,
              color: ColorManger.primaryColor,
              size: 20,
            ),
          ],
        ),
        verticalSpacing(10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xffE5E5E5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Text(
                    '${DateTime.now().day.toString().padLeft(2, '0')} ${_getMonth(DateTime.now().month)} ${DateTime.now().year}',
                    style: AppStyle.font12Blackmedium,
                  ),
                ],
              ),
              verticalSpacing(5),
              ReadMoreText(
                'Plants are not just green decorations adorning our homes and offices; they are powerful contributors to our well-being in numerous ways. From purifying the air we breathe to boosting our mental health, the benefits of having plants around us are manifold.',
                trimLines: 3,
                trimMode: TrimMode.Line,
                trimExpandedText: 'show less',
                trimCollapsedText: 'show more',
                colorClickableText: ColorManger.primaryColor,
                style: AppStyle.font12Blackmedium,
              ),
            ],
          ),
        )
      ],
    );
  }
}

String _getMonth(int month) {
  switch (month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return '';
  }
}
