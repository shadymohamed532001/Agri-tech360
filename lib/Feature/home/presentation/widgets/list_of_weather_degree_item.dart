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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeGetWeatherSuccess) {
              List<Weathermodel> weatherModels = state.weatherModel;
              return SizedBox(
                height: 115.h,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: weatherModels.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(
                          right: 16.w,
                        ),
                        child: WeatherDegreeItem(
                          index: index,
                          weatherModels: weatherModels,
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
      },
    );
  }
}
