// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/Feature/home/logic/cubit/home_cubit.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/weather_degree_item.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class ListOfWeatherDegreeItem extends StatelessWidget {
  const ListOfWeatherDegreeItem({
    super.key,
    required this.weathermodelData,
  });

  final List<Weathermodel> weathermodelData;

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (homeCubit.weatherResult != null) {
          return SizedBox(
            height: 115.h,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: homeCubit.weatherResult.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.only(
                      right: 16.w,
                    ),
                    child: WeatherDegreeItem(
                      index: index,
                      weatherModels: homeCubit.weatherResult,
                    ));
              },
            ),
          );
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: ColorManger.primaryColor,
          ));
        }
      },
    );
  }
}
