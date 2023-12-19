import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/detact/presentation/detact_view.dart';
import 'package:smartsoil/Feature/explor/presentation/explor_view.dart';
import 'package:smartsoil/Feature/helper_view/data/repositories/helper_view.repo.dart';
import 'package:smartsoil/Feature/helper_view/logic/helper_view_cubite.dart';
import 'package:smartsoil/Feature/home/presentation/home_view.dart';
import 'package:smartsoil/Feature/profile/presentation/profile_view.dart';

class HelperViewRepoImpl extends HelperViewRepo {
  @override
  void changeBottomNavIndex(int index, BuildContext context) {
    context.read<HelperViewCubit>().currentIndex = index;
  }

  @override
  List<Widget> views() {
    return [
      const HomeView(),
      const ExplorView(),
      const DetactView(),
      const ProfileView()
    ];
  }
}
