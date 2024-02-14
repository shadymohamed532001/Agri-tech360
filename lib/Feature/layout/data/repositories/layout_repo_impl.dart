import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/Feature/layout/data/datasources/layout_datasource.dart';
import 'package:smartsoil/Feature/layout/domain/entity/change_index_params.dart';
import 'package:smartsoil/Feature/layout/domain/repositories/layout_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class LayoutRepoImpl extends LayOutRepo {
  final LayoutDataSource layoutDataSource;

  LayoutRepoImpl({required this.layoutDataSource});
  @override
  void changeBottomNavIndex({required ChangeIndexParams changeIndexParams}) {
    layoutDataSource.changeBottomNavIndex(changeIndexParams: changeIndexParams);
  }

  @override
  void changeBottomNavToHome({required ChangeIndexParams changeIndexParams}) {
    layoutDataSource.changeBottomNavToHome(
        changeIndexParams: changeIndexParams);
  }

  @override
  List<Widget> getBody() {
    return layoutDataSource.getBody();
  }

  @override
  List<BottomNavigationBarItem> getBottomNavItems() =>
      layoutDataSource.getBottomNavItems();

  @override
  Future<Either<Failure, WeatherModel>> getUserData() async {
    try {
      final response = await layoutDataSource.getUserData();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
