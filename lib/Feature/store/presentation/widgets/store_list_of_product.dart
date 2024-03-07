import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/store/logic/cubit/store_cubit.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/traidment_card.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/widgets/custom_error_widget.dart';

class StoreListOfProduct extends StatelessWidget {
  const StoreListOfProduct({
    super.key,
    required this.cubit,
  });

  final StoreCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        StoreCubit cubit = BlocProvider.of<StoreCubit>(context);
        if (state is StoreGetProductsSuccess ||
            cubit.productResult.isNotEmpty) {
          return FadeInUp(
            duration: const Duration(milliseconds: 700),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
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
          );
        } else if (state is StoreGetProductsLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorManger.greyColor,
            ),
          );
        } else if (state is StoreGetProductsError) {
          return CustomErrorWidget(
            onPressed: () async {
              await cubit.getProducts();
            },
            error: state.error,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: ColorManger.greyColor,
            ),
          );
        }
      },
    );
  }
}
