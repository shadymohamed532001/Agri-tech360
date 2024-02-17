import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/disapled_search_bar.dart';

class ExplorViewBody extends StatelessWidget {
  const ExplorViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExplorCubit, ExplorState>(
      builder: (context, state) {
        ExplorCubit cubit = ExplorCubit.getObject(context);

        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: ColorManger.primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Find your Plant',
                            style: AppStyle.font16Whitebold,
                          ),
                          verticalSpacing(16),
                          const DisabledSearchField(),
                          verticalSpacing(60),
                          Expanded(
                            child: FadeInDown(
                                duration: const Duration(
                                  milliseconds: 700,
                                ),
                                child: Text('')),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
