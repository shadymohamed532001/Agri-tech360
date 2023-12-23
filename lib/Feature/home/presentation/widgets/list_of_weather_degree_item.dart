import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/weather_degree_item.dart';

class ListOfWeatherDegreeItem extends StatelessWidget {
  const ListOfWeatherDegreeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.h,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: 16.w,
            ),
            child: const WeatherDegreeItem(),
          );
        },
      ),
    );
  }
}
