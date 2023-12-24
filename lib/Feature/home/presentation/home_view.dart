import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/home/logic/cubit/home_cubit.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubite = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          body: cubite.views()[cubite.currentIndex],
          bottomNavigationBar: bottomNavBar(cubite, context),
        );
      },
    );
  }

  BottomNavigationBar bottomNavBar(HomeCubit cubit, BuildContext context) {
    return BottomNavigationBar(
      elevation: 20,
      selectedItemColor: ColorManger.primaryColor,
      unselectedIconTheme: IconThemeData(color: ColorManger.darkGreyColor),
      unselectedLabelStyle: AppStyle.font12Blackmedium,
      currentIndex: cubit.currentIndex,
      onTap: (index) {
        cubit.changeBottomIndex(index, context);
      },
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explor"),
        BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_rounded), label: "Detact"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
