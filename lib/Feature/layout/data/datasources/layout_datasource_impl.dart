import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartsoil/Feature/home_!/presenation/widgets/home_body.dart';
import 'package:smartsoil/Feature/layout/data/datasources/layout_datasource.dart';
import 'package:smartsoil/Feature/layout/domain/entity/change_index_params.dart';
import 'package:smartsoil/Feature/layout/logic/cubit/layout_cubit.dart';

class LayoutDataSourceImpl extends LayoutDataSource {
  @override
  void changeBottomNavIndex({required ChangeIndexParams changeIndexParams}) {
    LayoutCubit.getObject(changeIndexParams.context).currentIndex =
        changeIndexParams.index!;
  }

  @override
  void changeBottomNavToHome({required ChangeIndexParams changeIndexParams}) {
    LayoutCubit.getObject(changeIndexParams.context).currentIndex = 0;
  }

  @override
  List<Widget> getBody() {
    return const <Widget>[
      HomeBody(),
      // ShimmerHomeBody(),
      // Try(),
      // Try(),
    ];
  }

  @override
  List<BottomNavigationBarItem> getBottomNavItems() =>
      const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Iconsax.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Badge(
            label: Text('5'),
            child: Icon(Iconsax.card),
          ),
          label: 'Card',
        ),
        BottomNavigationBarItem(
          label: 'Favorite',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.user),
          label: 'Profile',
        ),
      ];

  @override
  Future<dynamic> getUserData() async {
    // try {
    //   final response = await ApiServices.getData(
    //     endpoint: homeendPoint,
    //   );
    //   return HomeModel.fromJson(response);
    // } catch (e) {
    //   throw ServerFailure(e.toString());
    // }
  }
}
