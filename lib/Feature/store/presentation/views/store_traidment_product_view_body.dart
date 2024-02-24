import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/store/presentation/widgets/traidment_card.dart';

class StoreTraidmentProductBody extends StatelessWidget {
  const StoreTraidmentProductBody({Key? key, required this.cubit})
      : super(key: key);
  final ExplorCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FadeInRight(
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
              10,
              (index) {
                return const TraidmentProductCard();
              },
            ),
          ),
        ),
      ),
    );
  }
}
