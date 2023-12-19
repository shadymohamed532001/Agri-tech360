import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/helper_view/logic/helper_view_cubite.dart';
import 'package:smartsoil/Feature/helper_view/logic/helper_view_states.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class HelperView extends StatelessWidget {
  const HelperView({super.key});

  @override
  Widget build(BuildContext context) {
    var helperViewCubit = context.read<HelperViewCubit>();

    return BlocBuilder<HelperViewCubit, HelperViewState>(
      builder: (context, state) {
        return Scaffold(
            body: helperViewCubit.views()[helperViewCubit.currentIndex],
            bottomNavigationBar: bottomNavBar(helperViewCubit, context));
      },
    );
  }
}

BottomNavigationBar bottomNavBar(HelperViewCubit cubit, BuildContext context) {
  return BottomNavigationBar(
    elevation: 20,
    selectedItemColor: ColorManger.primaryColor,
    unselectedIconTheme: IconThemeData(color: ColorManger.darkGreyColor),
    unselectedLabelStyle: AppStyle.font12Blackmedium,
    currentIndex: cubit.currentIndex,
    onTap: (index) {
      cubit.changeBottomNavIndex(index, context);
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
