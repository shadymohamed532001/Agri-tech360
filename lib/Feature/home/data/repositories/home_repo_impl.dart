import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/explor/presentation/explor_view.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/Feature/home/data/repositories/home_repo.dart';
import 'package:smartsoil/Feature/home/logic/cubit/home_cubit.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/home_view_body.dart';
import 'package:smartsoil/Feature/profile/presentation/profile_view.dart';
import 'package:smartsoil/core/error/failuer.dart';

class HomeRepooImpl extends HomeRepo {
  @override
  void changeBottomNavIndex(int index, BuildContext context) {
    context.read<HomeCubit>().currentIndex = index;
  }

  @override
  Future<Either<Failure, WeatherModels>> getWeather(
      {required String cityName}) {
    throw UnimplementedError();
  }

  @override
  void navigationToPredictPlantView({required BuildContext context}) {}

  @override
  List<Widget> views() {
    return [
      const HomeViewBody(),
      const ExplorView(),
      const ProfileView(),
      const ProfileView()
    ];
  }
}
 
// static Future<Map<String, dynamic>> getData({
//     required String endpoint,
//     Map<String, String>? data,
//     String? token,
//     String? lang,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     dio?.options.headers = {
//       'Authorization': token,
//       'Content-Type': 'application/json',
//       'lang': lang ?? 'en',
//     };

//     Response? response = await dio?.get(
//       endpoint,
//       queryParameters: queryParameters,
//       data: data,
//     );
//     return jsonDecode(response?.data);
//   }
