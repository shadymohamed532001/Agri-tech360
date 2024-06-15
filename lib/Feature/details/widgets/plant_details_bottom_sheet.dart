import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class AddNotficationBottomSheet {
  static void show({
    required BuildContext context,
  }) {
    showModalBottomSheet<Widget>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const PlantDetailsBottomSheet(),
    );
  }
}

class PlantDetailsBottomSheet extends StatefulWidget {
  const PlantDetailsBottomSheet({
    super.key,
  });

  @override
  State<PlantDetailsBottomSheet> createState() =>
      _PlantDetailsBottomSheetState();
}

class _PlantDetailsBottomSheetState extends State<PlantDetailsBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _initController();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExplorCubit, ExplorState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          child: BottomSheet(
            showDragHandle: true,
            enableDrag: true,
            animationController: _animationController,
            onDragStart: (_) {
              _animationController.forward();
            },
            onClosing: () => context.pop(),
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                right: 15.w,
                left: 15.w,
                bottom: 30.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Daily Reminder ⏱️',
                    style: AppStyle.font17Blacksemibold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Are you sure you want to set up a reminder for this plant to be watered every day?',
                    style: AppStyle.font14Greyregular.copyWith(
                      color: ColorManger.darkGreyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomBottom(
                          backgroundColor:
                              ColorManger.primaryColor.withOpacity(0.24),
                          borderColor:
                              ColorManger.primaryColor.withOpacity(0.24),
                          onPressed: () => context.pop(),
                          bottomtext: 'Cancel',
                          textBottomStyle: AppStyle.font14Primarysemibold,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: CustomBottom(
                          onPressed: () {
                            BlocProvider.of<ExplorCubit>(context)
                                .addDailyNotification();
                            context.pop();
                          },
                          backgroundColor: ColorManger.primaryColor,
                          bottomtext: 'Yes, add',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
