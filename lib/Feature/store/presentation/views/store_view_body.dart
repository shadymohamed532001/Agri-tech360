import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartsoil/Feature/store/logic/cubit/store_cubit.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/app_search_bar.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/hellow_row.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/traidment_card.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/primary_header_continer.dart';

class StoreViewBody extends StatelessWidget {
  const StoreViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        StoreCubit cubit = BlocProvider.of<StoreCubit>(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                PrimaryHeaderContiner(
                  height: MediaQuery.of(context).size.height / 3.6,
                  child: Column(
                    children: [
                      const HellowRow(),
                      verticalSpacing(25),
                      AppSearchBar(width2: 330.w),
                    ],
                  ),
                ),
                FadeInUp(
                  duration: const Duration(milliseconds: 700),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 16.h),
                        child: GridView.count(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1 / 1.5,
                          mainAxisSpacing: 20,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(
                            cubit.productResult.length,
                            (index) {
                              return TraidmentProductCard(
                                productModel: cubit.productResult[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorManger.primaryColor,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 400.h,
                    decoration: BoxDecoration(
                      color: ColorManger.whiteColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Your content here',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Icon(
              Iconsax.add,
            ),
          ),
        );
      },
    );
  }
}
