import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/models/classfiction_model.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/classfiction_product_list_view.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class PlantClassfictionResultBody extends StatelessWidget {
  const PlantClassfictionResultBody({
    Key? key,
    required this.classfictionModel,
  }) : super(key: key);

  final ClassfictionModel classfictionModel;

  @override
  Widget build(BuildContext context) {
    final image = BlocProvider.of<PlantCareCubite>(context).image;
    return Container(
      width: double.infinity,
      height: classfictionModel.products.isEmpty
          ? MediaQuery.of(context).size.height * .3
          : MediaQuery.of(context).size.height * .8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: ColorManger.whiteColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: -60,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: ColorManger.whiteColor,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: image != null ? FileImage(image) : null,
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color.fromARGB(255, 223, 221, 220),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 40.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Plant Name : ',
                            style: AppStyle.font14Blacksemibold,
                          ),
                          Expanded(
                            child: Text(
                              classfictionModel.predictions.split(' ').first,
                              style: AppStyle.font14Blacksemibold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Plant disease : ',
                            style: AppStyle.font14Blacksemibold,
                          ),
                          Expanded(
                            child: Text(
                              classfictionModel.predictions,
                              style: AppStyle.font14Blacksemibold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color.fromARGB(255, 223, 221, 220),
              ),
            ),
          ),
          classfictionModel.products.isEmpty
              ? Positioned.fill(
                  top: 140.h,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'No Product Related To this Plant',
                      style: AppStyle.font17Blacksemibold,
                    ),
                  ),
                )
              : Positioned.fill(
                  top: 160,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClassfictionProductListView(
                    products:
                        BlocProvider.of<PlantCareCubite>(context).productsInfo,
                  ),
                ),
        ],
      ),
    );
  }
}
