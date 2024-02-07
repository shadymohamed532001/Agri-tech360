import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/explor/presentation/explor_plant_details_view.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ExplorPlantInformation extends StatelessWidget {
  const ExplorPlantInformation({
    super.key,
    required this.cubit,
    required this.index,
  });

  final ExplorCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ExplorPlantDetailsView(
              index: index,
            );
          },
        ));
      },
      child: Container(
        width: double.infinity,
        height: 175.h,
        decoration: BoxDecoration(
          color: ColorManger.whiteColor,
          borderRadius: BorderRadius.circular(
            30,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManger.greyColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 15,
              offset: const Offset(3, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(36),
                  Flexible(
                    child: Text(
                      cubit.explorData()[index].plantName,
                      style: AppStyle.font22BlackBold,
                    ),
                  ),
                  verticalSpacing(16),
                  SizedBox(
                    width: 220.w,
                    height: 80.h,
                    child: Text(
                      cubit.explorData()[index].plantShortDescription,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.font12Greyregular,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                cubit.explorData()[index].plantimagepath,
                height: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
