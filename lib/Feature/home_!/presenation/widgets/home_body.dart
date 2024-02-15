import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/layout/logic/cubit/layout_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        // LayoutCubit cubit = LayoutCubit.getObject(context);

        if (state is GetweatherDataLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetweatherDataSuccessState) {
          return const Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Get Weather data body'),
                ),
              ],
            ),
          );
        } else if (state is GetweatherDataErrorState) {
          return const CircleAvatar();
        } else {
          return const Text('ssssssssssssssssssssssssssssssssss');
        }
      },
    );
  }
}
