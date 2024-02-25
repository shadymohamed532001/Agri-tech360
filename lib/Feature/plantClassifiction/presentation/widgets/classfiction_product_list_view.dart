import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_care_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/classfication_product_item.dart';

class ClassfictionProductListView extends StatelessWidget {
  const ClassfictionProductListView({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  final PlantCareCubite cubit;

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
              cubit.classfictionModel?.data.products.length ?? 0,
              (index) {
                return const ClassfictionProductItem();
              },
            ),
          ),
        ),
      ),
    );
  }
}
